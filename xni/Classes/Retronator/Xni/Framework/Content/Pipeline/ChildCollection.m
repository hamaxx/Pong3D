//
//  ChildCollection.m
//  XNI
//
//  Created by Matej Jan on 26.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "ChildCollection.h"


@implementation ChildCollection

- (id) initWithParent:(id)theParent
{
	self = [super init];
	if (self != nil) {
		children = [[NSMutableArray alloc] init];
		parent = theParent;
	}
	return self;
}

- (int) count {
	return [children count];
}

- (id)itemAt:(int)index {
	return [children objectAtIndex:index];
}

- (void)setItem:(id)item at:(int)index{
	[self setParentOf:[self itemAt:index] to:nil];
	[self setParentOf:item to:parent];
	[children replaceObjectAtIndex:index withObject:item];
}

- (void)add:(id)item{
	[self setParentOf:item to:parent];
	[children addObject:item];
}

- (void)insert:(id)item at:(int)index{
	[self setParentOf:item to:parent];
	[children insertObject:item atIndex:index];
}

- (void)remove:(id)item{
	[self setParentOf:item to:nil];
	[children removeObject:item];
}

- (void)removeAt:(int)index{
	[self setParentOf:[self itemAt:index] to:nil];
	[children removeObjectAtIndex:index];
}

- (NSUInteger) countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(id *)stackbuf count:(NSUInteger)len {
	return [children countByEnumeratingWithState:state objects:stackbuf count:len];
}


// Override this methods in the child implementation.
- (id)getParentOf:(id)child {return nil;}

- (void)setParentOf:(id)child to:(id)theParent {}

- (void) dealloc
{
	[children release];
	[super dealloc];
}


@end
