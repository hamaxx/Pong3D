//
//  GameViewController.h
//  XNI
//
//  Created by Matej Jan on 22.7.10.
//  Copyright 2010 Retronator, Razum. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GameKit/GameKit.h>

#import "Retronator.Xni.Framework.classes.h"

@interface GameViewController : UIViewController <GKAchievementViewControllerDelegate, GKLeaderboardViewControllerDelegate> {
    GameWindow *gameWindow;
	DisplayOrientation supportedOrientations;
}

- initWithGameWindow: (GameWindow*)theGameWindow;

@property (nonatomic) DisplayOrientation supportedOrientations;

+ (DisplayOrientation) getDisplayOrientationForInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation;
+ (UIInterfaceOrientation) getUIInterfaceOrientationFromString:(NSString*)interfaceOrientation;

+ (DisplayOrientation) getSupportedOrientationsFromPlist;
+ (BOOL) getIsFullscreenFromPlist;
   
- (void) showAchievementsView;
- (void) showLeaderboardView;

@end
