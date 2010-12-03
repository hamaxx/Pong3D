//
//  Texture2DContent.m
//  XNI
//
//  Created by Matej Jan on 10.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "Texture2DContent.h"

#import "Retronator.Xni.Framework.Content.Pipeline.Graphics.h"

@implementation Texture2DContent

- (id) init
{
	self = [super initWithFaces:[[[MipmapChainCollection alloc] init] autorelease]]; 
	if (self != nil) {
	}
	return self;
}

- (MipmapChain*) mipmaps {
	return [[self faces] objectAtIndex:0];
}

- (void) setMipmaps:(MipmapChain *)value {
	[[self faces] insertObject:value atIndex:0];
}

- (void) validateWithGraphicsProfile:(GraphicsProfile)targetProfile {
	[super validate];
}

@end
