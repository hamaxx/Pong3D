//
//  VertexPositionTexture.m
//  XNI
//
//  Created by Matej Jan on 21.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "VertexPositionTexture.h"

#import "Retronator.Xni.Framework.Graphics.h"

@implementation VertexPositionTexture

static VertexDeclaration *vertexDeclaration;

+ (void) initialize {
    NSArray *vertexElements = [NSArray arrayWithObjects:
							   [VertexElement vertexElementWithOffset:offsetof(VertexPositionTextureStruct, position) 
															   format:VertexElementFormatVector3 
																usage:VertexElementUsagePosition 
														   usageIndex:0], 
							   [VertexElement vertexElementWithOffset:offsetof(VertexPositionTextureStruct, texture) 
															   format:VertexElementFormatVector2 
																usage:VertexElementUsageTextureCoordinate
														   usageIndex:0], nil]; 
	
	vertexDeclaration = [[VertexDeclaration alloc] initWithElements:vertexElements];
}

+ (VertexDeclaration *) vertexDeclaration {
	return vertexDeclaration;
}

@end
