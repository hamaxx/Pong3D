//
//  Vector4.m
//  XNI
//
//  Created by Matej Jan on 9.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "Vector4.h"

#import "Retronator.Xni.Framework.h"

@implementation Vector4

// CONSTRUCTORS

- (id) initWithX:(float)x y:(float)y z:(float)z w:(float)w {
    if (self = [super init]) {
        data = Vector4Make(x, y, z, w);
    }
    return self;
}

- (id) initWithStruct: (Vector4Struct*)vectorData {
    if (self = [super init]) {
        data = *vectorData;
    }
    return self;
}

- (id) initWithVector: (Vector4*)vector {
    return [self initWithStruct:vector.data];  
}

+ (Vector4*) vectorWithX:(float)x y:(float)y z:(float)z w:(float)w {
    return [[[Vector4 alloc] initWithX:x y:y z:z w:w] autorelease];
}

+ (Vector4*) vectorWithStruct: (Vector4Struct*)vectorData {
    return [[[Vector4 alloc] initWithStruct:vectorData] autorelease];
}

+ (Vector4*) vectorWithVector: (Vector4*)vector {
    return [[[Vector4 alloc] initWithVector:vector] autorelease];
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

+ (Vector4*) normalize:(Vector4*)value {
    Vector4Struct resultData = *value.data;
    Vector4Normalize(&resultData);
    return [Vector4 vectorWithStruct:&resultData];
}

+ (Vector4*) negate:(Vector4*)value {
    Vector4Struct resultData = *value.data;
    Vector4Negate(&resultData);
    return [Vector4 vectorWithStruct:&resultData];    
}

+ (Vector4*) add:(Vector4*)value1 to:(Vector4*)value2 {
    Vector4Struct resultData;
    Vector4Add(value1.data, value2.data, &resultData);
    return [Vector4 vectorWithStruct:&resultData];
}

+ (Vector4*) subtract:(Vector4*)value1 by:(Vector4*)value2 {
    Vector4Struct resultData;
    Vector4Subtract(value1.data, value2.data, &resultData);
    return [Vector4 vectorWithStruct:&resultData];    
}

+ (Vector4*) multiply:(Vector4*)value by:(float)scalar {
    Vector4Struct resultData;
    Vector4Multiply(value.data, scalar, &resultData);
    return [Vector4 vectorWithStruct:&resultData];    
}

+ (Vector4*) transform:(Vector4*)value with:(Matrix*)matrix {
    Vector4Struct resultData;
    Vector4Transform(value.data, matrix.data, &resultData);
    return [Vector4 vectorWithStruct:&resultData];
}

- (float) length {
    return Vector4Length(self.data);
}

- (float) lengthSquared {
    return Vector4LengthSquared(self.data);
}

- (Vector4*) normalize {
    Vector4Normalize(&data);
    return self;
}
- (Vector4*) negate {
    Vector4Negate(&data);
    return self;
}

- (Vector4*) add:(Vector4*)value {
    Vector4Add(self.data, value.data, self.data);
    return self;
}

- (Vector4*) subtract:(Vector4*)value {
    Vector4Subtract(self.data, value.data, self.data);
    return self;
}

- (Vector4*) multiplyBy:(float)scalar {
    Vector4Multiply(self.data, scalar, self.data);
    return self;
}

- (Vector4*) transformWith:(Matrix*)matrix {
    Vector4Transform(self.data, matrix.data, self.data);
    return self;
}

- (NSString *) description {
    return [NSString stringWithFormat:@"Vector(%f, %f, %f, %f)", data.x, data.y, data.z, data.w];
}

// Constants

+ (Vector4*) zero {return [Vector4 vectorWithX:0 y:0 z:0 w:0];}
+ (Vector4*) one {return [Vector4 vectorWithX:1 y:1 z:1 w:1];}
+ (Vector4*) unitX {return [Vector4 vectorWithX:1 y:0 z:0 w:0];}
+ (Vector4*) unitY {return [Vector4 vectorWithX:0 y:1 z:0 w:0];}
+ (Vector4*) unitZ {return [Vector4 vectorWithX:0 y:0 z:1 w:0];}
+ (Vector4*) unitW {return [Vector4 vectorWithX:0 y:0 z:0 w:1];}

@end
