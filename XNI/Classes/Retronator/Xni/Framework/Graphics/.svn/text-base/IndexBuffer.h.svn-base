//
//  IndexBuffer.h
//  XNI
//
//  Created by Matej Jan on 21.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GraphicsResource.h"

@interface IndexBuffer : GraphicsResource {
	uint bufferID;
	BufferUsage bufferUsage;
	int indexCount;
	IndexElementSize indexElementSize;
}

- (id) initWithGraphicsDevice:(GraphicsDevice *)theGraphicsDevice 
			 indexElementSize:(IndexElementSize)theIndexElementSize
				   indexCount:(int)theIndexCount
						usage:(BufferUsage)theBufferUsage;

@property (nonatomic, readonly) BufferUsage bufferUsage;
@property (nonatomic, readonly) int indexCount;
@property (nonatomic, readonly) IndexElementSize indexElementSize;

- (void) setData:(IndexArray*)data;

@end