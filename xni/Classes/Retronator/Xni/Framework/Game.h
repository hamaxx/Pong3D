//
//  Game.h
//  XNI
//
//  Created by Matej Jan on 27.7.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "System.h"

#import "Retronator.Xni.Framework.classes.h"
#import "Retronator.Xni.Framework.Graphics.classes.h"
#import "Retronator.Xni.Framework.Content.classes.h"

@interface Game : NSObject <UIApplicationDelegate> {
@private
    // Host
    GameHost *gameHost;
    
    // Graphics device
    id<IGraphicsDeviceManager> graphicsDeviceManager;
    id<IGraphicsDeviceService> graphicsDeviceService;
    
    // State
    BOOL initializeDone;
    BOOL inRun;
    BOOL isActive;
    
    // Game loop timing
    BOOL isFixedTimeStep;
	NSTimeInterval maximumElapsedTime;
    NSTimeInterval targetElapsedTime;
    NSTimeInterval inactiveSleepTime;
    GameTime *gameTime;
    NSDate *currentFrameTime;
    NSDate *lastFrameTime;
	
	// Content manager
	ContentManager *content;
    
    // Game components
    GameComponentCollection *components;
	NSMutableArray *enabledComponents;
	NSMutableArray *visibleComponents;
	NSMutableArray *componentsList;
	
	NSMutableSet *initializedComponents;
    	
    // Services
    GameServiceContainer *services;	
	
	// Events
	Event *activated, *deactivated, *disposed, *exiting;
}

@property (nonatomic, readonly) GameWindow *window;
@property (nonatomic, readonly) GraphicsDevice *graphicsDevice;

@property (nonatomic, readonly) BOOL isActive;

@property (nonatomic) BOOL isFixedTimeStep;
@property (nonatomic) NSTimeInterval targetElapsedTime;
@property (nonatomic) NSTimeInterval inactiveSleepTime;

@property (nonatomic, retain) ContentManager *content;
@property (nonatomic, readonly) GameComponentCollection *components;
@property (nonatomic, readonly) GameServiceContainer *services;

@property (nonatomic, readonly) Event *activated, *deactivated, *disposed, *exiting;

- (void) run;
- (void) tick;

// Virtual methods to be implemented in the game.
- (void) initialize;
- (void) loadContent;
- (void) beginRun;
- (void) updateWithGameTime:(GameTime*)gameTime;
- (BOOL) beginDraw;
- (void) drawWithGameTime:(GameTime*)gameTime;
- (void) endDraw;
- (void) unloadContent;
- (void) endRun;

@end
