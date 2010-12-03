//
//  TouchCollection.m
//  XNI
//
//  Created by Matej Jan on 29.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "TouchCollection.h"

#import "Retronator.Xni.Framework.Input.Touch.h"

@implementation TouchCollection

- (id) init
{
	self = [super init];
	if (self != nil) {
		collection = [[NSMutableArray alloc] init];
	}
	return self;
}

- (id) initWithArray:(NSArray*)array {
	self = [super init];
	if (self != nil) {
		collection = [[NSMutableArray alloc] initWithArray:array];
	}
	return self;
}

- (int) count {
	return [collection count];
}

- (TouchLocation*)objectAtIndex:(NSUInteger)index {
	return (TouchLocation*)[collection objectAtIndex:index];
}

- (void)addObject:(TouchLocation*)anObject {
	[collection addObject:anObject];
}

- (void)insertObject:(TouchLocation*)anObject atIndex:(NSUInteger)index {
	[collection insertObject:anObject atIndex:index];
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
