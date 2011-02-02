//
//  ModelMeshPart.m
//  XNI
//
//  Created by Matej Jan on 22.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "ModelMeshPart.h"
#import "ModelMeshPart+Internal.h"

@implementation ModelMeshPart

- (id) initWithVertexOffset:(int)theVertexOffset numVertices:(int)theNumVertices startIndex:(int)theStartIndex
			 primitiveCount:(int)thePrimitiveCount tag:(id)theTag indexBuffer:(IndexBuffer*)theIndexBuffer 
			   vertexBuffer:(VertexBuffer*)theVertexBuffer effect:(Effect*)theEffect
{
	self = [super init];
	if (self != nil) {
		vertexOffset = theVertexOffset;
		numVertices = theNumVertices;
		startIndex = theStartIndex;
		primitiveCount = thePrimitiveCount;
		self.tag = tag;
		indexBuffer = [theIndexBuffer retain];
		vertexBuffer = [theVertexBuffer retain];
		effect = [theEffect retain];
	}
	return self;
}

@synthesize effect,indexBuffer,numVertices,primitiveCount,startIndex,tag,vertexBuffer,vertexOffset;

- (void) dealloc
{
	[indexBuffer release];
	[vertexBuffer release];
	[effect release];
	[tag release];
	[super dealloc];
}

@end
