//
//  Guide.m
//  XNI
//
//  Created by Matej Jan on 7.12.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "Guide.h"
#import "Guide+Internal.h"

#import "Retronator.Xni.Framework.h"

#import "GameWindow+Internal.h"
#import "GameViewController.h"

@implementation Guide

static Guide *instance = nil;

- (id) initWithGame:(Game*)theGame;
{
	self = [super init];
	if (self != nil) {
		game = theGame;
	}
	return self;
}

+ (void) initializeWithGame:(Game *)theGame
{
	if (!instance) {
		instance = [[Guide alloc] initWithGame:theGame];
	}
}

@synthesize isVisible;

+ (void) showAchievements {
	[instance showAchievements];
}

+ (void) showLeaderboard {
	[instance showLeaderboard];
}

+ (Guide*) getInstance {
	return instance;
}

- (void) showAchievements {
	[game.window.gameViewController showAchievementsView];
}

- (void) showLeaderboard {
	[game.window.gameViewController showLeaderboardView];
}

@end
