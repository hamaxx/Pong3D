//
//  VertexElement.m
//  XNI
//
//  Created by Matej Jan on 21.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "VertexElement.h"

#import "Retronator.Xni.Framework.h"
#import "Retronator.Xni.Framework.Graphics.h"

@implementation VertexElement

- (id) initWithOffset:(int)theOffset format:(VertexElementFormat)elementFormat 
                usage:(VertexElementUsage)elementUsage usageIndex:(Byte)theUsageIndex {
    if (self = [super init]) {
        offset = theOffset;
        vertexElementFormat = elementFormat;
        vertexElementUsage = elementUsage;
        usageIndex = theUsageIndex;
    }
    return self;
}

+ (VertexElement*) vertexElementWithOffset:(int)theOffset format:(VertexElementFormat)elementFormat 
									 usage:(VertexElementUsage)elementUsage usageIndex:(Byte)theUsageIndex {
	return [[[VertexElement alloc] initWithOffset:theOffset format:elementFormat
											usage:elementUsage usageIndex:theUsageIndex] autorelease];
}

@synthesize offset;
@synthesize usageIndex;
@synthesize vertexElementFormat;
@synthesize vertexElementUsage;

+ (VertexElementFormat) getElementFormatForType:(Class)type {
	if (type == [NSNumber class]) {
		return VertexElementFormatSingle;
	} else if (type == [Vector2 class]) {
		return VertexElementFormatVector2;
	} else if (type == [Vector3 class]) {
		return VertexElementFormatVector3;
	} else if (type == [Vector4 class]) {
		return VertexElementFormatVector4;
	} else {
		[NSException raise:@"NotImplementedException" format:@"The type %@ is not a valid vertex element format.", type];
		return 0;
	}
}

+ (int) getSizeForFormat:(VertexElementFormat)format {
    switch (format) {
        case VertexElementFormatSingle:
            return sizeof(float);
        case VertexElementFormatVector2:
            return sizeof(Vector2Struct);
        case VertexElementFormatVector3:
            return sizeof(Vector3Struct);
		case VertexElementFormatVector4:
			return sizeof(Vector4Struct);
        case VertexElementFormatColor:
            return sizeof(uint);        
        default:
            [NSException raise:@"NotImplementedException" format:@"The vertex element format %i is not yet implemented.", format];
            return 0;
    }
}

+ (int) getValueDimensionsForFormat:(VertexElementFormat)format {
    switch (format) {
        case VertexElementFormatSingle:
            return 1;
        case VertexElementFormatVector2:
            return 2;
        case VertexElementFormatVector3:
            return 3;
		case VertexElementFormatVector4:
			return 4;
        case VertexElementFormatColor:
            return 4;        
        default:
            [NSException raise:@"NotImplementedException" format:@"The vertex element format %i is not yet implemented.", format];
            return 0;
    }    
}

+ (DataType) getValueDataTypeForFormat:(VertexElementFormat)format {
    switch (format) {
        case VertexElementFormatSingle:
            return DataTypeFloat;
        case VertexElementFormatVector2:
            return DataTypeFloat;
        case VertexElementFormatVector3:
            return DataTypeFloat;
		case VertexElementFormatVector4:
			return DataTypeFloat;
        case VertexElementFormatColor:
            return DataTypeUnsignedByte;        
        default:
            [NSException raise:@"NotImplementedException" format:@"The vertex element format %i is not yet implemented.", format];
            return 0;
    }    
}

- (int) getSize {
    return [VertexElement getSizeForFormat:vertexElementFormat];
}

- (int) getValueDimensions {
    return [VertexElement getValueDimensionsForFormat:vertexElementFormat];
}

- (DataType) getValueDataType {
    return [VertexElement getValueDataTypeForFormat:vertexElementFormat];
}
@end
