//
//  TextureImporter.m
//  XNI
//
//  Created by Matej Jan on 7.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "TextureImporter.h"
#import <UIKit/UIKit.h>

#import "Retronator.Xni.Framework.Graphics.h"
#import "Retronator.Xni.Framework.Content.Pipeline.h"
#import "Retronator.Xni.Framework.Content.Pipeline.Graphics.h"

@implementation TextureImporter

- (TextureContent*) importFile:(NSString*)filename { 
	NSData *textureData = [NSData dataWithContentsOfFile:filename];
    UIImage *image = [UIImage imageWithData:textureData];
    if (image == nil) {
        [NSException raise:@"InvalidArgumentException" format:@"The provided file is not a supported texture resource."];
    }	
	
	// Allocate space for raw data.
	GLuint width = CGImageGetWidth(image.CGImage);
    GLuint height = CGImageGetHeight(image.CGImage);
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    void *imageData = malloc(width * height * 4);
    
	// Create a context for drawing to the raw data space.
    CGContextRef textureContext = CGBitmapContextCreate(imageData, width, height, 8, 4 * width, colorSpace,
                                                        kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big );

	// Draw the image to our context.
	CGContextClearRect(textureContext, CGRectMake(0, 0, width, height));
    CGContextTranslateCTM(textureContext, 0, 0);	
    CGContextDrawImage(textureContext, CGRectMake(0, 0, width, height), image.CGImage);
		
	// Create pixel bitmap content.
	PixelBitmapContent *bitmap = [[[PixelBitmapContent alloc] initWithWidth:(int)width height:(int)height format:SurfaceFormatColor] autorelease];
	[bitmap setPixelData:[NSData dataWithBytes:imageData length:width*height*4]];
	
	// Clean up.
	CGColorSpaceRelease(colorSpace);
	CGContextRelease(textureContext); 	
	free(imageData);
	
	// This bitmap is the only one in the mipmap chain.
	MipmapChain *mipmaps = [[[MipmapChain alloc] init] autorelease];
	[mipmaps addObject:bitmap];
	
	// Create the texture content.
	Texture2DContent *content = [[[Texture2DContent alloc] init] autorelease];
	content.identity.sourceFilename = filename;
	content.mipmaps = mipmaps;
	
	return content;
}

@end
