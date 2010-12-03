//
//  Ball.m
//  Pong3D
//
//  Created by preona on 10/27/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Ball.h"
#import "Namespace.Pong3D.h"

#define Band_Power  4
#define Band_Points 16
#define Band_Mask (Band_Points-2)
#define Sections_In_Band ((Band_Points/2)-1)
#define Total_Points (Sections_In_Band*Band_Points) 
#define Section_Arc (6.28/Sections_In_Band)

#define ballR 1.5

@implementation Ball

@synthesize served, failed, collisionObjects, speed, accel, newBall;

/*
- (void) loadContent:(GraphicsDevice *) content{
	sprite = [[Sprite alloc] init];
	
	Texture2D *racketTexture = nil;//[content load:@"ball"];
	[sprite setTexture: racketTexture];
	
	[sprite setSourceRectangle:[Rectangle rectangleWithX:0 y:0 width:64 height:64]];
	[sprite setOrigin:[Vector2 vectorWithX:0 y:0]];
	[sprite setRelative:[Vector2 vectorWithX:0 y:0]];

}
*/

- (void) loadContent:(GraphicsDevice *) content{
	vertexArray = [[VertexPositionColorArray alloc] initWithInitialCapacity:2];
	
	VertexPositionColorStruct vertex;
	vertex.color = [Color colorWithPercentageRed:1.0 green:0.3 blue:0.0 alpha:1.0].packedValue;
	
	float R = -10 * ballR;
	float dz = 0;

	float x_angle;
	float y_angle;
	
	float x, y, z;
	
	for (int i = 0; i < Total_Points; i++) {  
		
		x_angle=(float)(i&1)+(i>>Band_Power);  
		
		y_angle=(float)((i&Band_Mask)>>1)+((i>>Band_Power)*(Sections_In_Band));
		
		x_angle*=(float)Section_Arc/2.0f;
		y_angle*=(float)Section_Arc*-1; 
		
		
		x = R*sin(x_angle)*sin(y_angle);
		y = R*cos(x_angle);
		z = R*sin(x_angle)*cos(y_angle) + dz;
		
		
		vertex.position = *[Vector3 vectorWithX:x / 10 y:y / 10 z:z / 10].data;
		[vertexArray addVertex:&vertex];
	}
	
	[vertexArray addVertex:&vertex];
	
}

- (void) collisions {
	for (id<CollisionObject> o in collisionObjects) {
		Vector3 *a = [o collide:speed :position : accel :ballR];
		
		if ([a length] > 0) {
			accel.x = (accel.x + a.x/10) / 2;
			accel.y = (accel.y + a.y/10) / 2;
		}
		//[accel multiplyBy:1.0/([accel length] + 1)];
	}
	[newBall collisions];
}

- (Vector3 *) cloneVector: (Vector3 *) v {
	return [Vector3 vectorWithX:v.x y:v.y z:v.z];
}

- (void) move {
	if (served && !failed) {
		[speed add:accel];
		[position add:speed];
		
		[self collisions];
	
		[accel multiplyBy:0.95];
		
		if (fabsf(speed.z) < 1) speed.z *= 1.2;
		if (fabsf(speed.z) > 1) speed.z = speed.z < 0 ? -1 : 1;
		
		[newBall move];
	}
	
	if (timer != 0 && newBall == nil && 
			[[NSDate dateWithTimeIntervalSinceNow:0] timeIntervalSince1970] - timer > 30 && 
			position.z > -30 && position.z < -20) {
		NSLog(@"New ball");
		newBall = [[Ball alloc] initWithScore:score];
		[newBall loadContent:nil];
		[newBall setCollisionObjects:collisionObjects];
		newBall.position = [[self cloneVector:position] retain];
		newBall.speed = [[self cloneVector:speed] retain];
		newBall.accel = [[self cloneVector:accel] retain];
		newBall.speed.z *= -0.3;
		newBall.served = YES;
	}
}

- (void) stop: (Racket *) r {
	NSLog(@"stop %@", speed);
	
	speed = [[Vector3 vectorWithX:0.0 y:0.0 z:0.0] retain];
	accel = [[Vector3 vectorWithX:0.0 y:0.0 z:0.0] retain];
	failed = YES;
	
	[newBall stop:r];
	
	timer = 0;
	
	[score addScore:r.side];
}

- (void) restartPosition {
	//NSLog(@"%@ %@", speed, accel);
	position = [[Vector3 vectorWithX:0.0 y:0.0 z:-ballR] retain];
	served = NO;
	failed = NO;
	
	[newBall release], newBall = nil;
}

- (void) draw:(BasicEffect *)effect :(GraphicsDevice *)graphicsDevice: (SpriteBatch *)spriteBatch {
	[self move];
	
	effect.world = [Matrix createTranslation:position];
	
	[[effect.currentTechnique.passes objectAtIndex:0] apply];
	
	[graphicsDevice drawUserPrimitivesOfType:PrimitiveTypeTriangleStrip
									vertices:vertexArray startingAt:0 count:[vertexArray count]];

	effect.world = [Matrix identity];
	
	[newBall draw:effect :graphicsDevice :spriteBatch];
}


- (void) addCollisionObject: (id<CollisionObject>) o {
	[collisionObjects addObject:o];
}

- (void) serve : (Vector3 *) racketSpeed {
	speed.z = -1;
	
	accel.x = racketSpeed.x / 60;
	accel.y = racketSpeed.y / 60;
	
	served = YES;
	
	timer = [[NSDate dateWithTimeIntervalSinceNow:0] timeIntervalSince1970];
	
	NSLog(@"serve %@", accel);
}

- (id) initWithScore: (Score *) s
{
	self = [super init];
	if (self != nil) {
		score = [s retain];
		position = [[Vector3 alloc] init];
		speed = [[Vector3 vectorWithX:0.0 y:0.0 z:0.0] retain];
		accel = [[Vector3 vectorWithX:0.0 y:0.0 z:0.0] retain];
		collisionObjects = [[NSMutableArray alloc] init];
		served = NO;
		failed = NO;
	}
	return self;
}

@synthesize position;

- (void) dealloc
{
	[position release];
	[speed release];
	[accel release];
	[collisionObjects release];
	[score release];
	[super dealloc];
}

@end
