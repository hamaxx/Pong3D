//
//  ColorPixelBitmapContent.h
//  XNI
//
//  Created by Matej Jan on 9.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PixelBitmapContent.h"
#import "Retronator.Xni.Framework.Graphics.PackedVector.classes.h"

@interface ColorPixelBitmapContent : PixelBitmapContent {
	Byte4* colorPixelData;
}

- (Byte4*) getPixelData;
- (void) setPixelData:(Byte4*)sourceData;

- (Byte4) getPixelAtX:(int)x y:(int)y;
- (void) setPixelAtX:(int)x y:(int)y value:(Byte4)value;

@end
