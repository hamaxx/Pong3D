//
//  ModelMeshPart.h
//  XNI
//
//  Created by Matej Jan on 22.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Retronator.Xni.Framework.Graphics.classes.h"

@interface ModelMeshPart : NSObject {
	Effect *effect;
	IndexBuffer *indexBuffer;
	int numVertices;
	int primitiveCount;
	int startIndex;
	id tag;
	VertexBuffer *vertexBuffer;
	int vertexOffset;
}

@property (nonatomic, retain) Effect *effect;
@property (nonatomic, readonly) IndexBuffer *indexBuffer;
@property (nonatomic, readonly) int numVertices;
@property (nonatomic, readonly) int primitiveCount;
@property (nonatomic, readonly) int startIndex;
@property (nonatomic, retain) id tag;
@property (nonatomic, readonly) VertexBuffer *vertexBuffer;
@property (nonatomic, readonly) int vertexOffset;

@end
