//
//  ReachGraphicsDevice.m
//  XNI
//
//  Created by Matej Jan on 27.7.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "ReachGraphicsDevice.h"

#import "Retronator.Xni.Framework.Graphics.h"

#import "VertexBuffer+Internal.h"
#import "IndexBuffer+Internal.h"

@interface ReachGraphicsDevice()

- (void) drawUserIndexedPrimitivesOfType:(PrimitiveType)primitiveType 
							  vertexData:(void*)vertexData
							vertexOffset:(int)vertexOffset
							 numVertices:(int)numVertices
						       indexData:(void*)indexData
							 indexOffset:(int)indexOffset
						  primitiveCount:(int)primitiveCount
					   vertexDeclaration:(VertexDeclaration*) vertexDeclaration
						indexElementSize:(IndexElementSize)indexElementSize;

- (void) enableVertexBuffers;
- (void) disableVertexBuffers;

- (void) enableDeclaration:(VertexDeclaration*)vertexDeclaration forUserData:(void*)data;

- (void) enableDeclaration:(VertexDeclaration*)vertexDeclaration onStream:(int)stream useBuffers:(BOOL)useBuffers pointer:(void*)pointer;
- (void) disableDeclaration:(VertexDeclaration*)vertexDeclaration;

@end


@implementation ReachGraphicsDevice

- (EAGLContext*) createContext { 
	return [[[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES1] autorelease]; 
}

- (void) drawPrimitivesOfType:(PrimitiveType)primitiveType 
				  startVertex:(int)startVertex 
			   primitiveCount:(int)primitiveCount
{
	[self enableVertexBuffers];
	
    int count = [GraphicsDevice getNumberOfVerticesForPrimitiveType:primitiveType primitiveCount:primitiveCount]; 
    glDrawArrays(primitiveType, 0, count);
	
	[self disableVertexBuffers];
}

- (void) drawIndexedPrimitivesOfType:(PrimitiveType)primitiveType 
						  baseVertex:(int)baseVertex 
					  minVertexIndex:(int)minVertexIndex
						 numVertices:(int)numVertices
						  startIndex:(int)startIndex
					  primitiveCount:(int)primitiveCount;
{
	[self enableVertexBuffers];
	
	glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, indices.bufferID);
	
    int count = [GraphicsDevice getNumberOfVerticesForPrimitiveType:primitiveType primitiveCount:primitiveCount]; 
	
	GLenum type = 0;
	switch (indices.indexElementSize) {
		case IndexElementSizeSixteenBits:
			type = DataTypeUnsignedShort;
			break;
	}
	
	void *startIndexPointer = (void*)(startIndex * indices.indexElementSize);
    glDrawElements(primitiveType, count, type, startIndexPointer);
	
	glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, 0);
	
	[self disableVertexBuffers];
}

- (void) drawUserPrimitivesOfType:(PrimitiveType)primitiveType
					   vertexData:(VertexArray*)vertexData
					 vertexOffset:(int)vertexOffset 
				   primitiveCount:(int)primitiveCount
{
	[self drawUserPrimitivesOfType:primitiveType
						vertexData:vertexData.array
					  vertexOffset:vertexOffset
					primitiveCount:primitiveCount
				 vertexDeclaration:vertexData.vertexDeclaration];
}


- (void) drawUserPrimitivesOfType:(PrimitiveType)primitiveType
					   vertexData:(void*)vertexData 
					 vertexOffset:(int)vertexOffset 
				   primitiveCount:(int)primitiveCount
				vertexDeclaration:(VertexDeclaration*) vertexDeclaration
{
	[self enableDeclaration:vertexDeclaration forUserData:(vertexData + vertexOffset * vertexDeclaration.vertexStride)];
    
    int count = [GraphicsDevice getNumberOfVerticesForPrimitiveType:primitiveType primitiveCount:primitiveCount]; 
    glDrawArrays(primitiveType, 0, count);
    
    [self disableDeclaration:vertexDeclaration]; 
}

- (void) drawUserIndexedPrimitivesOfType:(PrimitiveType)primitiveType 
							  vertexData:(VertexArray*)vertexData
							vertexOffset:(int)vertexOffset
							 numVertices:(int)numVertices
							   indexData:(IndexArray*)indexData
							 indexOffset:(int)indexOffset
						  primitiveCount:(int)primitiveCount
{
	[self drawUserIndexedPrimitivesOfType:primitiveType
							   vertexData:vertexData.array
							 vertexOffset:vertexOffset 
							  numVertices:numVertices
								indexData:indexData.array 
							  indexOffset:indexOffset 
						   primitiveCount:primitiveCount
						vertexDeclaration:vertexData.vertexDeclaration
						 indexElementSize:indexData.indexElementSize];
}

- (void) drawUserIndexedPrimitivesOfType:(PrimitiveType)primitiveType 
							  vertexData:(void*)vertexData
							vertexOffset:(int)vertexOffset
							 numVertices:(int)numVertices
						  shortIndexData:(void*)indexData
							 indexOffset:(int)indexOffset
						  primitiveCount:(int)primitiveCount
					   vertexDeclaration:(VertexDeclaration*) vertexDeclaration 
{
	[self drawUserIndexedPrimitivesOfType:primitiveType
							   vertexData:vertexData
							 vertexOffset:vertexOffset 
							  numVertices:numVertices
								indexData:indexData 
							  indexOffset:indexOffset 
						   primitiveCount:primitiveCount
						vertexDeclaration:vertexDeclaration
						 indexElementSize:IndexElementSizeSixteenBits];	
}

- (void) drawUserIndexedPrimitivesOfType:(PrimitiveType)primitiveType 
							  vertexData:(void*)vertexData
							vertexOffset:(int)vertexOffset
							 numVertices:(int)numVertices
							   indexData:(void*)indexData
							 indexOffset:(int)indexOffset
						  primitiveCount:(int)primitiveCount
					   vertexDeclaration:(VertexDeclaration*) vertexDeclaration
						indexElementSize:(IndexElementSize)indexElementSize
{	
	[self enableDeclaration:vertexDeclaration forUserData:(vertexData + vertexOffset * vertexDeclaration.vertexStride)];
    
    int count = [GraphicsDevice getNumberOfVerticesForPrimitiveType:primitiveType primitiveCount:primitiveCount]; 

	GLenum type = 0;
	switch (indexElementSize) {
		case IndexElementSizeSixteenBits:
			type = DataTypeUnsignedShort;
			break;
	}
	
	void *startIndex = indexData + indexOffset * indexElementSize;
    glDrawElements(primitiveType, count, type, startIndex);
    
    [self disableDeclaration:vertexDeclaration]; 
	
}

// Private methods

- (void) enableVertexBuffers {
	// We need to enable the declarations set on the vertex buffers.
	for (int i=0;i<[vertices count];i++) {
		VertexBufferBinding *binding = [vertices objectAtIndex:i];
		[self enableDeclaration:binding.vertexBuffer.vertexDeclaration
					   onStream:i useBuffers:YES pointer:(void*)binding.vertexOffset];
	}
}

- (void) enableDeclaration:(VertexDeclaration*)vertexDeclaration forUserData:(void*)data {
	[self enableDeclaration:vertexDeclaration onStream:0 useBuffers:NO pointer:data];
}

- (void) enableDeclaration:(VertexDeclaration *)vertexDeclaration onStream:(int)stream useBuffers:(BOOL)useBuffers pointer:(void*)pointer {	
    NSArray *vertexElements = vertexDeclaration.vertexElements;
    
    int stride = vertexDeclaration.vertexStride;
    
    for (VertexElement *vertexElement in vertexElements) {       
        if (useBuffers) {
            // Bind the buffer the vertex element is using.
			VertexBufferBinding* binding = [vertices objectAtIndex:stream];
            glBindBuffer(GL_ARRAY_BUFFER, binding.vertexBuffer.bufferID);
        }
        
        // Enable the state that the vertex element represents.
        glEnableClientState(vertexElement.vertexElementUsage);
        
        // Create the pointer to the vertex element data.
        switch (vertexElement.vertexElementUsage) {
            case VertexElementUsagePosition:
                glVertexPointer([vertexElement getValueDimensions], [vertexElement getValueDataType], 
                                stride, pointer + vertexElement.offset);
                break;
            case VertexElementUsageNormal:
                glNormalPointer([vertexElement getValueDataType], 
                                stride, pointer + vertexElement.offset);
                break;
            case VertexElementUsageTextureCoordinate:
                glTexCoordPointer([vertexElement getValueDimensions], [vertexElement getValueDataType], 
                                  stride, pointer + vertexElement.offset);
                break;
            case VertexElementUsageColor:
                glColorPointer([vertexElement getValueDimensions], [vertexElement getValueDataType], 
                               stride, pointer + vertexElement.offset);
                break;                
            case VertexElementUsagePointSize:
                glPointSizePointerOES([vertexElement getValueDataType], 
                                      stride, pointer + vertexElement.offset);
                break;
            default:
                [NSException raise:@"NotImplementedException" 
                            format:@"The vertex element usage %i is not yet implemented.", vertexElement.vertexElementUsage];
                break;
        }
    }
}

- (void) disableVertexBuffers {
	// We need to disable the declarations set on the vertex buffers.
	for (int i=0;i<[vertices count];i++) {
		VertexBufferBinding *binding = [vertices objectAtIndex:i];
		[self disableDeclaration:binding.vertexBuffer.vertexDeclaration];
	}
	
    glBindBuffer(GL_ARRAY_BUFFER, 0);
}

- (void) disableDeclaration:(VertexDeclaration*)vertexDeclaration {
    NSArray *vertexElements = vertexDeclaration.vertexElements;
    for (VertexElement *vertexElement in vertexElements) {
        // Enable the state that the vertex element represents.
        glDisableClientState(vertexElement.vertexElementUsage);
    }
}

@end
