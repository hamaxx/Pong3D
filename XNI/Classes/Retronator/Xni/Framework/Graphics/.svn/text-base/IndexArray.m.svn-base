//
//  IndexArray.m
//  XNI
//
//  Created by Matej Jan on 30.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "IndexArray.h"

#import "XniAdaptiveArray.h"

@implementation IndexArray

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

- (IndexElementSize) indexElementSize { return 0; }

- (void) clear {
    [array clear];
}

- (void) addIndex:(void *)index {
	[array addItem:index];
}

- (void) dealloc
{
    [array release];
    [super dealloc];
}

@end
