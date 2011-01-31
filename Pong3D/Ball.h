//
//  Ball.h
//  Pong3D
//
//  Created by preona on 10/27/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Namespace.Pong3D.classes.h"

@interface Ball : NSObject <GameObject> {
	Vector3 *position;
	Vector3 *speed;
	Vector3 *accel;
	
	NSTimeInterval timer;
	
	Sprite *sprite;
	
	VertexPositionColorArray *vertexArray;
	
	NSMutableArray * collisionObjects;
	
	BOOL served;
	BOOL failed;
	
	Score *score;
	
	Ball *newBall;
	
	CGFloat rotateX;
	CGFloat rotateY;
}

@property (nonatomic) BOOL served;
@property (nonatomic) BOOL failed;

@property (nonatomic, retain) NSMutableArray * collisionObjects;

@property (nonatomic, retain) Ball * newBall;
@property (nonatomic, retain) Vector3 * speed;
@property (nonatomic, retain) Vector3 * accel;

- (id) initWithScore: (Score *) s;

- (void) addCollisionObject: (id<CollisionObject>) o;
- (void) serve : (Vector3 *) racketSpeed;

- (void) stop: (Racket *) r;
- (void) restartPosition;

@end
