//
//  VertexPositionNormalTexture.m
//  XNI
//
//  Created by Matej Jan on 29.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "VertexPositionNormalTexture.h"

#import "Retronator.Xni.Framework.Graphics.h"

@implementation VertexPositionNormalTexture

static VertexDeclaration *vertexDeclaration;

+ (void) initialize {
    NSArray *vertexElements = [NSArray arrayWithObjects:
							   [VertexElement vertexElementWithOffset:offsetof(VertexPositionNormalTextureStruct, position) 
															   format:VertexElementFormatVector3 
																usage:VertexElementUsagePosition 
														   usageIndex:0],
							   [VertexElement vertexElementWithOffset:offsetof(VertexPositionNormalTextureStruct, normal) 
															   format:VertexElementFormatVector3 
																usage:VertexElementUsageNormal
														   usageIndex:0],
							   [VertexElement vertexElementWithOffset:offsetof(VertexPositionNormalTextureStruct, texture) 
															   format:VertexElementFormatVector2 
																usage:VertexElementUsageTextureCoordinate
														   usageIndex:0], nil]; 
	
	vertexDeclaration = [[VertexDeclaration alloc] initWithElements:vertexElements];
}

+ (VertexDeclaration *) vertexDeclaration {
	return vertexDeclaration;
}

@end
