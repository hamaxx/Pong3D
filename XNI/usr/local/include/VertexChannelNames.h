//
//  VertexChannelNames.h
//  XNI
//
//  Created by Matej Jan on 26.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Retronator.Xni.Framework.Graphics.classes.h"

@interface VertexChannelNames : NSObject {

}

+ (NSString*) encodeName:(NSString*)baseName usageIndex:(int)usageIndex;
+ (NSString*) encodeUsage:(VertexElementUsage)vertexElementUsage usageIndex:(int)usageIndex;

+ (NSString*) decodeBaseName:(NSString*)encodedName;
+ (int) decodeUsageIndex:(NSString*)encodedName;
+ (BOOL) tryDecodeUsage:(NSString*)encodedName usage:(VertexElementUsage*)usage;

+ (NSString*) binormalWithUsageIndex:(int)usageIndex;
+ (NSString*) colorWithUsageIndex:(int)usageIndex;
+ (NSString*) normal;
+ (NSString*) normalWithUsageIndex:(int)usageIndex;
+ (NSString*) tangentWithUsageIndex:(int)usageIndex;
+ (NSString*) textureCoordinateWithUsageIndex:(int)usageIndex;
+ (NSString*) weights;
+ (NSString*) weightsWithUsageIndex:(int)usageIndex;

@end
