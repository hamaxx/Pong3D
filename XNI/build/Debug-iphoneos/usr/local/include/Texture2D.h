//
//  Texture2D.h
//  XNI
//
//  Created by Matej Jan on 1.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Texture.h"

@interface Texture2D : Texture {
	int height;
	int width;
}

- (id) initWithGraphicsDevice:(GraphicsDevice*)theGraphicsDevice width:(int)theWidth height:(int)theHeight;
- (id) initWithGraphicsDevice:(GraphicsDevice*)theGraphicsDevice width:(int)theWidth height:(int)theHeight mipMaps:(BOOL)generateMipMaps format:(SurfaceFormat)theFormat;

@property (nonatomic, readonly) Rectangle *bounds;
@property (nonatomic, readonly) int height;
@property (nonatomic, readonly) int width;

+ (Texture2D*) fromData:(NSData*)textureData graphicsDevice:(GraphicsDevice*)graphicsDevice;
//+ (Texture2D*) fromData:(NSData*)textureData graphicsDevice:(GraphicsDevice*)graphicsDevice width:(int)width height:(int)height zoom:(BOOL)zoom;

// - (void) getDataTo:(void *)data;
// - (void) getDataTo:(void *)data startIndex:(int)startIndex elementCount:(int)elementCount;
// - (void) getDataFromLevel:(int)level sourceRectangle:(Rectangle*)rect to:(void *)data StartIndex:(int)startIndex elementCount:(int)elementCount;

- (void) setDataFrom:(void*)data;
- (void) setDataToLevel:(int)level sourceRectangle:(Rectangle*)rect from:(void *)data;

// - (void) saveAsJpeg:(NSData*)textureData width:(int)width height:(int)height;
// - (void) saveAsPng:(NSData*)textureData width:(int)width height:(int)height;

@end
