//
//  Collection.m.h
//  XNI
//
//  Created by Matej Jan on 26.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

// #define Collection CollectionName
// #define T DataType

@implementation Collection

- (id) init
{
	self = [super init];
	if (self != nil) {
		collection = [[NSMutableArray alloc] init];
	}
	return self;
}

- (int) count {
	return [collection count];
}

- (T)itemAt:(int)index {
	return [collection objectAtIndex:index];
}

- (void)setItem:(T)item at:(int)index {
	return [collection replaceObjectAtIndex:index withObject:item];
}

- (void)add:(T)item {
	[collection addObject:item];
}

- (void)addRange:(NSArray*)items {
	[collection addObjectsFromArray:items];
}

- (void)insert:(T)item at:(int)index {
	[collection insertObject:item atIndex:index];
}

- (void)remove:(T)item {
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
	[collection release];
	[super dealloc];
}

@end

// #undef Collection
// #undef T