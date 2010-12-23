//
//  GameHost.h
//  XNI
//
//  Created by Matej Jan on 20.7.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Retronator.Xni.Framework.classes.h"

@interface GameHost : UIApplication {
    BOOL isExiting;
    Game *game; 
    GameWindow *window;
}

@property (nonatomic, readonly) GameWindow *window;

- (void) run;
- (void) exit;

@end
