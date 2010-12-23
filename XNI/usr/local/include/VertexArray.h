//
//  VertexArray.h
//  XNI
//
//  Created by Matej Jan on 21.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

@class XniAdaptiveArray;

#import "Retronator.Xni.Framework.Graphics.classes.h"

@interface VertexArray : NSObject {
    XniAdaptiveArray *array;
}

- (id) initWithItemSize:(int)itemSize initialCapacity:(int)initialCapacity;

@property (nonatomic, readonly) void *array;
@property (nonatomic, readonly) int count;
@property (nonatomic, readonly) int sizeInBytes;
@property (nonatomic, readonly) VertexDeclaration *vertexDeclaration;

- (void) clear;
- (void) addVertex:(void*)vertex;

@end