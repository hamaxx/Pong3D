//
//  IndexBufferReader.m
//  XNI
//
//  Created by Matej Jan on 23.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "IndexBufferReader.h"

#import "Retronator.Xni.Framework.Content.h"
#import "Retronator.Xni.Framework.Graphics.h"
#import "Retronator.Xni.Framework.Content.Pipeline.Graphics.h"

@implementation IndexBufferReader

- (id) readFromInput:(ContentReader *)input into:(id)existingInstance {
	IndexCollection *content = input.content;
	GraphicsDevice *graphicsDevice = [[input.contentManager.serviceProvider getServiceOfType:@protocol(IGraphicsDeviceService)] graphicsDevice];
	
	// Create an index array.
	ShortIndexArray *indexArray = [[[ShortIndexArray alloc] initWithInitialCapacity:content.count] autorelease];
	for (NSNumber *index in content) {
		short shortIndex = (short)[index intValue];
		[indexArray addIndex:shortIndex];
	}
	
	// Create the buffer.
	IndexBuffer *buffer = [[[IndexBuffer alloc] initWithGraphicsDevice:graphicsDevice 
													  indexElementSize:IndexElementSizeSixteenBits 
															indexCount:content.count 
																 usage:BufferUsageWriteOnly] autorelease];
	
	// Load data from array to buffer.
	[buffer setData:indexArray];
	
	return buffer;
}

@end
