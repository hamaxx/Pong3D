//
//  ModelMeshPartContent.h
//  XNI
//
//  Created by Matej Jan on 22.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Retronator.Xni.Framework.Content.Pipeline.Processors.classes.h"
#import "Retronator.Xni.Framework.Content.Pipeline.Graphics.classes.h"
#import "Retronator.Xni.Framework.Graphics.classes.h"

@interface ModelMeshPartContent : NSObject {
	MaterialContent *material;
	IndexCollection *indexBuffer;
	int numVertices;
	int primitiveCount;
	int startIndex;
	id tag;
	VertexBufferContent *vertexBuffer;
	int vertexOffset;
}

@property (nonatomic, retain) MaterialContent *material;
@property (nonatomic, readonly) IndexCollection *indexBuffer;
@property (nonatomic, readonly) int numVertices;
@property (nonatomic, readonly) int primitiveCount;
@property (nonatomic, readonly) int startIndex;
@property (nonatomic, retain) id tag;
@property (nonatomic, readonly) VertexBufferContent *vertexBuffer;
@property (nonatomic, readonly) int vertexOffset;


@end
