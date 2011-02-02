//
//  SpriteBatch.m
//  XNI
//
//  Created by Matej Jan on 16.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "Retronator.Xni.Framework.h"
#import "Retronator.Xni.Framework.Graphics.h"
#import "SpriteBatch.h"

#import "SpriteFont+Internal.h"

typedef struct {
	float x;
	float y;
	float width;
	float height;
} RectangleFStruct;

@interface XniSprite : NSObject
{
@public
	Texture2D *texture;
	Vector2Struct position;
	Vector2Struct width;
	Vector2Struct height;
	float layerDepth;
	RectangleFStruct source;
	uint color;
}

@property (nonatomic, readonly) Texture2D *texture;
@property (nonatomic, readonly) float layerDepth;
@property (nonatomic, readonly) uint textureId;

@end

@implementation XniSprite

@synthesize texture;
@synthesize layerDepth;
- (uint) textureId {
	return texture.textureId;
}

@end

static NSArray *textureSort;
static NSArray *frontToBackSort;
static NSArray *backToFrontSort;

static inline void SpriteSetSource(XniSprite *sprite, Rectangle *source, Texture2D *texture, SpriteEffects effects) {
	if (source) {
		sprite->source.x = (float)source.x / texture.width;
		sprite->source.y = (float)source.y / texture.height;
		sprite->source.width = (float)source.width / texture.width;
		sprite->source.height = (float)source.height / texture.height;
	} else {
		sprite->source.width = 1;
		sprite->source.height = 1;
	}
	
	if (effects & SpriteEffectsFlipHorizontally) {
		sprite->source.x = sprite->source.x + sprite->source.width;
		sprite->source.width = -sprite->source.width;
	}
	
	if (effects & SpriteEffectsFlipVertically) {
		sprite->source.y = sprite->source.y + sprite->source.height;
		sprite->source.height = -sprite->source.height;
	}	
}

static inline void SpriteSetVertices(XniSprite *sprite, float positionX, float positionY, float originX, float originY, float scaleX, float scaleY, float rotation, float width, float height) {
	float x = originX * scaleX;
	float y = -originY * scaleY;
	float c = cos(rotation);
	float s = sin(rotation);
	sprite->position.x = positionX - x * c - y * s;
	sprite->position.y = positionY - x * s + y * c;
	sprite->width.x = width * scaleX * c;
	sprite->width.y = width * scaleX * s;
	sprite->height.x = -height * scaleY * s;
	sprite->height.y = height * scaleY * c;
}

static inline void SpriteSetDestinationFast(XniSprite *sprite, Rectangle *destination) {
	sprite->position.x = destination.x;
	sprite->position.y = destination.y;
	sprite->width.x = destination.width;
	sprite->height.y = destination.height;
}

static inline void SpriteSetDestination(XniSprite *sprite, Rectangle *destination, float originX, float originY, float rotation) {
	
	SpriteSetVertices(sprite, destination.x + originX, destination.y + originY, originX, originY, 1, 1, rotation, destination.width, destination.height);
}

static inline void SpriteSetPositionFast(XniSprite *sprite, Vector2 *position, float width, float height) {
	sprite->position.x = position.x;
	sprite->position.y = position.y;
	sprite->width.x = width;
	sprite->height.y = height;
}

static inline void SpriteSetPosition(XniSprite *sprite, Vector2 *position, float originX, float originY, float scaleX, float scaleY, float rotation, float width, float height) {
	SpriteSetVertices(sprite, position.x, position.y, originX, originY, scaleX, scaleY, rotation, width, height);
}

@interface SpriteBatch()

- (void) setProjection;
- (void) apply;
- (void) draw:(XniSprite*)sprite;
- (void) draw;
- (void) drawFrom:(int)startIndex to:(int)endIndex;

@end

@implementation SpriteBatch

// Recyclable vertices
static VertexPositionColorTextureStruct vertices[4];

- (id) initWithGraphicsDevice:(GraphicsDevice *)theGraphicsDevice
{
	self = [super initWithGraphicsDevice:theGraphicsDevice];
	if (self != nil) {
		basicEffect = [[BasicEffect alloc] initWithGraphicsDevice:theGraphicsDevice];
		[self setProjection];
		
		basicEffect.textureEnabled = YES;
		basicEffect.vertexColorEnabled = YES;	
		
		sprites = [[NSMutableArray alloc] init];
		vertexArray = [[VertexPositionColorTextureArray alloc] initWithInitialCapacity:256];
		
		[theGraphicsDevice.deviceReset subscribeDelegate:[Delegate delegateWithTarget:self Method:@selector(setProjection)]];
		
	}
	return self;
}

+ (void) initialize {
	NSSortDescriptor *textureSortDescriptor = [[[NSSortDescriptor alloc] initWithKey:@"textureId" ascending:YES] autorelease];
	NSSortDescriptor *depthAscendingSortDescriptor = [[[NSSortDescriptor alloc] initWithKey:@"layerDepth" ascending:YES] autorelease];
	NSSortDescriptor *depthDescendingSortDescriptor = [[[NSSortDescriptor alloc] initWithKey:@"layerDepth" ascending:NO] autorelease];
	
	textureSort = [[NSArray arrayWithObject:textureSortDescriptor] retain];
	frontToBackSort = [[NSArray arrayWithObject:depthAscendingSortDescriptor] retain];
	backToFrontSort = [[NSArray arrayWithObject:depthDescendingSortDescriptor] retain];
}

- (void) setProjection {
	basicEffect.projection = [Matrix createOrthographicOffCenterWithLeft:0 
																   right:self.graphicsDevice.viewport.width 
																  bottom:self.graphicsDevice.viewport.height 
																	 top:0
															  zNearPlane:0 
															   zFarPlane:-1];
}

- (void) begin {
	[self beginWithSortMode:SpriteSortModeDeffered BlendState:nil SamplerState:nil DepthStencilState:nil RasterizerState:nil Effect:nil TransformMatrix:nil];
}

- (void) beginWithSortMode:(SpriteSortMode)theSortMode 
				BlendState:(BlendState*)theBlendState {
	[self beginWithSortMode:theSortMode BlendState:theBlendState SamplerState:nil DepthStencilState:nil RasterizerState:nil Effect:nil TransformMatrix:nil];
}

- (void) beginWithSortMode:(SpriteSortMode)theSortMode 
				BlendState:(BlendState*)theBlendState 
			  SamplerState:(SamplerState*)theSamplerState 
		 DepthStencilState:(DepthStencilState*)theDepthStencilState 
		   RasterizerState:(RasterizerState*)theRasterizerState {
	[self beginWithSortMode:theSortMode BlendState:theBlendState SamplerState:theSamplerState DepthStencilState:theDepthStencilState RasterizerState:theRasterizerState Effect:nil TransformMatrix:nil];
}

- (void) beginWithSortMode:(SpriteSortMode)theSortMode 
				BlendState:(BlendState*)theBlendState 
			  SamplerState:(SamplerState*)theSamplerState 
		 DepthStencilState:(DepthStencilState*)theDepthStencilState 
		   RasterizerState:(RasterizerState*)theRasterizerState 
					Effect:(Effect*)theEffect {
	[self beginWithSortMode:theSortMode BlendState:theBlendState SamplerState:theSamplerState DepthStencilState:theDepthStencilState RasterizerState:theRasterizerState Effect:theEffect TransformMatrix:nil];
}

- (void) beginWithSortMode:(SpriteSortMode)theSortMode 
				BlendState:(BlendState*)theBlendState 
			  SamplerState:(SamplerState*)theSamplerState 
		 DepthStencilState:(DepthStencilState*)theDepthStencilState 
		   RasterizerState:(RasterizerState*)theRasterizerState 
					Effect:(Effect*)theEffect 
		   TransformMatrix:(Matrix*)theTransformMatrix {
	
	if (!theBlendState) theBlendState = [BlendState alphaBlend];
	if (!theSamplerState) theSamplerState = [SamplerState linearClamp];
	if (!theDepthStencilState) theDepthStencilState = [DepthStencilState none];
	if (!theRasterizerState) theRasterizerState = [RasterizerState cullCounterClockwise];
	if (!theEffect) theEffect = basicEffect;
	if (!theTransformMatrix) theTransformMatrix = [Matrix identity];
	
	sortMode = theSortMode;
	blendState = theBlendState;
	depthStencilState = theDepthStencilState;
	rasterizerState = theRasterizerState;
	samplerState = theSamplerState;
	effect = theEffect;
	
	if ([effect isKindOfClass:[BasicEffect class]]) {
		((BasicEffect*)effect).world = theTransformMatrix;
	}
	
	// Immediate mode applies the device state during begin.
	if (sortMode == SpriteSortModeImmediate) {
		[self apply];
	}
	
	beginCalled = YES;
}

- (void) draw:(Texture2D*)texture toRectangle:(Rectangle*)destinationRectangle tintWithColor:(Color*)color {
	XniSprite *sprite = [[[XniSprite alloc] init] autorelease];
	sprite->texture = texture;
	SpriteSetDestinationFast(sprite, destinationRectangle);
	SpriteSetSource(sprite, nil, texture, SpriteEffectsNone);
	sprite->color = color.packedValue;
	[self draw:sprite];
}

- (void) draw:(Texture2D*)texture toRectangle:(Rectangle*)destinationRectangle fromRectangle:(Rectangle*)sourceRectangle tintWithColor:(Color*)color {
	XniSprite *sprite = [[[XniSprite alloc] init] autorelease];
	sprite->texture = texture;
	SpriteSetDestinationFast(sprite, destinationRectangle);
	SpriteSetSource(sprite, sourceRectangle, texture, SpriteEffectsNone);
	sprite->color = color.packedValue;
	[self draw:sprite];	
}

- (void) draw:(Texture2D*)texture toRectangle:(Rectangle*)destinationRectangle fromRectangle:(Rectangle*)sourceRectangle tintWithColor:(Color*)color
	 rotation:(float)rotation origin:(Vector2*)origin effects:(SpriteEffects)effects layerDepth:(float)layerDepth {
	XniSprite *sprite = [[[XniSprite alloc] init] autorelease];
	sprite->texture = texture;
	SpriteSetDestination(sprite, destinationRectangle, origin.x, origin.y, rotation);
	SpriteSetSource(sprite, sourceRectangle, texture, effects);
	sprite->color = color.packedValue;
	sprite->layerDepth = layerDepth;
	[self draw:sprite];		
}

- (void) draw:(Texture2D*)texture to:(Vector2*)position tintWithColor:(Color*)color {
	XniSprite *sprite = [[[XniSprite alloc] init] autorelease];
	sprite->texture = texture;
	SpriteSetPositionFast(sprite, position, texture.width, texture.height);
	SpriteSetSource(sprite, nil, texture, SpriteEffectsNone);
	sprite->color = color.packedValue;
	[self draw:sprite];	
}

- (void) draw:(Texture2D*)texture to:(Vector2*)position fromRectangle:(Rectangle*)sourceRectangle tintWithColor:(Color*)color {
	XniSprite *sprite = [[[XniSprite alloc] init] autorelease];
	sprite->texture = texture;
	SpriteSetPositionFast(sprite, position, sourceRectangle ? sourceRectangle.width : texture.width, sourceRectangle ? sourceRectangle.height : texture.height);
	SpriteSetSource(sprite, sourceRectangle, texture, SpriteEffectsNone);
	sprite->color = color.packedValue;
	[self draw:sprite];	
}

- (void) draw:(Texture2D*)texture to:(Vector2*)position fromRectangle:(Rectangle*)sourceRectangle tintWithColor:(Color*)color
	 rotation:(float)rotation origin:(Vector2*)origin scaleUniform:(float)scale effects:(SpriteEffects)effects layerDepth:(float)layerDepth {
	XniSprite *sprite = [[[XniSprite alloc] init] autorelease];
	sprite->texture = texture;
	SpriteSetPosition(sprite, position, origin.x, origin.y, scale, scale, rotation, sourceRectangle ? sourceRectangle.width : texture.width, sourceRectangle ? sourceRectangle.height : texture.height);
	SpriteSetSource(sprite, sourceRectangle, texture, effects);
	sprite->color = color.packedValue;
	sprite->layerDepth = layerDepth;
	[self draw:sprite];			
}

- (void) draw:(Texture2D*)texture to:(Vector2*)position fromRectangle:(Rectangle*)sourceRectangle tintWithColor:(Color*)color
	 rotation:(float)rotation origin:(Vector2*)origin scale:(Vector2*)scale effects:(SpriteEffects)effects layerDepth:(float)layerDepth {
	XniSprite *sprite = [[[XniSprite alloc] init] autorelease];
	sprite->texture = texture;
	SpriteSetPosition(sprite, position, origin.x, origin.y, scale.x, scale.y, rotation, sourceRectangle ? sourceRectangle.width : texture.width, sourceRectangle ? sourceRectangle.height : texture.height);
	SpriteSetSource(sprite, sourceRectangle, texture, effects);
	sprite->color = color.packedValue;
	sprite->layerDepth = layerDepth;
	[self draw:sprite];		
}

- (void) drawStringWithSpriteFont:(SpriteFont*)spriteFont text:(NSString*)text to:(Vector2*)position tintWithColor:(Color*)color {
	[self drawStringWithSpriteFont:spriteFont text:text to:position tintWithColor:color rotation:0 origin:[Vector2 zero] scale:[Vector2 one] effects:SpriteEffectsNone layerDepth:0];
}

- (void) drawStringWithSpriteFont:(SpriteFont*)spriteFont text:(NSString*)text to:(Vector2*)position tintWithColor:(Color*)color
						 rotation:(float)rotation origin:(Vector2*)origin scaleUniform:(float)scale effects:(SpriteEffects)effects layerDepth:(float)layerDepth {
	[self drawStringWithSpriteFont:spriteFont text:text to:position tintWithColor:color rotation:rotation origin:origin scale:[Vector2 vectorWithX:scale y:scale] effects:effects layerDepth:layerDepth];	
}

- (void) drawStringWithSpriteFont:(SpriteFont*)spriteFont text:(NSString*)text to:(Vector2*)position tintWithColor:(Color*)color
						 rotation:(float)rotation origin:(Vector2*)origin scale:(Vector2*)scale effects:(SpriteEffects)effects layerDepth:(float)layerDepth {
	
	Vector2 *currentOrigin = [Vector2 vectorWithX:origin.x y:origin.y-spriteFont.lineSpacing];
	Vector2 *characterOrigin = [Vector2 zero];
	
	for (int i = 0; i < [text length]; i++) {
		unichar character = [text characterAtIndex:i];
		if ([[NSCharacterSet newlineCharacterSet] characterIsMember:character]) {
			// This is a control character for a new line.
			currentOrigin.x = origin.x;
			currentOrigin.y -= spriteFont.lineSpacing;
		} else {
			// Draw this character
			Rectangle *sourceRectangle = [spriteFont sourceRectangleForCharacter:character];
			characterOrigin.x = currentOrigin.x;
			characterOrigin.y = currentOrigin.y + sourceRectangle.height;
			
			[self draw:spriteFont.texture to:position fromRectangle:sourceRectangle tintWithColor:color
			  rotation:rotation origin:characterOrigin scale:scale effects:effects layerDepth:layerDepth];
			
			currentOrigin.x -= sourceRectangle.width + spriteFont.spacing;
		}
	}
}

- (void) draw:(XniSprite *)sprite {
	[sprites addObject:sprite];
	
	if (sortMode == SpriteSortModeImmediate) {
		[self draw];
		[sprites removeAllObjects];
	}
}

- (void) end {
	if (!beginCalled) {
		[NSException raise:@"InvalidOperationException" format:@"End was called before begin."];
	}
	
	switch (sortMode) {
		case SpriteSortModeImmediate:
			// We've already done all the work.
			beginCalled = NO;
			return;
		case SpriteSortModeTexture:
			[sprites sortUsingDescriptors:textureSort];
			break;
		case SpriteSortModeBackToFront:
			[sprites sortUsingDescriptors:backToFrontSort];
			break;
		case SpriteSortModeFrontToBack:
			[sprites sortUsingDescriptors:frontToBackSort];
			break;
	}
	
	// Apply the graphics device states.
	[self apply];
	
	// Render the whole array of sprites.
	[self draw];
	
	// Clean up.
	[sprites removeAllObjects];
	beginCalled = NO;
}

- (void) apply {
	graphicsDevice.blendState = blendState;
	graphicsDevice.depthStencilState = depthStencilState;
	graphicsDevice.rasterizerState = rasterizerState;
	[graphicsDevice.samplerStates setItem:samplerState atIndex:0];
	[[effect.currentTechnique.passes objectAtIndex:0] apply];	
}

- (void) draw {
	// Check how many sprites to draw.
	int count = [sprites count];
	if (count == 0) {
		// No sprites to draw.
		return;
	}
	
	// Draw until all sprites are drawn.
	int startIndex = 0;
	int endIndex = 0;
	
	while (startIndex < count) {
		// Get the texture for the next batch.
		Texture2D *currentTexture = ((XniSprite*)[sprites objectAtIndex:startIndex]).texture;
		
		// Try to expend the end to include all sprites with the same texture.
		if (count > 1) {	
			while (endIndex + 1 < count && ((XniSprite*)[sprites objectAtIndex:endIndex + 1]).texture == currentTexture) {
				endIndex++;
			}
		}
		
		// Draw sprites from start to end.
		[self drawFrom:startIndex to:endIndex];
		
		// Start a new batch.
		startIndex = endIndex + 1;
		endIndex = startIndex;
	}
}

- (void) drawFrom:(int)startIndex to:(int)endIndex {
	
	// Fill the vertex array
	for (int i = startIndex; i <= endIndex; i++) {
		XniSprite *sprite = [sprites objectAtIndex:i];
		
		vertices[0].position.x = sprite->position.x;
		vertices[0].position.y = sprite->position.y;
		vertices[0].position.z = sprite->layerDepth;
		
		vertices[1].position.x = vertices[0].position.x + sprite->height.x;
		vertices[1].position.y = vertices[0].position.y + sprite->height.y;
		vertices[1].position.z = sprite->layerDepth;
		
		vertices[2].position.x = vertices[0].position.x + sprite->width.x;
		vertices[2].position.y = vertices[0].position.y + sprite->width.y;
		vertices[2].position.z = sprite->layerDepth;
		
		vertices[3].position.x = vertices[0].position.x + sprite->height.x + sprite->width.x;
		vertices[3].position.y = vertices[0].position.y + sprite->height.y + sprite->width.y;
		vertices[3].position.z = sprite->layerDepth;
	
		vertices[0].texture.x = sprite->source.x;
		vertices[1].texture.x = sprite->source.x;
		vertices[2].texture.x = sprite->source.x + sprite->source.width;
		vertices[3].texture.x = sprite->source.x + sprite->source.width;		
		
		vertices[0].texture.y = sprite->source.y;
		vertices[1].texture.y = sprite->source.y + sprite->source.height;
		vertices[2].texture.y = sprite->source.y;
		vertices[3].texture.y = sprite->source.y + sprite->source.height;			
		
		vertices[0].color = sprite->color;
		vertices[1].color = sprite->color;
		vertices[2].color = sprite->color;
		vertices[3].color = sprite->color;
		
		[vertexArray addVertex:&vertices[0]];
		[vertexArray addVertex:&vertices[2]];
		[vertexArray addVertex:&vertices[1]];
		[vertexArray addVertex:&vertices[2]];
		[vertexArray addVertex:&vertices[3]];
		[vertexArray addVertex:&vertices[1]];
	}
	
	[self.graphicsDevice.textures setItem:((XniSprite*)[sprites objectAtIndex:startIndex]).texture atIndex:0];
	
	// Draw the vertex array.
	int count = (endIndex - startIndex + 1) * 2;
	[graphicsDevice drawUserPrimitivesOfType:PrimitiveTypeTriangleList vertexData:vertexArray vertexOffset:0 primitiveCount:count];
	
	// Clean up.
	[vertexArray clear];
}

- (void) dealloc
{
	[self.graphicsDevice.deviceReset unsubscribeDelegate:[Delegate delegateWithTarget:self Method:@selector(setProjection)]];
	[basicEffect release];
	[sprites release];
	[vertexArray release];
	[super dealloc];
}


@end
