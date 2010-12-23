//
//  VertexDeclaration.h
//  XNI
//
//  Created by Matej Jan on 21.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GraphicsResource.h"

@interface VertexDeclaration : GraphicsResource {
	NSArray *vertexElements;
	int vertexStride;
}

- (id) initWithElements:(NSArray*)theVertexElements;

@property (nonatomic, readonly) NSArray *vertexElements;
@property (nonatomic, readonly) int vertexStride;

@end
