//
//  TouchPanel.m
//  XNI
//
//  Created by Matej Jan on 29.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "TouchPanel.h"
#import "TouchPanel+Internal.h"

#import "Retronator.Xni.Framework.h"
#import "Retronator.Xni.Framework.Input.Touch.h"

@interface XniTouchLocation : NSObject {
	int identifier;
	Vector2 *position;
	Vector2 *previousPosition;
	TouchLocationState state;
}

- (id) initWithPosition:(Vector2*)thePosition;

@property (nonatomic) TouchLocationState state;

- (void) moveIfPressed;
- (void) moveToPosition:(Vector2*)newPosition;

- (TouchLocation*) createTouchLocation;

@end

@implementation XniTouchLocation

static int nextID = 0;

- (id) initWithPosition:(Vector2*)thePosition
{
	self = [super init];
	if (self != nil) {
		identifier = nextID++;
		position = [thePosition retain];
		previousPosition = nil;
		state = TouchLocationStatePressed;
	}
	return self;
}

@synthesize state;

- (void) moveIfPressed {
	if (state == TouchLocationStatePressed) {
		state = TouchLocationStateMoved;
	}
}

- (void) moveToPosition:(Vector2*)newPosition {
	[previousPosition release];
	previousPosition = position;
	position = [newPosition retain];
	state = TouchLocationStateMoved;
}

- (TouchLocation *) createTouchLocation {
	return [[[TouchLocation alloc] initWithIdentifier:identifier 
											 position:[Vector2 vectorWithVector:position] 
									 previousPosition:previousPosition ? [Vector2 vectorWithVector:previousPosition] : nil
												state:state] autorelease];
}

- (void) dealloc
{
	[position release];
	[previousPosition release];
	[super dealloc];
}

@end

@implementation TouchPanel

static TouchPanel *instance;

- (id) init
{
	self = [super init];
	if (self != nil) {
		addTouches = [[NSMutableSet alloc] init];
		removeTouches = [[NSMutableSet alloc] init];
		releaseTouches = [[NSMutableSet alloc] init];
		lateReleaseTouches = [[NSMutableSet alloc] init];
		
		touchLocations = (NSMutableDictionary*)CFDictionaryCreateMutable(NULL, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
	}
	return self;
}

+ (void) initialize {
	instance = [[TouchPanel alloc] init];
}

@synthesize displayWidth;
@synthesize displayHeight;
@synthesize displayOrientation;
@synthesize enabledGestures;

+ (TouchCollection*) getState {
	return [instance getState];
}

+ (GestureSample*) readGesture {
	return [instance readGesture];
}


+ (TouchPanel*) getInstance {
    return instance;
}

- (void) setView:(UIView *)theView {
	view = theView;
}

- (BOOL) isGestureAvailable{
	return NO;
}

- (TouchCollection*) getState{
	TouchCollection *collection = [[[TouchCollection alloc] init] autorelease];
	for (XniTouchLocation *touch in [touchLocations allValues]) {
		[collection addObject:[touch createTouchLocation]];
		
		// After get state is done, all pressed touches should be moved.
		[touch moveIfPressed];
	}
	return collection;
}

- (GestureSample*) readGesture{
	return nil;
}

// Internal methods

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	[addTouches unionSet:touches];
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	float scale = [UIScreen mainScreen].scale;
	for (UITouch *touch in touches) {
		XniTouchLocation *location = [touchLocations objectForKey:touch];	
		if (location) {			
			CGPoint position = [touch locationInView:view];
			[location moveToPosition:[Vector2 vectorWithX:position.x * scale y:position.y * scale]];
		}
	}
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	for (UITouch *touch in touches) {
		if ([addTouches containsObject:touch]) {
			[lateReleaseTouches addObject:touch];
		} else {
			[releaseTouches addObject:touch];
		}
	}
}

- (void) touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
	// Just remove the touch locations so they dissapear from the state (without released happening).
	for (UITouch *touch in touches) {
		[touchLocations removeObjectForKey:touch];
	}	
}

- (void) update {
	// Remove all previously released touches.
	for (UITouch *touch in removeTouches) {
		[touchLocations removeObjectForKey:touch];
	}
	[removeTouches removeAllObjects];
	
	// Set released touches.
	for (UITouch *touch in releaseTouches) {
		XniTouchLocation *location = [touchLocations objectForKey:touch];
		location.state = TouchLocationStateReleased;
	}
	
	// Shift the pools.
	NSMutableSet *temp = removeTouches;
	removeTouches = releaseTouches;
	releaseTouches = lateReleaseTouches;
	lateReleaseTouches = temp;
	
	// Add new touches
	float scale = [UIScreen mainScreen].scale;
	for (UITouch *touch in addTouches) {
		CGPoint position = [touch locationInView:view];
		XniTouchLocation *location = [[[XniTouchLocation alloc] 
											initWithPosition:[Vector2 vectorWithX:position.x * scale y:position.y * scale]] autorelease];
		if (position.x == 0 && position.y == 0) {
			NSLog(@"BOOMSDFS");
		}
		
		CFDictionaryAddValue((CFMutableDictionaryRef)touchLocations, touch, location);
	}
	[addTouches removeAllObjects];
	
}

- (void) dealloc
{
	[addTouches release];
	[removeTouches release];
	[releaseTouches release];
	[lateReleaseTouches release];
	[touchLocations release];
	[super dealloc];
}



@end
