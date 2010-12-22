//
//  VertexElement.h
//  XNI
//
//  Created by Matej Jan on 21.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Retronator.Xni.Framework.Graphics.classes.h"

@interface VertexElement : NSObject {
    int offset;
    int usageIndex;
    VertexElementFormat vertexElementFormat;
    VertexElementUsage vertexElementUsage;
}

- (id) initWithOffset:(int)theOffset format:(VertexElementFormat)elementFormat 
                usage:(VertexElementUsage)elementUsage usageIndex:(Byte)theUsageIndex;

+ (VertexElement*) vertexElementWithOffset:(int)theOffset format:(VertexElementFormat)elementFormat 
                usage:(VertexElementUsage)elementUsage usageIndex:(Byte)theUsageIndex;

@property (nonatomic) int offset;
@property (nonatomic) int usageIndex;
@property (nonatomic) VertexElementFormat vertexElementFormat;
@property (nonatomic) VertexElementUsage vertexElementUsage;

+ (VertexElementFormat) getElementFormatForType:(Class)type;

+ (int) getSizeForFormat:(VertexElementFormat)format;
+ (int) getValueDimensionsForFormat:(VertexElementFormat)format;
+ (DataType) getValueDataTypeForFormat:(VertexElementFormat)format;

- (int) getSize;
- (int) getValueDimensions;
- (DataType) getValueDataType;

@end
