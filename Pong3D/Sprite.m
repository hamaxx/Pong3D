//
//  Sprite.m
//  Pong3D
//
//  Created by Matej Jan on 20.10.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "Sprite.h"

#import "Namespace.Pong3D.h"

@implementation Sprite

@synthesize texture;
@synthesize sourceRectangle;
@synthesize origin;
@synthesize relative;

- (void) dealloc
{
	[texture release];
	[sourceRectangle release];
	[origin release];
	[relative release];
	[super dealloc];
}

@end
