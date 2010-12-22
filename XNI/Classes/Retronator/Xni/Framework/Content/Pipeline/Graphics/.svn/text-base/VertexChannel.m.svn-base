//
//  VertexChannel.m
//  XNI
//
//  Created by Matej Jan on 26.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "VertexChannel.h"


@implementation VertexChannel

- (id) initWithElementType:(Class)theElementType name:(NSString*)theName channelData:(NSArray*)channelData
{
	self = [super init];
	if (self != nil) {
		collection = [[NSMutableArray alloc] initWithArray:channelData];					
		elementType = theElementType;
		name = theName;
	}
	return self;
}

@synthesize elementType, name;

- (int) count {
	return [collection count];
}

- (id)itemAt:(int)index {
	return [collection objectAtIndex:index];
}

- (void)setItem:(id)item at:(int)index {
	return [collection replaceObjectAtIndex:index withObject:item];
}

- (void)add:(id)item {
	[collection addObject:item];
}

- (void)insert:(id)item at:(int)index {
	[collection insertObject:item atIndex:index];
}

- (void)remove:(id)item {
	[collection removeObject:item];
}

- (void)removeAt:(int)index {
	[collection removeObjectAtIndex:index];
}

- (void) clear {
	[collection removeAllObjects];
}

- (NSUInteger) countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(id *)stackbuf count:(NSUInteger)len {
	return [collection countByEnumeratingWithState:state objects:stackbuf count:len];
}

- (void) dealloc
{
	[collection dealloc];
	[super dealloc];
}

@end
