//
//  VertexBufferBinding.m
//  XNI
//
//  Created by Matej Jan on 21.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "VertexBufferBinding.h"

#import "Retronator.Xni.Framework.Graphics.h"

@implementation VertexBufferBinding

- (id) initWithVertexBuffer:(VertexBuffer *)theVertexBuffer {
	return [self initWithVertexBuffer:theVertexBuffer vertexOffset:0 instanceFrequency:0];
}

- (id) initWithVertexBuffer:(VertexBuffer *)theVertexBuffer vertexOffset:(int)theVertexOffset {
	return [self initWithVertexBuffer:theVertexBuffer vertexOffset:theVertexOffset instanceFrequency:0];
}

- (id) initWithVertexBuffer:(VertexBuffer *)theVertexBuffer vertexOffset:(int)theVertexOffset instanceFrequency:(int)theInstanceFrequency {
	if (self = [super init]) {
		vertexBuffer = [theVertexBuffer retain];
		vertexOffset = theVertexOffset;
		instanceFrequency = theInstanceFrequency;
	}
	return self;
}

@synthesize instanceFrequency;
@synthesize vertexBuffer;
@synthesize vertexOffset;

- (void) dealloc
{
	[vertexBuffer release];
	[super dealloc];
}


@end
