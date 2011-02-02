//
//  VertexBufferContent.m
//  XNI
//
//  Created by Matej Jan on 22.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "VertexBufferContent.h"


@implementation VertexBufferContent

- (id) init
{
	self = [super init];
	if (self != nil) {
		vertexData = [[NSMutableData alloc] init];
	}
	return self;
}

@synthesize vertexData, vertexDeclaration;

- (void) dealloc
{
	[vertexData release];
	[vertexDeclaration release];
	[super dealloc];
}

@end
