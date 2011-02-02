//
//  GameTime.m
//  XNI
//
//  Created by Matej Jan on 27.7.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "GameTime.h"


@implementation GameTime

- (id) initWithElapsedGameTime:(NSTimeInterval)theElapsedGameTime totalGameTime:(NSTimeInterval)theTotalGameTime {
	if (self = [super init]) {
		elapsedGameTime = theElapsedGameTime;
		totalGameTime = theTotalGameTime;
	}
	return self;
}

- (id) initWithElapsedGameTime:(NSTimeInterval)theElapsedGameTime totalGameTime:(NSTimeInterval)theTotalGameTime isRunningSlowly:(BOOL)runningSlowly {
	if (self = [super init]) {
		elapsedGameTime = theElapsedGameTime;
		totalGameTime = theTotalGameTime;
		isRunningSlowly = runningSlowly;
	}
	return self;
}

+ (GameTime*) gameTime {
	return [[[GameTime alloc] init] autorelease];
}

+ (GameTime*) gameTimeWithElapsedGameTime:(NSTimeInterval)theElapsedGameTime totalGameTime:(NSTimeInterval)theTotalGameTime {
	return [[[GameTime alloc] initWithElapsedGameTime:theElapsedGameTime totalGameTime:theTotalGameTime] autorelease];
}

+ (GameTime*) gameTimeWithElapsedGameTime:(NSTimeInterval)theElapsedGameTime totalGameTime:(NSTimeInterval)theTotalGameTime isRunningSlowly:(BOOL)runningSlowly {
	return [[[GameTime alloc] initWithElapsedGameTime:theElapsedGameTime totalGameTime:theTotalGameTime isRunningSlowly:runningSlowly] autorelease];
}

@synthesize elapsedGameTime;
@synthesize totalGameTime;
@synthesize isRunningSlowly;

@end
