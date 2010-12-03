//
//  Vector2.m
//  XNI
//
//  Created by Matej Jan on 9.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "Vector2.h"

#import "Retronator.Xni.Framework.h"

@implementation Vector2

// CONSTRUCTORS

- (id) initWithX:(float)x y:(float)y {
    if (self = [super init]) {
        data = Vector2Make(x, y);
    }
    return self;
}

- (id) initWithStruct: (Vector2Struct*)vectorData {
    if (self = [super init]) {
        data = *vectorData;
    }
    return self;
}

- (id) initWithVector: (Vector2*)vector {
    return [self initWithStruct:vector.data];  
}

+ (Vector2*) vectorWithX:(float)x y:(float)y{
    return [[[Vector2 alloc] initWithX:x y:y] autorelease];
}

+ (Vector2*) vectorWithStruct: (Vector2Struct*)vectorData {
    return [[[Vector2 alloc] initWithStruct:vectorData] autorelease];
}

+ (Vector2*) vectorWithVector: (Vector2*)vector {
    return [[[Vector2 alloc] initWithVector:vector] autorelease];
}

// PROPERTIES

- (float) x {return data.x;}
- (void) setX:(float)value {data.x = value;}

- (float) y {return data.y;}
- (void) setY:(float)value {data.y = value;}

- (Vector2Struct*) data {return &data;}

// METHODS

+ (Vector2*) normalize:(Vector2*)value {
    Vector2Struct resultData = *value.data;
    Vector2Normalize(&resultData);
    return [Vector2 vectorWithStruct:&resultData];
}

+ (Vector2*) negate:(Vector2*)value {
    Vector2Struct resultData = *value.data;
    Vector2Negate(&resultData);
    return [Vector2 vectorWithStruct:&resultData];    
}

+ (Vector2*) add:(Vector2*)value1 to:(Vector2*)value2 {
    Vector2Struct resultData;
    Vector2Add(value1.data, value2.data, &resultData);
    return [Vector2 vectorWithStruct:&resultData];
}

+ (Vector2*) subtract:(Vector2*)value1 by:(Vector2*)value2 {
    Vector2Struct resultData;
    Vector2Subtract(value1.data, value2.data, &resultData);
    return [Vector2 vectorWithStruct:&resultData];    
}

+ (Vector2*) multiply:(Vector2*)value by:(float)scalar {
    Vector2Struct resultData;
    Vector2Multiply(value.data, scalar, &resultData);
    return [Vector2 vectorWithStruct:&resultData];    
}

+ (float) dotProductOf:(Vector2*)value1 with:(Vector2*)value2 {
    return Vector2DotProduct(value1.data, value2.data);
}

+ (Vector2*) transform:(Vector2*)value with:(Matrix*)matrix {
    Vector2Struct resultData;
    Vector2Transform(value.data, matrix.data, &resultData);
    return [Vector2 vectorWithStruct:&resultData];
}

+ (Vector2*) transformNormal:(Vector2*)value with:(Matrix*)matrix {
    Vector2Struct resultData;
    Vector2TransformNormal(value.data, matrix.data, &resultData);
    return [Vector2 vectorWithStruct:&resultData];
}

- (float) length {
    return Vector2Length(self.data);
}

- (float) lengthSquared {
    return Vector2LengthSquared(self.data);
}

- (Vector2*) normalize {
    Vector2Normalize(&data);
    return self;
}
- (Vector2*) negate {
    Vector2Negate(&data);
    return self;
}

- (Vector2*) set:(Vector2 *)value {
	data = *value.data;
	return self;
}

- (Vector2*) add:(Vector2*)value {
    Vector2Add(self.data, value.data, self.data);
    return self;
}

- (Vector2*) subtract:(Vector2*)value {
    Vector2Subtract(self.data, value.data, self.data);
    return self;
}

- (Vector2*) multiplyBy:(float)scalar {
    Vector2Multiply(self.data, scalar, self.data);
    return self;
}

- (Vector2*) transformWith:(Matrix*)matrix {
    Vector2Transform(self.data, matrix.data, self.data);
    return self;
}

- (Vector2*) transformNormalWith:(Matrix*)matrix {
    Vector2TransformNormal(self.data, matrix.data, self.data);
    return self;
}

- (NSString *) description {
    return [NSString stringWithFormat:@"Vector(%f, %f)", data.x, data.y];
}

// Constants

+ (Vector2*) zero {return [Vector2 vectorWithX:0 y:0];}
+ (Vector2*) one {return [Vector2 vectorWithX:1 y:1];}
+ (Vector2*) unitX {return [Vector2 vectorWithX:1 y:0];}
+ (Vector2*) unitY {return [Vector2 vectorWithX:0 y:1];}

@end
