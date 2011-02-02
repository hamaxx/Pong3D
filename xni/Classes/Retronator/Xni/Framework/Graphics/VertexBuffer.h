//
//  VertexBuffer.h
//  XNI
//
//  Created by Matej Jan on 21.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GraphicsResource.h"

@interface VertexBuffer : GraphicsResource {
    uint bufferID;
	BufferUsage bufferUsage;
	int vertexCount;
	VertexDeclaration *vertexDeclaration;
}

- (id) initWithGraphicsDevice:(GraphicsDevice *)theGraphicsDevice
			vertexDeclaration:(VertexDeclaration*)theVertexDeclaration
				  vertexCount:(int)theVertexCount
						usage:(BufferUsage)theBufferUsage;

@property (nonatomic, readonly) BufferUsage bufferUsage;
@property (nonatomic, readonly) int vertexCount;
@property (nonatomic, readonly) VertexDeclaration *vertexDeclaration;

- (void) setData:(VertexArray*)data;

@end
