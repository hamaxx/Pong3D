//
//  GraphicsResource.m
//  XNI
//
//  Created by Matej Jan on 1.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "GraphicsResource.h"


@implementation GraphicsResource

- (id) initWithGraphicsDevice:(GraphicsDevice*)theGraphicsDevice {
	if (self = [super init]) {
		graphicsDevice = theGraphicsDevice;
	}
	return self;
}

@synthesize graphicsDevice;
@synthesize isDisposed;
@synthesize name;
@synthesize tag;

- (void) dealloc
{
	[name release];
	[tag release];
	[super dealloc];
}


@end
