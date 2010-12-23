//
//  SpriteBatch.h
//  XNI
//
//  Created by Matej Jan on 16.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GraphicsResource.h"

@interface SpriteBatch : GraphicsResource {
	SpriteSortMode sortMode;
	BlendState *blendState;
	SamplerState *samplerState;
	DepthStencilState *depthStencilState;
	RasterizerState *rasterizerState;
	Effect *effect;
	Matrix *transformMatrix;
	
	BasicEffect *basicEffect;
	
	BOOL beginCalled;
	
	NSMutableArray *sprites;
	VertexPositionColorTextureArray *vertexArray;
}

- (void) begin;

- (void) beginWithSortMode:(SpriteSortMode)theSortMode 
				BlendState:(BlendState*)theBlendState;

- (void) beginWithSortMode:(SpriteSortMode)theSortMode 
				BlendState:(BlendState*)theBlendState 
			  SamplerState:(SamplerState*)theSamplerState 
		 DepthStencilState:(DepthStencilState*)theDepthStencilState 
		   RasterizerState:(RasterizerState*)theRasterizerState;

- (void) beginWithSortMode:(SpriteSortMode)theSortMode 
				BlendState:(BlendState*)theBlendState 
			  SamplerState:(SamplerState*)theSamplerState 
		 DepthStencilState:(DepthStencilState*)theDepthStencilState 
		   RasterizerState:(RasterizerState*)theRasterizerState 
					Effect:(Effect*)theEffect;

- (void) beginWithSortMode:(SpriteSortMode)theSortMode 
				BlendState:(BlendState*)theBlendState 
			  SamplerState:(SamplerState*)theSamplerState 
		 DepthStencilState:(DepthStencilState*)theDepthStencilState 
		   RasterizerState:(RasterizerState*)theRasterizerState 
					Effect:(Effect*)theEffect 
		   TransformMatrix:(Matrix*)theTransformMatrix;

- (void) draw:(Texture2D*)texture toRectangle:(Rectangle*)destinationRectangle tintWithColor:(Color*)color;
- (void) draw:(Texture2D*)texture toRectangle:(Rectangle*)destinationRectangle fromRectangle:(Rectangle*)sourceRectangle tintWithColor:(Color*)color;
- (void) draw:(Texture2D*)texture toRectangle:(Rectangle*)destinationRectangle fromRectangle:(Rectangle*)sourceRectangle tintWithColor:(Color*)color
	 rotation:(float)rotation origin:(Vector2*)origin effects:(SpriteEffects)effects layerDepth:(float)layerDepth;

- (void) draw:(Texture2D*)texture to:(Vector2*)position tintWithColor:(Color*)color;
- (void) draw:(Texture2D*)texture to:(Vector2*)position fromRectangle:(Rectangle*)sourceRectangle tintWithColor:(Color*)color;
- (void) draw:(Texture2D*)texture to:(Vector2*)position fromRectangle:(Rectangle*)sourceRectangle tintWithColor:(Color*)color
	 rotation:(float)rotation origin:(Vector2*)origin scaleUniform:(float)scale effects:(SpriteEffects)effects layerDepth:(float)layerDepth;
- (void) draw:(Texture2D*)texture to:(Vector2*)position fromRectangle:(Rectangle*)sourceRectangle tintWithColor:(Color*)color
	 rotation:(float)rotation origin:(Vector2*)origin scale:(Vector2*)scale effects:(SpriteEffects)effects layerDepth:(float)layerDepth;

- (void) drawStringWithSpriteFont:(SpriteFont*)spriteFont text:(NSString*)text to:(Vector2*)position tintWithColor:(Color*)color;
- (void) drawStringWithSpriteFont:(SpriteFont*)spriteFont text:(NSString*)text to:(Vector2*)position tintWithColor:(Color*)color
						 rotation:(float)rotation origin:(Vector2*)origin scaleUniform:(float)scale effects:(SpriteEffects)effects layerDepth:(float)layerDepth;
- (void) drawStringWithSpriteFont:(SpriteFont*)spriteFont text:(NSString*)text to:(Vector2*)position tintWithColor:(Color*)color
						 rotation:(float)rotation origin:(Vector2*)origin scale:(Vector2*)scale effects:(SpriteEffects)effects layerDepth:(float)layerDepth;

- (void) end;

@end
