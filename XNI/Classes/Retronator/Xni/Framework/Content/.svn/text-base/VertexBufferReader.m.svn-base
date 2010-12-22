//
//  VertexBufferReader.m
//  XNI
//
//  Created by Matej Jan on 23.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "VertexBufferReader.h"

#import "Retronator.Xni.Framework.Content.h"
#import "Retronator.Xni.Framework.Graphics.h"
#import "Retronator.Xni.Framework.Content.Pipeline.Processors.h"

#import "GraphicsDevice+Internal.h"

@implementation VertexBufferReader

- (id) readFromInput:(ContentReader *)input into:(id)existingInstance {
	VertexBufferContent *content = input.content;
	GraphicsDevice *graphicsDevice = [[input.contentManager.serviceProvider getServiceOfType:@protocol(IGraphicsDeviceService)] graphicsDevice];
		
	VertexDeclaration *vertexDeclaration = [input readObjectFrom:content.vertexDeclaration];
	
	int vertexCount = [content.vertexData length] / vertexDeclaration.vertexStride;

	VertexBuffer *buffer = [[[VertexBuffer alloc] initWithGraphicsDevice:graphicsDevice
													   vertexDeclaration:vertexDeclaration
															 vertexCount:vertexCount usage:BufferUsageWriteOnly] autorelease];
	
	[graphicsDevice setData:(void*)[content.vertexData bytes] toVertexBuffer:buffer];
	
	return buffer;
}

@end
