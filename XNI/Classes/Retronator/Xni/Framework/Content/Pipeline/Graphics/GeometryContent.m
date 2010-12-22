//
//  GeometryContent.m
//  XNI
//
//  Created by Matej Jan on 22.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "GeometryContent.h"

#import "Retronator.Xni.Framework.Content.Pipeline.Graphics.h"

@implementation GeometryContent

- (id) initWithPositions:(PositionCollection*)thePositions;
{
	self = [super init];
	if (self != nil) {
		indices = [[IndexCollection alloc] init];
		vertices = [[VertexContent alloc] initWithPositions:thePositions];
	}
	return self;
}

@synthesize indices, material, parent, vertices;

- (void) dealloc
{
	[material release];
	[indices release];
	[vertices release];
	[super dealloc];
}


@end
