//
//  VertexBuffer.m
//  XNI
//
//  Created by Matej Jan on 21.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "VertexBuffer.h"
#import "VertexBuffer+Internal.h"
#import "GraphicsDevice+Internal.h"

#import "Retronator.Xni.Framework.Graphics.h"

@implementation VertexBuffer

- (id) initWithGraphicsDevice:(GraphicsDevice *)theGraphicsDevice 
			vertexDeclaration:(VertexDeclaration *)theVertexDeclaration 
				  vertexCount:(int)theVertexCount
						usage:(BufferUsage)theBufferUsage
{
	self = [super initWithGraphicsDevice:theGraphicsDevice];
	if (self != nil) {
		bufferID = [graphicsDevice createBuffer];
		vertexDeclaration = [theVertexDeclaration retain];
		vertexCount = theVertexCount;
		bufferUsage = theBufferUsage;
	}
	return self;
}

@synthesize vertexCount, bufferUsage, vertexDeclaration;

- (uint) bufferID {
	return bufferID;
}

- (void) setData:(VertexArray*)data {
	[graphicsDevice setData:data.array toVertexBuffer:self];
}

- (void) dealloc
{
	[vertexDeclaration release];
	[super dealloc];
}


@end
