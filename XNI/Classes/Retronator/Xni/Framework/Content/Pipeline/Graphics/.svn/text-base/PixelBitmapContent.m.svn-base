//
//  PixelBitmapContent.m
//  XNI
//
//  Created by Matej Jan on 8.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "PixelBitmapContent.h"

#import "Retronator.Xni.Framework.Content.Pipeline.Graphics.h"

@implementation PixelBitmapContent

- (id) initWithWidth:(int)theWidth height:(int)theHeight format:(SurfaceFormat)theFormat {
	if (self = [super initWithWidth:theWidth height:theHeight]) {
		format = theFormat;
		BOOL result = [VectorConverter tryGetSizeInBytesOfSurfaceFormat:format sizeInBytes:&bytesPerPixel];
		if (!result) {
			[NSException raise:@"ArgumentException" format:@"The provided format is not supported"];
		}
	}
	return self;	
}

- (BOOL) tryGetFormat:(SurfaceFormat*)theFormat {
	*theFormat = format;
	return YES;
}

- (Byte *) getPixelAtX:(int)x Y:(int)y {
	// Index into the data array at bytesPerPixel intervals.
	Byte *bytes = (Byte*)[pixelData bytes];
	return &bytes[(x + y * width) * bytesPerPixel];
}

- (void) setPixelAtX:(int)x Y:(int)y Value:(Byte *)value {
	// The value contains bytesPerPixel bytes.
	Byte *bytes = (Byte*)[pixelData bytes];
	memcpy(&bytes[(x + y * width) * bytesPerPixel], value, bytesPerPixel);
}

@end
