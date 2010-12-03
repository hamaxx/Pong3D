//
//  Level.h
//  Pong3D
//
//  Created by Matej Jan on 20.10.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Namespace.Pong3D.classes.h"

/**
 Represents a game level and implements all the generic things shared by all levels.
 */
@interface Level : GameComponent {

	Scene *scene;

	Racket *home;
	Racket *opponent;
	Ball *ball;
	Background *background;
	Score *score;
}

/**
 The scene is a data structure that holds all scene objects in the current level.
 */
@property (nonatomic, retain) Scene *scene;

/**
 Resets the level to its initial conditions;
 */
- (void) reset;

@end
