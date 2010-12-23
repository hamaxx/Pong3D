//
//  Texture.h
//  XNI
//
//  Created by Matej Jan on 1.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GraphicsResource.h"

@interface Texture : GraphicsResource {
	uint textureId;
	SurfaceFormat format;
	int levelCount;
}

- (id) initWithGraphicsDevice:(GraphicsDevice *)theGraphicsDevice surfaceFormat:(SurfaceFormat)theFormat levelCount:(int)theLevelCount;

@property (nonatomic, readonly) uint textureId;
@property (nonatomic) SurfaceFormat format;
@property (nonatomic) int levelCount;

@end
