//
//  Guide.h
//  XNI
//
//  Created by Matej Jan on 7.12.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GameKit/GameKit.h>

#import "Retronator.Xni.Framework.classes.h"

@interface Guide : NSObject {
	Game *game;
	BOOL isVisible;
}

@property (nonatomic) BOOL isVisible;

+ (void) showAchievements;
+ (void) showLeaderboard;

+ (Guide*) getInstance;

- (void) showAchievements;
- (void) showLeaderboard;

@end
