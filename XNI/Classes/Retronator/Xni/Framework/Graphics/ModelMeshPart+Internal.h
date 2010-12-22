//
//  ModelMeshPart+Internal.h
//  XNI
//
//  Created by Matej Jan on 22.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ModelMeshPart (Internal)

- (id) initWithVertexOffset:(int)theVertexOffset numVertices:(int)theNumVertices startIndex:(int)theStartIndex
			 primitiveCount:(int)thePrimitiveCount tag:(id)theTag indexBuffer:(IndexBuffer*)theIndexBuffer
			   vertexBuffer:(VertexBuffer*)theVertexBuffer effect:(Effect*)theEffect;

@end
