//
//  MipmapChain.m
//  XNI
//
//  Created by Matej Jan on 10.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "MipmapChain.h"

#import "Retronator.Xni.Framework.Content.Pipeline.Graphics.h"

@implementation MipmapChain

- (id) init
{
	self = [super init];
	if (self != nil) {
		chain = [[NSMutableArray alloc] init];
	}
	return self;
}

- (int) count {
	return [chain count];
}

- (BitmapContent*)objectAtIndex:(NSUInteger)index {
	return (BitmapContent*)[chain objectAtIndex:index];
}

- (void)addObject:(BitmapContent*)anObject {
	[chain addObject:anObject];
}

- (void)insertObject:(BitmapContent*)anObject atIndex:(NSUInteger)index {
	[chain insertObject:anObject atIndex:index];
}

- (void) dealloc
{
	[chain release];
	[super dealloc];
}


@end
