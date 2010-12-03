//
//  ColorPixelBitmapContent.m
//  XNI
//
//  Created by Matej Jan on 9.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "ColorPixelBitmapContent.h"


@implementation ColorPixelBitmapContent

- (id) initWithWidth:(int)theWidth Height:(int)theHeight {
	if (self = [super initWithWidth:theWidth height:theHeight format:SurfaceFormatColor]) {
	}
	return self;	
}

- (Byte4 *) getPixelData {
	return colorPixelData;
}

- (void) setPixelData:(Byte4 *)sourceData {
	colorPixelData = sourceData;
	[super setPixelData:sourceData];
}

- (Byte4) getPixelAtX:(int)x y:(int)y {
	return colorPixelData[x + y * width];
}

- (void) setPixelAtX:(int)x y:(int)y value:(Byte4)value {
	colorPixelData[x + y * width] = value;
}

@end
