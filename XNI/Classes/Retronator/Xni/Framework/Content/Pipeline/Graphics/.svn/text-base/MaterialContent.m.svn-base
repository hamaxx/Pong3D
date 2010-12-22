//
//  MaterialContent.m
//  XNI
//
//  Created by Matej Jan on 22.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "MaterialContent.h"

#import "Retronator.Xni.Framework.Content.Pipeline.Graphics.h"

@implementation MaterialContent

- (id) init
{
	self = [super init];
	if (self != nil) {
		textures = [[TextureReferenceDictionary alloc] init];
	}
	return self;
}

@synthesize textures;

- (void) dealloc
{
	[textures release];
	[super dealloc];
}


@end
