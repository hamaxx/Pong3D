//
//  VertexPositionColorTexture.m
//  XNI
//
//  Created by Matej Jan on 23.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "VertexPositionColorTexture.h"

#import "Retronator.Xni.Framework.Graphics.h"

@implementation VertexPositionColorTexture

static VertexDeclaration *vertexDeclaration;

+ (void) initialize {
    NSArray *vertexElements = [NSArray arrayWithObjects:
							   [VertexElement vertexElementWithOffset:offsetof(VertexPositionColorTextureStruct, position) 
															   format:VertexElementFormatVector3 
																usage:VertexElementUsagePosition 
														   usageIndex:0],
							   [VertexElement vertexElementWithOffset:offsetof(VertexPositionColorTextureStruct, color) 
															   format:VertexElementFormatColor 
																usage:VertexElementUsageColor
														   usageIndex:0],
							   [VertexElement vertexElementWithOffset:offsetof(VertexPositionColorTextureStruct, texture) 
															   format:VertexElementFormatVector2 
																usage:VertexElementUsageTextureCoordinate
														   usageIndex:0], nil]; 
	
	vertexDeclaration = [[VertexDeclaration alloc] initWithElements:vertexElements];
}

+ (VertexDeclaration *) vertexDeclaration {
	return vertexDeclaration;
}

@end
