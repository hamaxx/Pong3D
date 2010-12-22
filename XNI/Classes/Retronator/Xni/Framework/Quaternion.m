//
//  Quaternion.m
//  XNI
//
//  Created by Matej Jan on 9.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "Quaternion.h"

#import "Retronator.Xni.Framework.h"

@implementation Quaternion

- (id) initWithX:(float)x y:(float)y z:(float)z w:(float)w {
    if (self = [super init]) {
        data = Vector4Make(x, y, z, w);
    }
    return self;
}

- (id) initWithVectorPart:(Vector3 *)vector scalarPart:(float)scalar {
    if (self = [super init]) {
        data = Vector4Make(vector.x, vector.y, vector.z, scalar);
    }
    return self;
}

- (id) initWithVector4Struct: (Vector4Struct*)quaternionData {
    if (self = [super init]) {
        data = *quaternionData;
    }
    return self;
}

- (id) initWithQuaternion: (Quaternion*)quaternion {
    return [self initWithVector4Struct:quaternion.data];  
}

+ (Quaternion*) quaternionWithX:(float)x y:(float)y z:(float)z w:(float)w {
    return [[[Quaternion alloc] initWithX:x y:y z:z w:w] autorelease];
}

+ (Quaternion*) quaternionWithVectorPart:(Vector3 *)vector scalarPart:(float)scalar {
    return [[[Quaternion alloc] initWithVectorPart:vector scalarPart:scalar] autorelease];
}

+ (Quaternion*) quaternionWithStruct: (Vector4Struct*)quaternionData {
    return [[[Quaternion alloc] initWithVector4Struct:quaternionData] autorelease];
}

+ (Quaternion*) quaternionWithQuaternion: (Quaternion*)quaternion {
    return [[[Quaternion alloc] initWithQuaternion:quaternion] autorelease];
}

+ (Quaternion*) axis:(Vector3 *)axis angle:(float)angle {
    float s = sinf(angle / 2.0f);
    float c = cosf(angle / 2.0f);
    return [Quaternion quaternionWithVectorPart:[Vector3 multiply:axis by:s] scalarPart:c];
}

+ (Quaternion *) rotationMatrix:(Matrix *)matrix {
    Quaternion *result = [[[Quaternion alloc] init] autorelease];
    
    if ((matrix.data->m11 + matrix.data->m22 + matrix.data->m33) > 0.0F) {
        float M1 = sqrtf(matrix.data->m11 + matrix.data->m22 + matrix.data->m33 + 1);
        result.w = M1 * 0.5F;
        M1 = 0.5F / M1;
        result.x = (matrix.data->m23 - matrix.data->m32) * M1;
        result.y = (matrix.data->m31 - matrix.data->m13) * M1;
        result.z = (matrix.data->m12 - matrix.data->m21) * M1;
        return result;
    }
    
    if ((matrix.data->m11 >= matrix.data->m22) && (matrix.data->m11 >= matrix.data->m33)) {
        float M2 = sqrtf(1 + matrix.data->m11 - matrix.data->m22 - matrix.data->m33);
        float M3 = 0.5F / M2;
        result.x = 0.5F * M2;
        result.y = (matrix.data->m12 + matrix.data->m21) * M3;
        result.z = (matrix.data->m13 + matrix.data->m31) * M3;
        result.w = (matrix.data->m23 - matrix.data->m32) * M3;
        return result;
    }
    
    if (matrix.data->m22 > matrix.data->m33) {
        float M4 = sqrtf(1 + matrix.data->m22 - matrix.data->m11 - matrix.data->m33);
        float M5 = 0.5F / M4;
        result.x = (matrix.data->m21 + matrix.data->m12) * M5;
        result.y = 0.5F * M4;
        result.z = (matrix.data->m32 + matrix.data->m23) * M5;
        result.w = (matrix.data->m31 - matrix.data->m13) * M5;
        return result;
    }
    
    float M6 = sqrtf(1 + matrix.data->m33 - matrix.data->m11 - matrix.data->m22);
    float M7 = 0.5F / M6;
    result.x = (matrix.data->m31 + matrix.data->m13) * M7;
    result.y = (matrix.data->m32 + matrix.data->m23) * M7;
    result.z = 0.5F * M6;
    result.w = (matrix.data->m12 - matrix.data->m21) * M7;
    return result;
}

// PROPERTIES

- (float) x {return data.x;}
- (void) setX:(float)value {data.x = value;}

- (float) y {return data.y;}
- (void) setY:(float)value {data.y = value;}

- (float) z {return data.z;}
- (void) setZ:(float)value {data.z = value;}

- (float) w {return data.w;}
- (void) setW:(float)value {data.w = value;}

- (Vector4Struct*) data {return &data;}

// METHODS

+ (Quaternion*) normalize:(Quaternion*)value {
    Vector4Struct resultData = *value.data;
    Vector4Normalize(&resultData);
    return [Quaternion quaternionWithStruct:&resultData];
}

+ (Quaternion*) negate:(Quaternion*)value {
    Vector4Struct resultData = *value.data;
    Vector4Negate(&resultData);
    return [Quaternion quaternionWithStruct:&resultData];    
}

+ (Quaternion*) inverse:(Quaternion*)value {
    Vector4Struct resultData = *value.data;
    QuaternionInverse(&resultData);
    return [Quaternion quaternionWithStruct:&resultData];    
}

+ (Quaternion *) add:(Quaternion *)value1 to:(Quaternion *)value2 {
    Vector4Struct resultData;
    Vector4Add(value1.data, value2.data, &resultData);
    return [Quaternion quaternionWithStruct:&resultData];
}

+ (Quaternion *) subtract:(Quaternion *)value1 by:(Quaternion *)value2 {
    Vector4Struct resultData;
    Vector4Subtract(value1.data, value2.data, &resultData);
    return [Quaternion quaternionWithStruct:&resultData];    
}

+ (Quaternion *) multiply:(Quaternion *)value byScalar:(float)scaleFactor {
    Vector4Struct resultData;
    Vector4Multiply(value.data, scaleFactor, &resultData);
    return [Quaternion quaternionWithStruct:&resultData];
}

+ (Quaternion *) multiply:(Quaternion *)value1 by:(Quaternion *)value2 {
    Vector4Struct resultData;
    QuaternionMultiply(value1.data, value2.data, &resultData);
    return [Quaternion quaternionWithStruct:&resultData];
}

- (float) length {
    return Vector4Length(self.data);
}

- (float) lengthSquared {
    return Vector4LengthSquared(self.data);
}

- (Quaternion*) normalize {
    Vector4Normalize(&data);
    return self;
}

- (Quaternion*) negate {
    Vector4Negate(&data);
    return self;
}

- (Quaternion*) inverse {
    QuaternionInverse(&data);
    return self;
}

- (Quaternion*) set:(Quaternion *)value {
	data = *value.data;
	return self;
}

- (Quaternion *) add:(Quaternion *)value {
    Vector4Add(self.data, value.data, self.data);
    return self;
}

- (Quaternion *) subtract:(Quaternion *)value {
    Vector4Subtract(self.data, value.data, self.data);
    return self;    
}

- (Quaternion *) multiplyByScalar:(float)scaleFactor {
    Vector4Multiply(self.data, scaleFactor, self.data);
    return self;    
}

- (Quaternion *) multiplyBy:(Quaternion *)value {
    QuaternionMultiply(self.data, value.data, self.data);
    return self;    
}

- (id) copyWithZone:(NSZone *)zone {
	return [[Quaternion allocWithZone:zone] initWithVector4Struct:&data];
}

- (BOOL) equals:(Quaternion*)quaternion {
	if (!quaternion) return NO;
	return quaternion.data->x == data.x && quaternion.data->y == data.y &&
	quaternion.data->z == data.z && quaternion.data->w == data.w;
}

- (BOOL) isEqual:(id)object {
    if ([object isKindOfClass:[Vector4 class]]) {
        return [self equals:object];
    }
    return NO;
}

- (NSString *) description {
    return [NSString stringWithFormat:@"Quaternion(%f, %f, %f, %f)", data.x, data.y, data.z, data.w];
}

+ (Quaternion *) identity {
    Vector4Struct data = Vector4Make(0, 0, 0, 1);
    return [Quaternion quaternionWithStruct:&data];
}

@end
