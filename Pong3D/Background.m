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
	vertexArray = [[VertexPositionColorArray alloc] initWithInitialCapacity:80];
	positionVertex = [[VertexPositionColorArray alloc] initWithInitialCapacity:8];
	
	VertexPositionColorStruct vertex;
	
	for (int i = 0; i < 11; i++) {
		int z = -i*5;
		
		if (i < 10) {
			vertex.color = [Color white].packedValue;
		} else {
			vertex.color = [Color yellow].packedValue;
			z = 0;
		}

			
		vertex.position = *[Vector3 vectorWithX:-10 y:-15 z:z].data;
		if (i < 10) {
			[vertexArray addVertex:&vertex];
		} else {
			[positionVertex addVertex:&vertex];
		}

		vertex.position = *[Vector3 vectorWithX:-10 y:15 z:z].data;
		if (i < 10) {
			[vertexArray addVertex:&vertex];
			[vertexArray addVertex:&vertex];
		} else {
			[positionVertex addVertex:&vertex];
			[positionVertex addVertex:&vertex];
		}
		
		vertex.position = *[Vector3 vectorWithX:10 y:15 z:z].data;
		if (i < 10) {
			[vertexArray addVertex:&vertex];
			[vertexArray addVertex:&vertex];
		} else {
			[positionVertex addVertex:&vertex];
			[positionVertex addVertex:&vertex];
		}
		
		vertex.position = *[Vector3 vectorWithX:10 y:-15 z:z].data;
		if (i < 10) {
			[vertexArray addVertex:&vertex];
			[vertexArray addVertex:&vertex];
		} else {
			[positionVertex addVertex:&vertex];
			[positionVertex addVertex:&vertex];
		}
		
		vertex.position = *[Vector3 vectorWithX:-10 y:-15 z:z].data;
		if (i < 10) {
			[vertexArray addVertex:&vertex];
		} else {
			[positionVertex addVertex:&vertex];
		}
	}
	
	NSLog(@"background load content %d %d", [vertexArray count], [positionVertex count]);
}

- (Vector3 *) collide: (Vector3 *) theSpeed :(Vector3 *) thePosition : (Vector3 *)theAccel :(NSInteger) radius {
	if (ABS(thePosition.x) + radius > screenW1) {
		theSpeed.x = ABS(theSpeed.x) * 1 * (thePosition.x < 0 ? 1 : -1) * 0.9;
		thePosition.x = (thePosition.x > 0 ? 1 : -1) * (screenW1 - radius);
		
		[Sounds play:WALL_SOUND];
		return [Vector3 zero];
	}
	
	if (ABS(thePosition.y) + radius > screenH1) {
		theSpeed.y = ABS(theSpeed.y) * 1 * (thePosition.y < 0 ? 1 : -1) * 0.9;
		thePosition.y = (thePosition.y > 0 ? 1 : -1) * (screenH1 - radius);
		
		[Sounds play:WALL_SOUND];
		return [Vector3 zero];
	}
	
	return nil;
}

- (void) draw:(BasicEffect *)effect :(GraphicsDevice *)graphicsDevice: (SpriteBatch *)spriteBatch {
	effect.world = [Matrix identity];
	[[effect.currentTechnique.passes objectAtIndex:0] apply];
	
	[graphicsDevice drawUserPrimitivesOfType:PrimitiveTypeLineList
										vertexData:vertexArray vertexOffset:0 primitiveCount:40];
	
	effect.world = [Matrix createTranslation:[Vector3 vectorWithX:0 y:0 z:ball.position.z]];
	[[effect.currentTechnique.passes objectAtIndex:0] apply];
	
	[graphicsDevice drawUserPrimitivesOfType:PrimitiveTypeLineList
									vertexData:positionVertex vertexOffset:0 primitiveCount:4];
	
	effect.world = [Matrix identity];
}

- (id) initWithBall:(Ball *) b {
	self = [super init];
	if (self != nil) {
		ball = b;
	}
	return self;
}

- (void) dealloc
{

	[super dealloc];
}

@end
