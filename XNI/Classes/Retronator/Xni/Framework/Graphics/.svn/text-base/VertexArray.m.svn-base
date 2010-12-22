//
//  VertexArray.m
//  XNI
//
//  Created by Matej Jan on 21.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "VertexArray.h"

#import "XniAdaptiveArray.h"

@implementation VertexArray

- (id) initWithItemSize:(int)itemSize initialCapacity:(int)initialCapacity {
    if (self = [super init]) {
        array = [[XniAdaptiveArray alloc] initWithItemSize:itemSize initialCapacity:initialCapacity];
    }
    return self;
}

- (void *) array {
    return array.array;
}

- (int) count {
    return array.count;
}

- (int) sizeInBytes {
	return array.count * array.itemSize;
}

- (VertexDeclaration *) vertexDeclaration { return nil; }

- (void) clear {
    [array clear];
}

- (void) addVertex:(void *)vertex {
	[array addItem:vertex];
}

- (void) dealloc
{
    [array release];
    [super dealloc];
}

@end

