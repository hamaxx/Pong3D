//
//  Vector3.h
//  XNI
//
//  Created by Matej Jan on 9.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Retronator.Xni.Framework.classes.h"

@interface Vector3 : NSObject {
    Vector3Struct data;
}

- (id) initWithX:(float)x y:(float)y z:(float)z;
- (id) initWithStruct: (Vector3Struct*)vectorData;
- (id) initWithVector: (Vector3*)vector;

+ (Vector3*) vectorWithX:(float)x y:(float)y z:(float)z;
+ (Vector3*) vectorWithStruct: (Vector3Struct*)vectorData;
+ (Vector3*) vectorWithVector: (Vector3*)vector;

@property (nonatomic) float x;
@property (nonatomic) float y;
@property (nonatomic) float z;

@property (nonatomic, readonly) Vector3Struct *data;

+ (Vector3*) normalize:(Vector3*)value;
+ (Vector3*) negate:(Vector3*)value;

+ (Vector3*) add:(Vector3*)value1 to:(Vector3*)value2;
+ (Vector3*) subtract:(Vector3*)value1 by:(Vector3*)value2;
+ (Vector3*) multiply:(Vector3*)value1 by:(float)scaleFactor;

+ (Vector3*) crossProductOf:(Vector3*)value1 with:(Vector3*)value2;
+ (float) dotProductOf:(Vector3*)value1 with:(Vector3*)value2;

+ (Vector3*) transform:(Vector3*)value with:(Matrix*)matrix;
+ (Vector3*) transformNormal:(Vector3*)value with:(Matrix*)matrix;

- (float) length;
- (float) lengthSquared;

- (Vector3*) normalize;
- (Vector3*) negate;
- (Vector3*) add:(Vector3*)value;
- (Vector3*) subtract:(Vector3*)value;
- (Vector3*) multiplyBy:(float)scaleFactor;
- (Vector3*) transformWith:(Matrix*)matrix;
- (Vector3*) transformNormalWith:(Matrix*)matrix;

// Constants
+ (Vector3*) zero;
+ (Vector3*) one;
+ (Vector3*) unitX;
+ (Vector3*) unitY;
+ (Vector3*) unitZ;
+ (Vector3*) up;
+ (Vector3*) down;
+ (Vector3*) left;
+ (Vector3*) right;
+ (Vector3*) forward;
+ (Vector3*) backward;

@end
