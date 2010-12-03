//
//  GameWindow.m
//  XNI
//
//  Created by Matej Jan on 20.7.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "GameWindow.h"
#import "GameWindow+Internal.h"

#import "Retronator.Xni.Framework.h"
#import "GameViewController.h"
#import "GameView.h"

@interface GameWindow()

- (Rectangle*) calculateClientBounds;

@end


@implementation GameWindow

- (id) init {
    if (self = [super init]) {
        currentOrientation = DisplayOrientationDefault;
        clientSizeChanged = [[Event alloc] init];
		orientationChanged = [[Event alloc] init];
		
		clientBounds = [[Rectangle rectangleWithCGRect:[[UIScreen mainScreen] bounds]] retain];		
    }
    return self;
}

// PROPERTIES

@synthesize clientBounds;
@synthesize currentOrientation;

@synthesize clientSizeChanged;
@synthesize orientationChanged;

- (id) handle {
    return (id)gameViewController.view.layer;
}

// METHODS

- (void) beginScreenDeviceChangeWithFullscreen:(BOOL)willBeFullscreen {
    gameViewController.wantsFullScreenLayout = willBeFullscreen;
    [[UIApplication sharedApplication] setStatusBarHidden:willBeFullscreen];
    gameViewController.view.frame = [UIScreen mainScreen].applicationFrame;
    clientBounds = [[self calculateClientBounds] retain];
}

- (void) endScreenDeviceChange {
    
}

- (void) initialize {
	// Create UI window.
	window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	
	// Create game view controller.
	gameViewController = [[GameViewController alloc] initWithGameWindow:self];
	[((GameView*)gameViewController.view).viewSizeChanged
	 subscribeDelegate:[Delegate delegateWithTarget:self Method:@selector(gameViewSizeChanged)]];
	
	// Add the game view to the window.
	[window addSubview: gameViewController.view];
	
	// Present the window.
	[window makeKeyAndVisible];	
}

- (void) setSupportedOrientations:(DisplayOrientation)orientations {
	gameViewController.supportedOrientations = orientations;
}

- (void) gameViewSizeChanged {
	Rectangle *newClientBounds = [self calculateClientBounds];
    if (![newClientBounds equals:clientBounds]) {
		[clientBounds release];
        clientBounds = [newClientBounds retain];
        [clientSizeChanged raiseWithSender:self];
    }
}

- (Rectangle*) calculateClientBounds {
	Rectangle *bounds = [Rectangle rectangleWithCGRect:gameViewController.view.bounds];
	float scale = [UIScreen mainScreen].scale;
	bounds.width *= scale;
	bounds.height *= scale;
	return bounds;
}

- (void) dealloc
{
	[clientBounds release];
    [gameViewController release];
    [window release];
    [super dealloc];
}

@end
