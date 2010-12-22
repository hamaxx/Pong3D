//
//  Matrix.h
//  XNI
//
//  Created by Matej Jan on 9.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Retronator.Xni.Framework.classes.h"

@interface Matrix : NSObject <NSCopying> {
    MatrixStruct data;
}

- (id) initWithMatrixStruct: (MatrixStruct*)matrixData;
- (id) initWithMatrix: (Matrix*)matrix;

+ (Matrix*) matrixWithStruct: (MatrixStruct*)matrixData;
+ (Matrix*) matrixWithMatrix: (Matrix*)matrix;

+ (Matrix*) createTranslationX:(float)xPosition y:(float)yPosition z:(float)zPosition;
+ (Matrix*) createTranslation:(Vector3*)position;

+ (Matrix*) createScaleUniform:(float)scale;
+ (Matrix*) createScale:(Vector3*)scales;

+ (Matrix*) createRotationX:(float)radians;
+ (Matrix*) createRotationY:(float)radians;
+ (Matrix*) createRotationZ:(float)radians;
+ (Matrix*) createFromAxis:(Vector3*)axis angle:(float)angle;
+ (Matrix*) createFromQuaternion:(Quaternion*)quaternion;

+ (Matrix*) createLookAtFrom:(Vector3*)position to:(Vector3*)target up:(Vector3*)up;

+ (Matrix*) createOrthographicWithWidth:(float)width height:(float)height 
							 zNearPlane:(float)zNearPlane zFarPlane:(float)zFarPlane;
+ (Matrix*) createOrthographicOffCenterWithLeft:(float)left right:(float)right 
										 bottom:(float)bottom top:(float)top 
									 zNearPlane:(float)zNearPlane zFarPlane:(float)zFarPlane;
+ (Matrix*) createPerspectiveWithWidth:(float)width height:(float)height 
					 nearPlaneDistance:(float)nearPlaneDistance farPlaneDistance:(float)farPlaneDistance;
+ (Matrix*) createPerspectiveFieldOfView:(float)fieldOfView aspectRatio:(float)aspectRatio
					   nearPlaneDistance:(float)nearPlaneDistance farPlaneDistance:(float)farPlaneDistance;
+ (Matrix*) createPerspectiveOffCenterWithLeft:(float)left right:(float)right
										bottom:(float)bottom top:(float)top  
							 nearPlaneDistance:(float)nearPlaneDistance farPlaneDistance:(float)farPlaneDistance;

+ (Matrix*) createWorldAtPosition:(Vector3*)position forward:(Vector3*)forward up:(Vector3*)up;

@property (nonatomic, readonly) MatrixStruct *data;
@property (nonatomic, assign) Vector3 *left;
@property (nonatomic, assign) Vector3 *right;
@property (nonatomic, assign) Vector3 *up;
@property (nonatomic, assign) Vector3 *down;
@property (nonatomic, assign) Vector3 *forward;
@property (nonatomic, assign) Vector3 *backward;
@property (nonatomic, assign) Vector3 *translation;

+ (Matrix*) negate:(Matrix*)value;
+ (Matrix*) transpose:(Matrix*)value;
+ (Matrix*) invert:(Matrix*)value;

+ (Matrix*) add:(Matrix*)value1 to:(Matrix*)value2;
+ (Matrix*) subtract:(Matrix*)value1 by:(Matrix*)value2;
+ (Matrix*) multiply:(Matrix*)value1 byScalar:(float)scaleFactor;
+ (Matrix*) multiply:(Matrix*)value1 by:(Matrix*)value2;
+ (Matrix*) divide:(Matrix*)value1 byScalar:(float)divider;
+ (Matrix*) divide:(Matrix*)value1 by:(Matrix*)value2;

- (float) determinant;
- (Matrix*) negate;
- (Matrix*) set:(Matrix*)value;
- (Matrix*) add:(Matrix*)value;
- (Matrix*) subtract:(Matrix*)value;
- (Matrix*) multiplyByScalar:(float)scaleFactor;
- (Matrix*) multiplyBy:(Matrix*)value;
- (Matrix*) divideByScalar:(float)divider;
- (Matrix*) divideBy:(Matrix*)value;

- (BOOL) equals:(Matrix*)matrix;

// Constants
+ (id) zero;
+ (id) identity;

@end
