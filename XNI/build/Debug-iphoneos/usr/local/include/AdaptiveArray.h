//
//  AdaptiveArray.h
//  XNI
//
//  Created by Matej Jan on 21.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface AdaptiveArray : NSObject {
    int capacity;
    int itemSize;
    void *array;
    int count;
}

- (id) initWithItemSize:(int)theItemSize initialCapacity:(int)theCapacity;

@property (nonatomic, readonly) int itemSize;
@property (nonatomic, readonly) void *array;
@property (nonatomic, readonly) int count;

- (void) addItem:(void*)item;
- (void) clear;

@end
