//
//  Quaternion.h
//  XNI
//
//  Created by Matej Jan on 9.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Retronator.Xni.Framework.classes.h"

@interface Quaternion : NSObject {
    Vector4Struct data;
}

- (id) initWithX:(float)x y:(float)y z:(float)z w:(float)w;
- (id) initWithVectorPart:(Vector3*)vector scalarPart:(float)scalar;
- (id) initWithStruct: (Vector4Struct*)quaternionData;
- (id) initWithQuaternion: (Quaternion*)quaternion;

+ (Quaternion*) quaternionWithX:(float)x y:(float)y z:(float)z w:(float)w;
+ (Quaternion*) quaternionWithVectorPart:(Vector3*)vector scalarPart:(float)scalar;
+ (Quaternion*) quaternionWithStruct: (Vector4Struct*)quaternionData;
+ (Quaternion*) quaternionWithQuaternion: (Quaternion*)quaternion;

+ (Quaternion*) axis:(Vector3*)axis angle:(float)angle;
+ (Quaternion*) rotationMatrix:(Matrix*)matrix;

@property (nonatomic) float x;
@property (nonatomic) float y;
@property (nonatomic) float z;
@property (nonatomic) float w;

@property (nonatomic, readonly) Vector4Struct *data;

+ (Quaternion*) normalize:(Quaternion*)value;
+ (Quaternion*) negate:(Quaternion*)value;
+ (Quaternion*) inverse:(Quaternion*)value;
+ (Quaternion*) add:(Quaternion*)value1 to:(Quaternion*)value2;
+ (Quaternion*) subtract:(Quaternion*)value1 by:(Quaternion*)value2;
+ (Quaternion*) multiply:(Quaternion*)value1 byScalar:(float)scaleFactor;
+ (Quaternion*) multiply:(Quaternion*)value1 by:(Quaternion*)value2;

- (float) length;
- (float) lengthSquared;

- (Quaternion*) normalize;
- (Quaternion*) negate;
- (Quaternion*) inverse;
- (Quaternion*) add:(Quaternion*)value;
- (Quaternion*) subtract:(Quaternion*)value;
- (Quaternion*) multiplyByScalar:(float)scaleFactor;
- (Quaternion*) multiplyBy:(Quaternion*)value;

// Constants
+ (Quaternion*) identity;

@end
