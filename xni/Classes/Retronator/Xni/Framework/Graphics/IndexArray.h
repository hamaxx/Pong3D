//
//  IndexArray.h
//  XNI
//
//  Created by Matej Jan on 30.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Retronator.Xni.Framework.Graphics.classes.h"

@class XniAdaptiveArray;

@interface IndexArray : NSObject {
	XniAdaptiveArray *array;
}

- (id) initWithItemSize:(int)itemSize initialCapacity:(int)initialCapacity;

@property (nonatomic, readonly) void *array;
@property (nonatomic, readonly) int count;
@property (nonatomic, readonly) int sizeInBytes;
@property (nonatomic, readonly) IndexElementSize indexElementSize;

- (void) clear;
- (void) addIndex:(void*)index;

@end
