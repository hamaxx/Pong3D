//
//  TextureContent.m
//  XNI
//
//  Created by Matej Jan on 7.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "TextureContent.h"

#import "Retronator.Xni.Framework.Content.Pipeline.Graphics.h"

@implementation TextureContent

- (id) initWithFaces:(MipmapChainCollection*)theFaces {
	if (self = [super init]) {
		faces = [theFaces retain];
	}
	return self;
}

@synthesize faces;

- (void) convertBitmapTypeTo:(Class)newBitmapType {
	
}

- (void) generateMipmapsAndOverwriteExistingMipmaps:(BOOL)overwriteExistingMipmaps {

}

- (void) validate {
	[self validateWithFacesMustHaveSameMipCount:YES];
}

- (void) validateWithFacesMustHaveSameMipCount:(BOOL)facesMustHaveSameMipCount {
	/*
	 Validation is based on the following rules.
	 
	 - One image face must be present.
	 - The mipmap chain for each face contains at least one bitmap.
	 - All bitmaps share the same type.
	 - Each face is the same size.
	 - Each face contains the same number of mipmaps.
	 - Each mipmap must be half the size of the previous. If the root bitmap is not square, the smaller axis is rounded up to 1 for the last few mipmaps before both dimensions reach zero.
	 
	 Derived validation methods could add more validation rules. For example, cube maps must be square.
	 */
	
	[NSException raise:@"InvalidContentException" format:@"This texture content is not valid."];
}

- (void) dealloc
{
	[faces release];
	[super dealloc];
}

@end
