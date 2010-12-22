//
//  VertexPositionColor.m
//  XNI
//
//  Created by Matej Jan on 21.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "VertexPositionColor.h"

#import "Retronator.Xni.Framework.Graphics.h"

@implementation VertexPositionColor

static VertexDeclaration *vertexDeclaration;

+ (void) initialize {
    NSArray *vertexElements = [NSArray arrayWithObjects:
								   [VertexElement vertexElementWithOffset:offsetof(VertexPositionColorStruct, position) 
																   format:VertexElementFormatVector3 
																	usage:VertexElementUsagePosition 
															   usageIndex:0], 
								   [VertexElement vertexElementWithOffset:offsetof(VertexPositionColorStruct, color) 
																   format:VertexElementFormatColor 
																	usage:VertexElementUsageColor
															   usageIndex:0], nil]; 
	
	vertexDeclaration = [[VertexDeclaration alloc] initWithElements:vertexElements];
}

+ (VertexDeclaration *) vertexDeclaration {
	return vertexDeclaration;
}

@end
