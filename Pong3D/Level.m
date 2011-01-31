//
//  Level.m
//  Pong3D
//
//  Created by Matej Jan on 20.10.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "Level.h"

#import "Namespace.Pong3D.h"
#import "JSON.h"

@implementation Level

- (id) initWithGame:(Game *)theGame
{
	self = [super initWithGame:theGame];
	if (self != nil) {
		// Create the scene.
		scene = [[Scene alloc] init];
		
		// Create common scene items.
		score = [[Score alloc] init];
		menu = [[Menu alloc] initWithLevel:self:score];
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
		[scene addItem:menu];
	}
	return self;
}

@synthesize scene;

- (void) initialize {
	NSLog(@"Loading level.");
	[super initialize];
	//[self reset];
	
	[self loadSaved];
}

// Override this in children implementations.
- (void) reset {
	NSLog(@"Resetting level.");
}

- (void) loadSaved {
	NSLog(@"Load saved level.");
}

- (NSArray *) vectorToArray:(Vector3 *)vector {
	return [NSArray arrayWithObjects:[NSNumber numberWithFloat: vector.x], [NSNumber numberWithFloat: vector.y], [NSNumber numberWithFloat: vector.z], nil];
}

- (NSMutableDictionary *) racketState: (Racket *) racket {
	NSMutableDictionary *s = [[NSMutableDictionary alloc] init];
	[s setObject:[self vectorToArray: racket.position] forKey:@"pos"];
	return [s autorelease];
}

- (NSMutableDictionary *) ballState: (Ball *) theBall {
	NSMutableDictionary *ballState = [[NSMutableDictionary alloc] init];
	[ballState setObject:[self vectorToArray: theBall.speed] forKey:@"speed"];
	[ballState setObject:[self vectorToArray: theBall.accel] forKey:@"accel"];
	[ballState setObject:[self vectorToArray: theBall.position] forKey:@"pos"];
	return [ballState autorelease];
}

- (NSMutableDictionary *) scoreState: (Score *) theScore {
	NSMutableDictionary *s = [[NSMutableDictionary alloc] init];
	[s setObject:[NSNumber numberWithInt: theScore.home] forKey:@"home"];
	[s setObject:[NSNumber numberWithInt: theScore.away] forKey:@"away"];
	return [s autorelease];
}

//ball(speed, acc, position), rackets(position), score(points, level, lives)
- (void) saveState {
	
	NSMutableDictionary *state = [[NSMutableDictionary alloc] init];
	[state setObject:[self racketState:home] forKey:@"home"];
	[state setObject:[self racketState:opponent] forKey:@"away"];
	[state setObject:[self ballState:ball] forKey:@"ball"];
	[state setObject:[self scoreState:score] forKey:@"score"];
	
	//TODO save score and level
	
	SBJsonWriter *writer = [[SBJsonWriter alloc] init];
	
	NSString *save = [writer stringWithObject:state];
	NSLog(@"save %@", save);
	
	NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"save.json"];
	
	NSError *error;
	[save writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:&error];
	NSLog(@"saved %@", error);
	
	[writer release];
	[state release];
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
