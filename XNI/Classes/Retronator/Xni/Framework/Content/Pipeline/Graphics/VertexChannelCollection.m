//
//  VertexChannelCollection.m
//  XNI
//
//  Created by Matej Jan on 26.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "VertexChannelCollection.h"

#import "Retronator.Xni.Framework.Content.Pipeline.Graphics.h"

@implementation VertexChannelCollection

- (id) initWithParent:(VertexContent*)theParent
{
	self = [super init];
	if (self != nil) {
		channels = [[NSMutableArray alloc] init];
		channelsByNames = [[NSMutableDictionary alloc] init];
		parent = theParent;
	}
	return self;
}

- (int) count {
	return [channels count];
}

- (VertexChannel*)itemAt:(int)index {
	return [channels objectAtIndex:index];
}

- (void)setItem:(VertexChannel*)item at:(int)index {
	VertexChannel* existing = [channels objectAtIndex:index];
	[channelsByNames removeObjectForKey:existing.name];
	return [channels replaceObjectAtIndex:index withObject:item];
}

- (VertexChannel*)itemWithName:(NSString*)name {
	return [channelsByNames objectForKey:name];
}

- (void)addChannelWithName:(NSString*)name elementType:(Class)elementType channelData:(NSArray*)channelData {
	[self insertChannelWithName:name elementType:elementType channelData:channelData at:[channels count]];
}

- (void)insertChannelWithName:(NSString*)name elementType:(Class)elementType channelData:(NSArray*)channelData at:(int)index {
	if (!channelData) {
		// Fill the channel with default values.
		NSMutableArray *data = [NSMutableArray arrayWithCapacity:parent.vertexCount];
		for (int i = 0; i < parent.vertexCount; i++) {
			[data addObject:[[[elementType alloc] init] autorelease]];
		}
		channelData = data;
	}
	VertexChannel *channel = [[[VertexChannel alloc] initWithElementType:elementType name:name channelData:channelData] autorelease];
	[channels insertObject:channel atIndex:index];
	[channelsByNames setObject:channel forKey:name];	
}

- (void)remove:(VertexChannel*)item {
	[channels removeObject:item];
	[channelsByNames removeObjectForKey:item.name];
}

- (void)removeAt:(int)index {
	VertexChannel *channel = [channels objectAtIndex:index];
	[self remove:channel];
}

- (void) removeChannelWithName:(NSString *)name {
	VertexChannel *channel = [self itemWithName:name];
	[self remove:channel];
}

- (void) clear {
	[channels removeAllObjects];
	[channelsByNames removeAllObjects];
}

- (NSUInteger) countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(id *)stackbuf count:(NSUInteger)len {
	return [channels countByEnumeratingWithState:state objects:stackbuf count:len];
}

- (void) dealloc
{
	[channels release];
	[channelsByNames release];
	[super dealloc];
}

@end
