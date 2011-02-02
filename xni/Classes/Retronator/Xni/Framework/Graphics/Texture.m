//
//  Texture.m
//  XNI
//
//  Created by Matej Jan on 1.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "Texture.h"


@implementation Texture

- (id) initWithGraphicsDevice:(GraphicsDevice *)theGraphicsDevice surfaceFormat:(SurfaceFormat)theFormat levelCount:(int)theLevelCount {
	if (self = [super initWithGraphicsDevice:theGraphicsDevice]) {
		format = theFormat;
		
	}
	return self;
}

@synthesize textureId;
@synthesize format;
@synthesize levelCount;

@end
