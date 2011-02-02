//
//  VertexDeclarationContent.m
//  XNI
//
//  Created by Matej Jan on 26.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "VertexDeclarationContent.h"


@implementation VertexDeclarationContent

- (id) init
{
	self = [super init];
	if (self != nil) {
		vertexElements = [[NSMutableArray alloc] init];
	}
	return self;
}

@synthesize vertexElements, vertexStride;

- (void) dealloc
{
	[vertexElements release];
	[vertexStride release];
	[super dealloc];
}


@end
