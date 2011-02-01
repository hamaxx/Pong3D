//
//  Score.m
//  Pong3D
//
//  Created by Jure Ham on 11/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Score.h"
#import "Namespace.Pong3D.h"
#import "Retronator.Xni.Framework.Content.Pipeline.Processors.h"

#define Band_Power  4
#define Band_Points 16
#define Band_Mask (Band_Points-2)
#define Sections_In_Band ((Band_Points/2)-1)
#define Total_Points (Sections_In_Band*Band_Points) 
#define Section_Arc (6.28/Sections_In_Band)

#define ballR 0.5

@implementation Score
@synthesize position, home, away, score, level;


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

- (void) loadContent:(GraphicsDevice *) gd :(ContentManager *)cm {
	vertexArrayHome = [[self drawBallWithColor:[Color colorWithPercentageRed:0.3 green:1.0 blue:0.3 alpha:1.0]] retain];
	vertexArrayAway = [[self drawBallWithColor:[Color colorWithPercentageRed:1.0 green:0.3 blue:0.3 alpha:1.0]] retain];
	
	FontTextureProcessor *fontProcessor = [[[FontTextureProcessor alloc] init] autorelease];
	font = [cm load:@"5x5" processor:fontProcessor];
	[self scoreLabel];
}

- (void) drawScore:(NSInteger)points : (NSInteger) side :(BasicEffect *)effect :(GraphicsDevice *)graphicsDevice {
	VertexPositionColorArray *vertexArray = (side == 0) ? vertexArrayHome : vertexArrayAway;
	
	for (int i = 0; i < points; i++) {
		CGFloat posX = (side == 0) ? -10 + i * 1.5 : 10 - i * 1.5;
		
		effect.world = [Matrix createTranslation:[Vector3 vectorWithX:posX y:15 z:0]];
		
		[[effect.currentTechnique.passes objectAtIndex:0] apply];
		
		[graphicsDevice drawUserPrimitivesOfType:PrimitiveTypeTriangleStrip
									vertexData:vertexArray vertexOffset:0 primitiveCount:[vertexArray count]];
	}
}

- (void) scoreLabel {
	NSString *sc = [NSString stringWithFormat:@"Level %d  Score %d", level, score];
	if (label == nil) {
		label = [[Label alloc] initWithFont:font text:sc position:[Vector2 vectorWithX:10 y:[[UIScreen mainScreen] bounds].size.height - 40]];
	} else {
		label.text = sc;
	}
	
} 

- (void) draw:(BasicEffect *)effect :(GraphicsDevice *)graphicsDevice: (SpriteBatch *)spriteBatch {
	[self drawScore:home :0 :effect :graphicsDevice];
	[self drawScore:away :1 :effect :graphicsDevice];

	[spriteBatch drawStringWithSpriteFont:label.font text:label.text to:label.position tintWithColor:label.color
								 rotation:label.rotation origin:label.origin scale:label.scale effects:SpriteEffectsNone layerDepth:label.layerDepth];

	effect.world = [Matrix identity];
}

- (void) addScore: (NSInteger) side {
	
	if (side == 0) {
		home--;
		score--;
	}
	if (side == 1) {
		away--;
		score += 2;
	}
	
	if (home <= 0) {
		[Sounds play:LOSE_SOUND];
		[Menu shown:YES:YES];
	} else if (away <= 0) {
		[Sounds play:WIN_SOUND];
		level++;
		score += 10;
	} else if (side == 0) {
		[Sounds play:MISS_SOUND];
	} else if (side == 1)  {
		[Sounds play:HIT_SOUND];
	}
	
	if (away <= 0) {
		home = 5;
		away = 5;
	}
	
	[self scoreLabel];
}

- (id) init
{
	self = [super init];
	if (self != nil) {
		score = 0;
		level = 1;
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
