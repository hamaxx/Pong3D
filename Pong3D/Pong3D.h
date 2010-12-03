//
//  Pong3D.h
//  Pong3D
//
//  Created by Matej Jan on 20.10.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Retronator.Xni.Framework.h"
#import "Retronator.Xni.Framework.Graphics.h"
#import "Retronator.Xni.Framework.Content.h"
#import "Retronator.Xni.Framework.Input.Touch.h"

#import "Namespace.Pong3D.classes.h"

/**
 This is main class of our game.
 */
@interface Pong3D : Game {
	// Graphics
	GraphicsDeviceManager *graphics;
	
	// An array of level classes.
	NSMutableArray *levelClasses;
	
	// Current state
	Level *currentLevel;	
	GameRenderer *currentRenderer;	
}

/**
 Loads and starts a particular level.
 */
- (void) loadLevel:(Class) levelClass;


@end
