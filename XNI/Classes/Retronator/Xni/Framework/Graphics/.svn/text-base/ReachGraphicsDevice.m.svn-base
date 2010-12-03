//
//  ReachGraphicsDevice.m
//  XNI
//
//  Created by Matej Jan on 27.7.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "ReachGraphicsDevice.h"

#import "Retronator.Xni.Framework.Graphics.h"

@interface ReachGraphicsDevice()

- (void) enableVertexBuffers;
- (void) disableVertexBuffers;
	
- (void) enableDeclaration:(VertexDeclaration*)vertexDeclaration forUserData:(void*)data;

- (void) enableDeclaration:(VertexDeclaration*)vertexDeclaration onStream:(int)stream useBuffers:(BOOL)useBuffers pointer:(void*)pointer;
- (void) disableDeclaration:(VertexDeclaration*)vertexDeclaration;

@end


@implementation ReachGraphicsDevice

- (EAGLContext*) createContext { 
	return [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES1]; 
}

- (void) drawUserPrimitivesOfType:(PrimitiveType)primitiveType vertices:(VertexArray*)vertexData
                       startingAt:(int)vertexOffset count:(int)primitiveCount {
	[self drawUserPrimitivesOfType:primitiveType vertices:vertexData.array ofType:vertexData.vertexDeclaration
						startingAt:vertexOffset count:primitiveCount];
}

- (void) drawUserPrimitivesOfType:(PrimitiveType)primitiveType 
						 vertices:(void *)vertexData ofType:(VertexDeclaration *)vertexDeclaration 
					   startingAt:(int)vertexOffset count:(int)primitiveCount {
 
	[self enableDeclaration:vertexDeclaration forUserData:(vertexData + vertexOffset * vertexDeclaration.vertexStride)];
    
    int count = [GraphicsDevice getNumberOfVerticesForPrimitiveType:primitiveType primitiveCount:primitiveCount]; 
    glDrawArrays(primitiveType, 0, count);
    
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
            glBindBuffer(GL_ARRAY_BUFFER, binding.vertexBuffer.bufferId);
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
