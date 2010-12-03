//
//  Level.m
//  Pong3D
//
//  Created by Matej Jan on 20.10.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "Level.h"

#import "Namespace.Pong3D.h"

@implementation Level

- (id) initWithGame:(Game *)theGame
{
	self = [super initWithGame:theGame];
	if (self != nil) {
		// Create the scene.
		scene = [[Scene alloc] init];
		
		// Create common scene items.
		score = [[Score alloc] init];
		ball = [[Ball alloc] initWithScore:score];
		home = [[Racket alloc] initWithBall:ball:0];
		opponent = [[Racket alloc] initWithBall:ball:1];
		background = [[Background alloc] initWithBall:ball];
		
		[ball addCollisionObject:home];
		[ball addCollisionObject:opponent];
		[ball addCollisionObject:background];
		
		// Add all items.
		[scene addItem:background];
		[scene addItem:opponent];
		[scene addItem:ball];
		[scene addItem:home];
		[scene addItem:score];
	}
	return self;
}

@synthesize scene;

- (void) initialize {
	NSLog(@"Loading level.");
	[super initialize];
	[self reset];
}

// Override this in children implementations.
- (void) reset {
	NSLog(@"Resetting level.");
}

- (void) dealloc
{
	NSLog(@"Unloading level.");
	[home release];
	[opponent release];
	[ball release];
	[scene release];
	[super dealloc];
}



@end
