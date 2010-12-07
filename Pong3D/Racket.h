//
//  SceneObject1.h
//  Pong3D
//
//  Created by Matej Jan on 20.10.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Namespace.Pong3D.classes.h"

/**
 Represents a certain type of a gameplay object.
 It only has a position property for now.
 
 You should rename this according to what object this represents (Pacman, Ghost, Brick, Ball, Wall ...)
 */
@interface Racket : NSObject <GameObject, CollisionObject> {
	Vector3 *position;
	Vector3 *speed;
	
	NSInteger side;
	NSMutableArray *sprites;
	
	VertexPositionColorArray *vertexArray;
	
	Ball *ball;
	
	BOOL touchState;
	
	CGFloat computerSpeed;
	CGFloat computerAccX;
	CGFloat computerAccY;
}

@property (nonatomic) NSInteger side;

- (id) initWithBall: (Ball *) b :(NSInteger) s;

@end
