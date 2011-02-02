//
//  ModelMeshPartContent.m
//  XNI
//
//  Created by Matej Jan on 22.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "ModelMeshPartContent.h"

#import "Retronator.Xni.Framework.Content.Pipeline.Processors.h"
#import "Retronator.Xni.Framework.Content.Pipeline.Graphics.h"
#import "Retronator.Xni.Framework.Graphics.h"

@implementation ModelMeshPartContent

- (id) initWithVertexOffset:(int)theVertexOffset 
				numVertices:(int)theNumVertices 
				 startIndex:(int)theStartIndex
			 primitiveCount:(int)thePrimitiveCount 
						tag:(id)theTag 
				indexBuffer:(IndexCollection*)theIndexBuffer
			   vertexBuffer:(VertexBufferContent*)theVertexBuffer
				   material:(MaterialContent*)theMaterial 
{
	self = [super init];
	if (self != nil) {
		vertexOffset = theVertexOffset;
		numVertices = theNumVertices;
		startIndex = theStartIndex;
		primitiveCount = thePrimitiveCount;
		tag = [tag retain];
		indexBuffer = [theIndexBuffer retain];
		vertexBuffer = [theVertexBuffer retain];
		material = [theMaterial retain];
	}
	return self;
}

@synthesize material,indexBuffer,numVertices,primitiveCount,startIndex,tag,vertexBuffer,vertexOffset;

- (void) dealloc
{
	[indexBuffer release];
	[vertexBuffer release];
	[tag release];
	[material release];
	[super dealloc];
}

@end
