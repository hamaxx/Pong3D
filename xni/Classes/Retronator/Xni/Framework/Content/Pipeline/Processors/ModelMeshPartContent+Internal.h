//
//  ModelMeshPartContent+Internal.h
//  XNI
//
//  Created by Matej Jan on 22.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ModelMeshPartContent.h"

@interface ModelMeshPartContent (Internal)

- (id) initWithVertexOffset:(int)theVertexOffset 
				numVertices:(int)theNumVertices 
				 startIndex:(int)theStartIndex
			 primitiveCount:(int)thePrimitiveCount 
						tag:(id)theTag 
				indexBuffer:(IndexCollection*)theIndexBuffer
			   vertexBuffer:(VertexBufferContent*)theVertexBuffer 
				   material:(MaterialContent*)theMaterial;

@end
