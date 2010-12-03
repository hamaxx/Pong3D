//
//  Score.m
//  Pong3D
//
//  Created by Jure Ham on 11/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Score.h"
#import "Namespace.Pong3D.h"

#define Band_Power  4
#define Band_Points 16
#define Band_Mask (Band_Points-2)
#define Sections_In_Band ((Band_Points/2)-1)
#define Total_Points (Sections_In_Band*Band_Points) 
#define Section_Arc (6.28/Sections_In_Band)

#define ballR 0.5

@implementation Score
@synthesize position;


- (VertexPositionColorArray *) drawBallWithColor :(Color *) color {
	VertexPositionColorArray *vertexArray = [[VertexPositionColorArray alloc] initWithInitialCapacity:2];
	
	VertexPositionColorStruct vertex;
	vertex.color = color.packedValue;
	
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
	return [vertexArray autorelease];
}

- (void) loadContent:(GraphicsDevice *) content {
	vertexArrayHome = [[self drawBallWithColor:[Color colorWithPercentageRed:0.3 green:1.0 blue:0.3 alpha:1.0]] retain];
	vertexArrayAway = [[self drawBallWithColor:[Color colorWithPercentageRed:1.0 green:0.3 blue:0.3 alpha:1.0]] retain];
}

- (void) drawScore:(NSInteger)score : (NSInteger) side :(BasicEffect *)effect :(GraphicsDevice *)graphicsDevice {
	VertexPositionColorArray *vertexArray = (side == 0) ? vertexArrayHome : vertexArrayAway;
	
	for (int i = 0; i < score; i++) {
		CGFloat posX = (side == 0) ? -10 + i * 1.5 : 10 - i * 1.5;
		
		effect.world = [Matrix createTranslation:[Vector3 vectorWithX:posX y:15 z:0]];
		
		[[effect.currentTechnique.passes objectAtIndex:0] apply];
		
		[graphicsDevice drawUserPrimitivesOfType:PrimitiveTypeTriangleStrip
									vertices:vertexArray startingAt:0 count:[vertexArray count]];
	}
}

- (void) draw:(BasicEffect *)effect :(GraphicsDevice *)graphicsDevice: (SpriteBatch *)spriteBatch {
	[self drawScore:home :0 :effect :graphicsDevice];
	[self drawScore:away :1 :effect :graphicsDevice];
	
	effect.world = [Matrix identity];
}

- (void) addScore: (NSInteger) side {
	if (side == 0) home--;
	else away--;
}

- (id) init
{
	self = [super init];
	if (self != nil) {
		home = 5;
		away = 5;
	}
	return self;
}

- (void) dealloc
{
	[vertexArrayAway release];
	[vertexArrayHome release];
	[super dealloc];
}



@end
