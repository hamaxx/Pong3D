//
//  PixelBitmapContent.h
//  XNI
//
//  Created by Matej Jan on 8.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BitmapContent.h"

@interface PixelBitmapContent : BitmapContent {
	SurfaceFormat format;
	int bytesPerPixel;
}

- (id) initWithWidth:(int)theWidth height:(int)theHeight format:(SurfaceFormat)theFormat;

- (Byte*) getPixelAtX:(int)x Y:(int)y;
- (void) setPixelAtX:(int)x Y:(int)y Value:(Byte*)value;

@end
