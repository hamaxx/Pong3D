//
//  TextureCollection.m
//  XNI
//
//  Created by Matej Jan on 21.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "TextureCollection.h"
#import "TextureCollection+Internal.h"
#import "XniSamplerEventArgs.h"

#import "Retronator.Xni.Framework.Graphics.h"

@implementation TextureCollection

- (id) init
{
	self = [super init];
	if (self != nil) {
		for (int i = 0; i < GL_MAX_TEXTURE_UNITS; i++) {
			textures[i] = nil;
		}
		textureChanged = [[Event alloc] init];
	}
	return self;
}

- (Event *) textureChanged {
	return textureChanged;
}

- (Texture*)itemAtIndex:(NSUInteger)index {
	return textures[index];
}

- (void)setItem:(Texture*)item atIndex:(NSUInteger)index {
	if (textures[index] != item) {
		textures[index] = item;
		[textureChanged raiseWithSender:self eventArgs:[XniSamplerEventArgs eventArgsWithSamplerIndex:index]];
	}
}

- (void) dealloc
{
	[textureChanged release];
	[super dealloc];
}

@end
