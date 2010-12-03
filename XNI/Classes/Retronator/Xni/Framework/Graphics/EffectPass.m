//
//  EffectPass.m
//  XNI
//
//  Created by Matej Jan on 21.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "EffectPass.h"

#import "Retronator.Xni.Framework.Graphics.h"

@implementation EffectPass

-(id) initWithName:(NSString *)theName graphicsDevice:(GraphicsDevice*)theGraphicsDevice {
    if (self = [super init]) {
        name = [theName retain];
		graphicsDevice = [theGraphicsDevice retain];
    }
    return self;
}

@synthesize name;

- (void) apply {}

- (void) dealloc
{
    [name release];
	[graphicsDevice release];
    [super dealloc];
}


@end
