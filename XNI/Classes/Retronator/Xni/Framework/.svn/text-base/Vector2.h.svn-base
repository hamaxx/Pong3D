//
//  Vector2.h
//  XNI
//
//  Created by Matej Jan on 9.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Retronator.Xni.Framework.classes.h"

@interface Vector2 : NSObject <NSCopying> {
    Vector2Struct data;
}

- (id) initWithX:(float)x y:(float)y;
- (id) initWithVector2Struct: (Vector2Struct*)vectorData;
- (id) initWithVector2: (Vector2*)vector;

+ (Vector2*) vectorWithX:(float)x y:(float)y;
+ (Vector2*) vectorWithStruct: (Vector2Struct*)vectorData;
+ (Vector2*) vectorWithVector: (Vector2*)vector;

@property (nonatomic) float x;
@property (nonatomic) float y;

@property (nonatomic, readonly) Vector2Struct *data;

+ (Vector2*) normalize:(Vector2*)value;
+ (Vector2*) negate:(Vector2*)value;

+ (Vector2*) add:(Vector2*)value1 to:(Vector2*)value2;
+ (Vector2*) subtract:(Vector2*)value1 by:(Vector2*)value2;
+ (Vector2*) multiply:(Vector2*)value1 by:(float)scaleFactor;

+ (float) dotProductOf:(Vector2*)value1 with:(Vector2*)value2;

+ (Vector2*) transform:(Vector2*)value with:(Matrix*)matrix;
+ (Vector2*) transformNormal:(Vector2*)value with:(Matrix*)matrix;

- (float) length;
- (float) lengthSquared;

- (Vector2*) normalize;
- (Vector2*) negate;
- (Vector2*) set:(Vector2*)value;
- (Vector2*) add:(Vector2*)value;
- (Vector2*) subtract:(Vector2*)value;
- (Vector2*) multiplyBy:(float)scaleFactor;
- (Vector2*) transformWith:(Matrix*)matrix;
- (Vector2*) transformNormalWith:(Matrix*)matrix;

- (BOOL) equals:(Vector2*)vector;

// Constants
+ (Vector2*) zero;
+ (Vector2*) one;
+ (Vector2*) unitX;
+ (Vector2*) unitY;

@end
