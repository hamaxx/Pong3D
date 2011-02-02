//
//  IndexBuffer.m
//  XNI
//
//  Created by Matej Jan on 21.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "IndexBuffer.h"
#import "IndexBuffer+Internal.h"
#import "GraphicsDevice+Internal.h"

#import "Retronator.Xni.Framework.Graphics.h"

@implementation IndexBuffer

- (id) initWithGraphicsDevice:(GraphicsDevice *)theGraphicsDevice 
			 indexElementSize:(IndexElementSize)theIndexElementSize
				   indexCount:(int)theIndexCount
						usage:(BufferUsage)theBufferUsage
{
	self = [super initWithGraphicsDevice:theGraphicsDevice];
	if (self != nil) {
		bufferID = [graphicsDevice createBuffer];
		indexElementSize = theIndexElementSize;
		indexCount = theIndexCount;
		bufferUsage = theBufferUsage;
	}
	return self;
}

@synthesize indexElementSize, indexCount, bufferUsage;

- (uint) bufferID {
	return bufferID;
}

- (void) setData:(IndexArray*)data {
	[graphicsDevice setData:data.array toIndexBuffer:self];
}

@end

