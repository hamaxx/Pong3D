//
//  TouchLocation.m
//  XNI
//
//  Created by Matej Jan on 29.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "TouchLocation.h"

@implementation TouchLocation

- (id) initWithIdentifier:(int)theIdentifier position:(Vector2*)thePosition 
		 previousPosition:(Vector2*)thePreviousPosition state:(TouchLocationState)theState;
{
	self = [super init];
	if (self != nil) {
		identifier = theIdentifier;
		position = [thePosition retain];
		previousPosition = [thePreviousPosition retain];
		state = theState;
	}
	return self;
}

@synthesize identifier;
@synthesize position;
@synthesize state;

- (BOOL) tryGetPreviousPosition:(Vector2**)thePeviousPosition {
	if (previousPosition) {
		*thePeviousPosition = previousPosition;
		return YES;
	} else {
		return NO;
	}
}

- (void) dealloc
{
	[position release];
	[previousPosition release];
	[super dealloc];
}


@end
