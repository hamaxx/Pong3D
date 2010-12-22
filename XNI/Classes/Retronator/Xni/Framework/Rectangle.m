//
//  Rectangle.m
//  XNI
//
//  Created by Matej Jan on 22.7.10.
//  Copyright 2010 Retronator, Razum. All rights reserved.
//

#import "Rectangle.h"


@implementation Rectangle

// CONSTRUCTORS

- (id) initWithX:(int)x y:(int)y width:(int)width height:(int)height {
	if (self = [super init]) {
		data = RectangleMake(x, y, width, height);
	}
	return self;
}

- (id) initWithRectangleStruct:(RectangleStruct*) rectangleStruct {
	if (self = [super init]) {
		data = *rectangleStruct;
	}
	return self;
}

- (id) initWithRectangle:(Rectangle*) rectangle {
	return [self initWithRectangleStruct:rectangle.data];
}

+ (Rectangle*) rectangleWithX:(int)x y:(int)y width:(int)width height:(int)height {
	return [[[Rectangle alloc] initWithX:x y:y width:width height:height] autorelease];
}

+ (Rectangle*) rectangleWithStruct:(RectangleStruct*) rectangleStruct {
	return [[[Rectangle alloc] initWithRectangleStruct:rectangleStruct] autorelease];
}

+ (Rectangle*) rectangleWithRectangle:(Rectangle*) rectangle {
	return [[[Rectangle alloc] initWithRectangle:rectangle] autorelease];
}

+ (Rectangle*) rectangleWithCGRect:(CGRect) cgRect {
	return [Rectangle rectangleWithX:cgRect.origin.x y:cgRect.origin.y
							   width:cgRect.size.width height:cgRect.size.height];
}

// PROPERTIES

- (int) x {return data.x;}
- (void) setX:(int)value {data.x = value;}

- (int) y {return data.y;}
- (void) setY:(int)value {data.y = value;}

- (int) width {return data.width;}
- (void) setWidth:(int)value {data.width = value;}

- (int) height {return data.height;}
- (void) setHeight:(int)value {data.height = value;}

- (RectangleStruct*) data {return &data;}

// METHODS

- (Rectangle*) set:(Rectangle*)value {
	data = *value.data;
	return self;
}

- (id) copyWithZone:(NSZone *)zone {
	return [[Rectangle allocWithZone:zone] initWithRectangleStruct:&data];
}

- (BOOL) equals:(Rectangle*)rectangle {
	if (!rectangle) return NO;
	return rectangle.data->x == data.x && rectangle.data->y == data.y &&
	rectangle.data->width == data.width && rectangle.data->height == data.height;
}

- (BOOL) isEqual:(id)object {
    if ([object isKindOfClass:[Rectangle class]]) {
        return [self equals:object];
    }
    return NO;
}

- (NSUInteger) hash {
    return data.x ^ data.y ^ data.width ^ data.height;
}

- (NSString *) description {
    return [NSString stringWithFormat:@"Rectangle(%i, %i, %i, %i)", data.x, data.y, data.width, data.height];
}

// CONSTANTS

+ (Rectangle*) empty {return [Rectangle rectangleWithX:0 y:0 width:0 height:0];}

@end
