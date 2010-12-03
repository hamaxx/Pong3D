//
//  MipmapChainCollection.m
//  XNI
//
//  Created by Matej Jan on 10.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "MipmapChainCollection.h"

#import "Retronator.Xni.Framework.Content.Pipeline.Graphics.h"

@implementation MipmapChainCollection

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

- (MipmapChain*)objectAtIndex:(NSUInteger)index {
	return (MipmapChain*)[collection objectAtIndex:index];
}

- (void)addObject:(MipmapChain*)anObject {
	[collection addObject:anObject];
}

- (void)insertObject:(MipmapChain*)anObject atIndex:(NSUInteger)index {
	[collection insertObject:anObject atIndex:index];
}

- (void) dealloc
{
	[collection dealloc];
	[super dealloc];
}

@end
