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

- (Byte4) getPixelAtX:(int)x y:(int)y {
	return (*(Byte4*)[super getPixelAtX:x Y:y]);
}

- (void) setPixelAtX:(int)x y:(int)y value:(Byte4)value {
	[super setPixelAtX:x Y:y Value:(Byte*)(&value)];
}

@end
