//
//  Texture2DContentTypeReader.m
//  XNI
//
//  Created by Matej Jan on 10.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "Texture2DContentTypeReader.h"

#import "Retronator.Xni.Framework.Content.h"
#import "Retronator.Xni.Framework.Content.Pipeline.Graphics.h"
#import "Retronator.Xni.Framework.Graphics.h"

@implementation Texture2DContentTypeReader

- (id) readFromInput:(ContentReader *)input into:(id)existingInstance {
	Texture2DContent *content = input.content;
	
	GraphicsDevice *graphicsDevice = [[input.contentManager.serviceProvider getServiceOfType:@protocol(IGraphicsDeviceService)] graphicsDevice];
	MipmapChain *mipmaps = content.mipmaps;
	BOOL generateMipmaps = [mipmaps count] > 1;
	BitmapContent *bitmap = [mipmaps objectAtIndex:0];
	SurfaceFormat format;
	[bitmap tryGetFormat:&format];
	
	Texture2D *texture = [[Texture2D alloc] initWithGraphicsDevice:graphicsDevice 
															 width:bitmap.width 
															height:bitmap.height 
														   mipMaps:generateMipmaps 
															format:format];
	
	for (int i=0;i<[mipmaps count];i++) {
		bitmap = [mipmaps objectAtIndex:i];
		[texture setDataToLevel:i sourceRectangle:nil from:[bitmap getPixelData]];
	}
	
	return texture;
}

@end
