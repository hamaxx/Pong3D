//
//  BitmapContent.m
//  XNI
//
//  Created by Matej Jan on 7.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "BitmapContent.h"


@implementation BitmapContent

- (id) initWithWidth:(int)theWidth height:(int)theHeight {
	if (self = [super init]) {
		width = theWidth;
		height = theHeight;
	}
	return self;
}

@synthesize width;
@synthesize height;

- (NSData*) getPixelData { 
	return pixelData; 
}

- (void) setPixelData:(NSData*)sourceData {
	[pixelData release];
	pixelData = [sourceData retain];
}

- (BOOL) tryGetFormat:(SurfaceFormat*)theFormat {
	return NO;
}

- (void) dealloc
{
	[pixelData release];
	[super dealloc];
}


@end
