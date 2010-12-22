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
    uint bufferId;
	VertexDeclaration *vertexDeclaration;
}

@property (nonatomic, readonly) uint bufferId;
@property (nonatomic, readonly) VertexDeclaration *vertexDeclaration;

@end
