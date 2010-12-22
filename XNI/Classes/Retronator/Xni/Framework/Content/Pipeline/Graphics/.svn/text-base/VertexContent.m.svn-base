//
//  VertexContent.m
//  XNI
//
//  Created by Matej Jan on 22.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "VertexContent.h"

#import "Retronator.Xni.Framework.h"
#import "Retronator.Xni.Framework.Graphics.h"
#import "Retronator.Xni.Framework.Content.Pipeline.Graphics.h"
#import "Retronator.Xni.Framework.Content.Pipeline.Processors.h"

@implementation VertexContent

- (id) initWithPositions:(PositionCollection*)thePositions
{
	self = [super init];
	if (self != nil) {
		channels = [[VertexChannelCollection alloc] initWithParent:self];
		positionIndices = [[IndexCollection alloc] init];
		positions = [[IndirectPositionCollection alloc] initWithPositionIndices:positionIndices positions:thePositions];
	}
	return self;
}

@synthesize channels, positionIndices, positions, vertexCount;

- (int) add:(int)positionIndex {
	for (VertexChannel *channel in channels) {
		[channel add:[[[channel.elementType alloc] init] autorelease]];
	}
	[positionIndices add:[NSNumber numberWithInt:positionIndex]];
	vertexCount++;
	return vertexCount-1;
}

- (void) addRange:(NSArray*)positionIndexCollection {
	for (NSNumber *positionIndex in positionIndexCollection) {
		[self add:[positionIndex intValue]];
	}
}

- (void) insert:(int)positionIndex at:(int)index {
	for (VertexChannel *channel in channels) {
		[channel insert:[[[channel.elementType alloc] init] autorelease] at:index];
	}
	[positionIndices insert:[NSNumber numberWithInt:positionIndex] at:index];
	vertexCount++;
}

- (void) insertRange:(NSArray*)positionIndexCollection at:(int)index {
	for (NSNumber *positionIndex in positionIndexCollection) {
		[self insert:[positionIndex intValue] at:index];
		index++;
	}
}

- (void) removeAt:(int)index {
	for (VertexChannel *channel in channels) {
		[channel removeAt:index];
	}
	[positionIndices removeAt:index];
	vertexCount--;
}

- (void) removeRangeAt:(int)index count:(int)count {
	for (int i = 0; i < count; i++) {
		[self removeAt:index];
	}
}

- (VertexBufferContent*) createVertexBuffer {
	VertexBufferContent *vertexBuffer = [[[VertexBufferContent alloc] init] autorelease];
	
	// Construct vertex declaration.
	VertexDeclarationContent *vertexDeclaration = [[[VertexDeclarationContent alloc] init] autorelease];

	// Add position element.
	VertexElement *vertexElement = [VertexElement vertexElementWithOffset:0 
																   format:VertexElementFormatVector3 
																	usage:VertexElementUsagePosition
															   usageIndex:0];
	[vertexDeclaration.vertexElements addObject:vertexElement];
	
	// Add all channel elements.
	int offset = [vertexElement getSize];
	for (VertexChannel *channel in channels) {
		VertexElementFormat elementFormat = [VertexElement getElementFormatForType:channel.elementType];
		
		VertexElementUsage elementUsage;
		if (![VertexChannelNames tryDecodeUsage:channel.name usage:&elementUsage]) {
			[NSException raise:@"NotSupportedException" format:@"The channel name %@ is not supported.", channel.name];
		}
		
		Byte usageIndex = [VertexChannelNames decodeUsageIndex:channel.name];
		
		vertexElement = [VertexElement vertexElementWithOffset:offset format:elementFormat usage:elementUsage usageIndex:usageIndex];
		[vertexDeclaration.vertexElements addObject:vertexElement];
		
		offset += [vertexElement getSize];
	}
	
	vertexDeclaration.vertexStride = [NSNumber numberWithInt:offset];
	
	vertexBuffer.vertexDeclaration = vertexDeclaration;
	
	// Fill the vertex data.
	for (int i = 0; i < vertexCount; i++) {
		// Add position.
		NSNumber *index = [positionIndices itemAt:i];
		Vector3 *position = [positions itemAt:[index intValue]];
		[vertexBuffer.vertexData appendBytes:position.data length:sizeof(Vector3Struct)];
		
		// Add all channel data.
		for (int j = 0; j < channels.count; j++) {
			VertexChannel *channel = [channels itemAt:j];
			if (channel.elementType == [Vector2 class]) {
				[vertexBuffer.vertexData appendBytes:((Vector2*)[channel itemAt:i]).data length:sizeof(Vector2Struct)];
			} else if (channel.elementType == [Vector3 class]) {
				[vertexBuffer.vertexData appendBytes:((Vector3*)[channel itemAt:i]).data length:sizeof(Vector3Struct)];
			}
		}
	}
	
	return vertexBuffer;
}

- (void) dealloc
{
	[channels release];
	[positionIndices release];
	[positions release];
	[super dealloc];
}


@end
