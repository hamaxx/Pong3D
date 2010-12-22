//
//  ModelMeshPartReader.m
//  XNI
//
//  Created by Matej Jan on 23.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "ModelMeshPartReader.h"

#import "Retronator.Xni.Framework.Content.h"
#import "Retronator.Xni.Framework.Graphics.h"
#import "Retronator.Xni.Framework.Content.Pipeline.Processors.h"
#import "ModelMeshPart+Internal.h"

@implementation ModelMeshPartReader

- (id) readFromInput:(ContentReader *)input into:(id)existingInstance {
	ModelMeshPartContent *content = input.content;
	
	// Create the model mesh part.
	
	BasicEffect *effect = [input readSharedResourceFrom:content.material];	
	VertexBuffer *vertexBuffer = [input readSharedResourceFrom:content.vertexBuffer];
	IndexBuffer *indexBuffer = [input readSharedResourceFrom:content.indexBuffer];
	
	ModelMeshPart *meshPart = 
	[[ModelMeshPart alloc] initWithVertexOffset:content.vertexOffset numVertices:content.numVertices startIndex:content.startIndex
								 primitiveCount:content.primitiveCount tag:content.tag indexBuffer:indexBuffer
								   vertexBuffer:vertexBuffer effect:effect];
	
	return [meshPart autorelease];
}

@end
