//
//  VertexDeclarationReader.m
//  XNI
//
//  Created by Matej Jan on 29.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "VertexDeclarationReader.h"

#import "Retronator.Xni.Framework.Content.h"
#import "Retronator.Xni.Framework.Graphics.h"
#import "Retronator.Xni.Framework.Content.Pipeline.Processors.h"

@implementation VertexDeclarationReader

- (id) readFromInput:(ContentReader *)input into:(id)existingInstance {
	VertexDeclarationContent *content = input.content;
	
	VertexDeclaration *vertexDeclaration = [[[VertexDeclaration alloc] initWithElements:content.vertexElements] autorelease];
	
	return vertexDeclaration;
}

@end
