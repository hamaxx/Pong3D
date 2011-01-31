//
//  Level1.m
//  Pong3D
//
//  Created by Matej Jan on 20.10.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "Level1.h"

#import "Namespace.Pong3D.h"
#import "JSON.h"

@implementation Level1

- (void) reset {
	[super reset];
	
	// Place items to appropriate positions for level 1.
	home.position.x = 0;
	home.position.y = 0;
	home.position.z = 0;
	
	opponent.position.x = 0;
	opponent.position.y = 0;
	opponent.position.z = -50;
	
	ball.position.x = 0;
	ball.position.y = 0;
	ball.position.z = 0;
	
	[ball restartPosition];
	
	score.home = 5;
	score.away = 5;
}

- (Vector3 *) arrayToVector:(NSArray *)arr {
	return [Vector3 vectorWithX:[[arr objectAtIndex:0] floatValue] y:[[arr objectAtIndex:1] floatValue] z:[[arr objectAtIndex:2] floatValue]];
}

- (void) loadSaved {
	[super loadSaved];
	NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"save.json"];
	
	NSError *error;
	NSString *saved = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
	if (!saved) {
		NSLog(@"string failed %@", error);
		[self reset];
		return;
	}
	
	SBJsonParser *parser = [[SBJsonParser alloc] init];
	NSMutableDictionary *dict = [parser objectWithString:saved];
	if (!dict) {
		NSLog(@"json failed");
		[self reset];
		return;
	}
	
	home.position = [self arrayToVector: [[dict objectForKey:@"home"] objectForKey:@"pos"]];
	opponent.position = [self arrayToVector: [[dict objectForKey:@"away"] objectForKey:@"pos"]];

	ball.position = [self arrayToVector: [[dict objectForKey:@"ball"] objectForKey:@"pos"]];
	ball.speed = [self arrayToVector: [[dict objectForKey:@"ball"] objectForKey:@"speed"]];
	ball.accel = [self arrayToVector: [[dict objectForKey:@"ball"] objectForKey:@"accel"]];
	
	ball.failed = YES;
	
	if ([ball.speed length] == 0) {
		[ball restartPosition];
	}

	score.home = [[[dict objectForKey:@"score"] objectForKey:@"home"] intValue];
	score.away = [[[dict objectForKey:@"score"] objectForKey:@"away"] intValue];

	//NSLog(@"%@ %@ %@ %@ %@ %d %d", home.position, opponent.position, ball.position, ball.speed, ball.accel, score.away, score.home);
	
	[parser release];
}

@end
