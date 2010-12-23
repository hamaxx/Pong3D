//
//  Vector4.h
//  XNI
//
//  Created by Matej Jan on 9.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Retronator.Xni.Framework.classes.h"

@interface Vector4 : NSObject <NSCopying> {
    Vector4Struct data;
}

- (id) initWithX:(float)x y:(float)y z:(float)z w:(float)w;
- (id) initWithVector4Struct: (Vector4Struct*)vectorData;
- (id) initWithVector4: (Vector4*)vector;

+ (Vector4*) vectorWithX:(float)x y:(float)y z:(float)z w:(float)w;
+ (Vector4*) vectorWithStruct: (Vector4Struct*)vectorData;
+ (Vector4*) vectorWithVector: (Vector4*)vector;

@property (nonatomic) float x;
@property (nonatomic) float y;
@property (nonatomic) float z;
@property (nonatomic) float w;
@property (nonatomic, readonly) Vector4Struct *data;

+ (Vector4*) normalize:(Vector4*)value;
+ (Vector4*) negate:(Vector4*)value;
+ (Vector4*) add:(Vector4*)value1 to:(Vector4*)value2;
+ (Vector4*) subtract:(Vector4*)value1 by:(Vector4*)value2;
+ (Vector4*) multiply:(Vector4*)value by:(float)scalar;
+ (Vector4*) transform:(Vector4*)value with:(Matrix*)matrix;

- (float) length;
- (float) lengthSquared;
- (Vector4*) normalize;
- (Vector4*) negate;
- (Vector4*) set:(Vector4*)value;
- (Vector4*) add:(Vector4*)value;
- (Vector4*) subtract:(Vector4*)value;
- (Vector4*) multiplyBy:(float)scalar;
- (Vector4*) transformWith:(Matrix*)matrix;

- (BOOL) equals:(Vector4*)vector;

// Constants
+ (Vector4*) zero;
+ (Vector4*) one;
+ (Vector4*) unitX;
+ (Vector4*) unitY;
+ (Vector4*) unitZ;
+ (Vector4*) unitW;


@end
