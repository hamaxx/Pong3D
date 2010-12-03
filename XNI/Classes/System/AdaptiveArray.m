//
//  AdaptiveArray.m
//  XNI
//
//  Created by Matej Jan on 21.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "AdaptiveArray.h"

@implementation AdaptiveArray

- (id) initWithItemSize:(int)theItemSize initialCapacity:(int)theCapacity {
    if (self = [super init]) {
        itemSize = theItemSize;
        capacity = theCapacity;
        array = malloc(capacity * itemSize);
    }
    return self;
}

@synthesize itemSize;
@synthesize array;
@synthesize count;

- (void) addItem:(void *)item {
    if (count == capacity) {
        // Resize array
        void* newArray = malloc(capacity * 2 * itemSize);
        memcpy(newArray, array, capacity * itemSize);
        free(array);
        array = newArray;
        capacity *= 2;
    }
    memcpy(array + count * itemSize, item, itemSize);
    count++;
}

- (void) clear {
    count = 0;
}

- (void) dealloc
{
    free(array);
    [super dealloc];
}

@end

