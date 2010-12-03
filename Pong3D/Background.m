//
//  Background.m
//  Pong3D
//
//  Created by preona on 10/27/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Background.h"
#import "Namespace.Pong3D.h"

@implementation Background
@synthesize position;

CGFloat screenW1 = 10;
CGFloat screenH1 = 15;

- (void) loadContent:(GraphicsDevice *) content{
	NSLog(@"background load content");
	vertexArray = [[VertexPositionColorArray alloc] initWithInitialCapacity:2];
	
	VertexPositionColorStruct vertex;
	
	for (int i = 0; i < 10; i++) {
		int z = -i*5;
		
		vertex.color = [Color white].packedValue;
		vertex.position = *[Vector3 vectorWithX:-10 y:-15 z:z].data;
		[vertexArray addVertex:&vertex];
		
		vertex.position = *[Vector3 vectorWithX:-10 y:15 z:z].data;
		[vertexArray addVertex:&vertex];
		[vertexArray addVertex:&vertex];
		
		vertex.position = *[Vector3 vectorWithX:10 y:15 z:z].data;
		[vertexArray addVertex:&vertex];
		[vertexArray addVertex:&vertex];
		
		vertex.position = *[Vector3 vectorWithX:10 y:-15 z:z].data;
		[vertexArray addVertex:&vertex];
		[vertexArray addVertex:&vertex];
		
		vertex.position = *[Vector3 vectorWithX:-10 y:-15 z:z].data;
		[vertexArray addVertex:&vertex];
	}
}

- (Vector3 *) collide: (Vector3 *) theSpeed :(Vector3 *) thePosition : (Vector3 *)theAccel :(NSInteger) radius {
	if (ABS(thePosition.x) + radius > screenW1) {
		theSpeed.x = ABS(theSpeed.x) * 1 * (thePosition.x < 0 ? 1 : -1) * 0.9;
		thePosition.x = (thePosition.x > 0 ? 1 : -1) * (screenW1 - radius);
		[theAccel multiplyBy:0.9];
	}
	
	if (ABS(thePosition.y) + radius > screenH1) {
		theSpeed.y = ABS(theSpeed.y) * 1 * (thePosition.y < 0 ? 1 : -1) * 0.9;
		thePosition.y = (thePosition.y > 0 ? 1 : -1) * (screenH1 - radius);
		[theAccel multiplyBy:0.9];
	}
	
	return [Vector3 zero];
}

- (void) draw:(BasicEffect *)effect :(GraphicsDevice *)graphicsDevice: (SpriteBatch *)spriteBatch {
	[[effect.currentTechnique.passes objectAtIndex:0] apply];
	
	[graphicsDevice drawUserPrimitivesOfType:PrimitiveTypeLineList
										 vertices:vertexArray startingAt:0 count:40];
	
	effect.world = [Matrix identity];
}

- (id) init
{
	self = [super init];
	if (self != nil) {

	}
	return self;
}

- (void) dealloc
{

	[super dealloc];
}

@end
