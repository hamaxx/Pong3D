//
//  MeshContent.m
//  XNI
//
//  Created by Matej Jan on 22.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "MeshContent.h"

#import "Retronator.Xni.Framework.Content.Pipeline.Graphics.h"

@implementation MeshContent

- (id) init
{
	self = [super init];
	if (self != nil) {
		geometry = [[GeometryContentCollection alloc] initWithParent:self];
		positions = [[PositionCollection alloc] init];
	}
	return self;
}

@synthesize geometry, positions;

- (void) dealloc
{
	[geometry release];
	[positions release];
	[super dealloc];
}


@end
