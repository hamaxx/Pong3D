//
//  Vector3.m
//  XNI
//
//  Created by Matej Jan on 9.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "Vector3.h"

#import "Retronator.Xni.Framework.h"

@implementation Vector3

// CONSTRUCTORS

- (id) initWithX:(float)x y:(float)y z:(float)z {
    if (self = [super init]) {
        data = Vector3Make(x, y, z);
    }
    return self;
}

- (id) initWithVector3Struct: (Vector3Struct*)vectorData {
    if (self = [super init]) {
        data = *vectorData;
    }
    return self;
}

- (id) initWithVector3: (Vector3*)vector {
    return [self initWithVector3Struct:vector.data];  
}

+ (Vector3*) vectorWithX:(float)x y:(float)y z:(float)z {
    return [[[Vector3 alloc] initWithX:x y:y z:z] autorelease];
}

+ (Vector3*) vectorWithStruct: (Vector3Struct*)vectorData {
    return [[[Vector3 alloc] initWithVector3Struct:vectorData] autorelease];
}

+ (Vector3*) vectorWithVector: (Vector3*)vector {
    return [[[Vector3 alloc] initWithVector3:vector] autorelease];
}

// PROPERTIES

- (float) x {return data.x;}
- (void) setX:(float)value {data.x = value;}

- (float) y {return data.y;}
- (void) setY:(float)value {data.y = value;}

- (float) z {return data.z;}
- (void) setZ:(float)value {data.z = value;}

- (Vector3Struct*) data {return &data;}

// METHODS

+ (Vector3*) normalize:(Vector3*)value {
    Vector3Struct resultData = *value.data;
    Vector3Normalize(&resultData);
    return [Vector3 vectorWithStruct:&resultData];
}

+ (Vector3*) negate:(Vector3*)value {
    Vector3Struct resultData = *value.data;
    Vector3Negate(&resultData);
    return [Vector3 vectorWithStruct:&resultData];    
}

+ (Vector3*) add:(Vector3*)value1 to:(Vector3*)value2 {
    Vector3Struct resultData;
    Vector3Add(value1.data, value2.data, &resultData);
    return [Vector3 vectorWithStruct:&resultData];
}

+ (Vector3*) subtract:(Vector3*)value1 by:(Vector3*)value2 {
    Vector3Struct resultData;
    Vector3Subtract(value1.data, value2.data, &resultData);
    return [Vector3 vectorWithStruct:&resultData];    
}

+ (Vector3*) multiply:(Vector3*)value by:(float)scalar {
    Vector3Struct resultData;
    Vector3Multiply(value.data, scalar, &resultData);
    return [Vector3 vectorWithStruct:&resultData];    
}

+ (Vector3*) crossProductOf:(Vector3*)value1 with:(Vector3*)value2 {
    Vector3Struct resultData;
    Vector3CrossProduct(value1.data, value2.data, &resultData);
    return [Vector3 vectorWithStruct:&resultData];  
}

+ (float) dotProductOf:(Vector3*)value1 with:(Vector3*)value2 {
    return Vector3DotProduct(value1.data, value2.data);
}

+ (Vector3*) transform:(Vector3*)value with:(Matrix*)matrix {
    Vector3Struct resultData;
    Vector3Transform(value.data, matrix.data, &resultData);
    return [Vector3 vectorWithStruct:&resultData];
}

+ (Vector3*) transformNormal:(Vector3*)value with:(Matrix*)matrix {
    Vector3Struct resultData;
    Vector3TransformNormal(value.data, matrix.data, &resultData);
    return [Vector3 vectorWithStruct:&resultData];
}

- (float) length {
    return Vector3Length(self.data);
}

- (float) lengthSquared {
    return Vector3LengthSquared(self.data);
}

- (Vector3*) normalize {
    Vector3Normalize(&data);
    return self;
}

- (Vector3*) negate {
    Vector3Negate(&data);
    return self;
}

- (Vector3*) set:(Vector3 *)value {
	data = *value.data;
	return self;
}

- (Vector3*) add:(Vector3*)value {
    Vector3Add(self.data, value.data, self.data);
    return self;
}

- (Vector3*) subtract:(Vector3*)value {
    Vector3Subtract(self.data, value.data, self.data);
    return self;
}

- (Vector3*) multiplyBy:(float)scalar {
    Vector3Multiply(self.data, scalar, self.data);
    return self;
}

- (Vector3*) transformWith:(Matrix*)matrix {
    Vector3Transform(self.data, matrix.data, self.data);
    return self;
}

- (Vector3*) transformNormalWith:(Matrix*)matrix {
    Vector3TransformNormal(self.data, matrix.data, self.data);
    return self;
}

- (id) copyWithZone:(NSZone *)zone {
	return [[Vector3 allocWithZone:zone] initWithVector3Struct:&data];
}

- (BOOL) equals:(Vector3*)vector {
	if (!vector) return NO;
	return vector.data->x == data.x && vector.data->y == data.y &&
	vector.data->z == data.z;
}

- (BOOL) isEqual:(id)object {
    if ([object isKindOfClass:[Vector3 class]]) {
        return [self equals:object];
    }
    return NO;
}


- (NSString *) description {
    return [NSString stringWithFormat:@"Vector(%f, %f, %f)", data.x, data.y, data.z];
}

// Constants

+ (Vector3*) zero {return [Vector3 vectorWithX:0 y:0 z:0];}
+ (Vector3*) one {return [Vector3 vectorWithX:1 y:1 z:1];}
+ (Vector3*) unitX {return [Vector3 vectorWithX:1 y:0 z:0];}
+ (Vector3*) unitY {return [Vector3 vectorWithX:0 y:1 z:0];}
+ (Vector3*) unitZ {return [Vector3 vectorWithX:0 y:0 z:1];}
+ (Vector3*) up {return [Vector3 vectorWithX:0 y:1 z:0];}
+ (Vector3*) down {return [Vector3 vectorWithX:0 y:-1 z:0];}
+ (Vector3*) left {return [Vector3 vectorWithX:-1 y:0 z:0];}
+ (Vector3*) right {return [Vector3 vectorWithX:1 y:0 z:0];}
+ (Vector3*) forward {return [Vector3 vectorWithX:0 y:0 z:-1];}
+ (Vector3*) backward {return [Vector3 vectorWithX:0 y:0 z:1];}

@end
