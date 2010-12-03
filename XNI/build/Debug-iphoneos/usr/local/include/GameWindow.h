//
//  GameWindow.h
//  XNI
//
//  Created by Matej Jan on 20.7.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "System.h"

#import "Retronator.Xni.Framework.classes.h"
@class GameViewController;

@interface GameWindow : NSObject {
    Rectangle *clientBounds;
    DisplayOrientation currentOrientation;
    Event *clientSizeChanged;
    Event *orientationChanged;
    
    UIWindow *window;
    GameViewController *gameViewController;
}

@property (nonatomic, readonly) Rectangle *clientBounds;
@property (nonatomic, readonly) DisplayOrientation currentOrientation;
@property (nonatomic, readonly) id handle;

@property (nonatomic, readonly) Event *clientSizeChanged;
@property (nonatomic, readonly) Event *orientationChanged;

- (void) beginScreenDeviceChangeWithFullscreen:(BOOL)willBeFullscreen;
- (void) endScreenDeviceChange;

- (void) setSupportedOrientations:(DisplayOrientation)orientations;

@end

