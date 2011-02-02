//
//  GameWindow+Internal.h
//  XNI
//
//  Created by Retro on 31.10.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "GameWindow.h"

@interface GameWindow (Internal)

- (void) initialize;

@property (nonatomic, readonly) GameViewController *gameViewController;
@property (nonatomic, readonly) UIWindow *window;

@end
