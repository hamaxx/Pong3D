//
//  VertexChannelNames.m
//  XNI
//
//  Created by Matej Jan on 26.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "VertexChannelNames.h"

@interface VertexChannelNames ()

+ (NSString*) getNameForUsage:(VertexElementUsage)vertexElementUsage;
+ (BOOL) tryGetUsageForName:(NSString *)name usage:(VertexElementUsage*)usage;

@end


@implementation VertexChannelNames

+ (NSString*) getNameForUsage:(VertexElementUsage)vertexElementUsage {
	switch (vertexElementUsage) {
		case VertexElementUsageColor:
			return @"Color";
		case VertexElementUsageNormal:
			return @"Normal";
		case VertexElementUsagePointSize:
			return @"PointSize";
		case VertexElementUsagePosition:
			return @"Position";
		case VertexElementUsageTextureCoordinate:
			return @"TextureCoordinate";
		case VertexElementUsageBinormal:
			return @"Binormal";
		case VertexElementUsageBlendIndices:
			return @"BlendIndices";
		case VertexElementUsageBlendWeight:
			return @"BlendWeight";
		case VertexElementUsageDepth:
			return @"Depth";
		case VertexElementUsageFog:
			return @"Fog";
		case VertexElementUsageSample:
			return @"Sample";
		case VertexElementUsageTangent:
			return @"Tangent";
		case VertexElementUsageTessellateFactor:
			return @"TessellateFactor";
		default:
			[NSException raise:@"InvalidArgumentException" format:@"VertexElementUsage %i is not supported", vertexElementUsage];
			return @"";
	}
}

+ (BOOL) tryGetUsageForName:(NSString *)name usage:(VertexElementUsage*)usage {
	if ([name isEqualToString:@"Color"]) {
		*usage = VertexElementUsageColor;
		return YES;
	} else if ([name isEqualToString:@"Normal"]) {
		*usage =  VertexElementUsageNormal;
		return YES;
	} else if ([name isEqualToString:@"PointSize"]) {
		*usage =  VertexElementUsagePointSize;
		return YES;
	} else if ([name isEqualToString:@"Position"]) {
		*usage =  VertexElementUsagePosition;
		return YES;
	} else if ([name isEqualToString:@"TextureCoordinate"]) {
		*usage =  VertexElementUsageTextureCoordinate;
		return YES;
	} else if ([name isEqualToString:@"Binormal"]) {
		*usage =  VertexElementUsageBinormal;
		return YES;
	} else if ([name isEqualToString:@"BlendIndices"]) {
		*usage =  VertexElementUsageBlendIndices;
		return YES;
	} else if ([name isEqualToString:@"BlendWeight"]) {
		*usage =  VertexElementUsageBlendWeight;
		return YES;
	} else if ([name isEqualToString:@"Depth"]) {
		*usage =  VertexElementUsageDepth;
		return YES;
	} else if ([name isEqualToString:@"Fog"]) {
		*usage =  VertexElementUsageFog;
		return YES;
	} else if ([name isEqualToString:@"Sample"]) {
		*usage =  VertexElementUsageSample;
		return YES;
	} else if ([name isEqualToString:@"Tangent"]) {
		*usage =  VertexElementUsageTangent;
		return YES;
	} else if ([name isEqualToString:@"TessellateFactor"]) {
		*usage =  VertexElementUsageTessellateFactor;
		return YES;
	} else {
		return NO;
	}
}

+ (NSString*) encodeName:(NSString*)baseName usageIndex:(int)usageIndex {
	return [NSString stringWithFormat:@"%@-%i", baseName, usageIndex];
}

+ (NSString*) encodeUsage:(VertexElementUsage)vertexElementUsage usageIndex:(int)usageIndex {
	return [VertexChannelNames encodeName:[VertexChannelNames getNameForUsage:vertexElementUsage] usageIndex:usageIndex];
}

+ (NSString*) decodeBaseName:(NSString*)encodedName {
	return [[encodedName componentsSeparatedByString:@"-"] objectAtIndex:0];
}

+ (int) decodeUsageIndex:(NSString*)encodedName {
	NSString *index = [[encodedName componentsSeparatedByString:@"-"] objectAtIndex:1];	
	return [index intValue]; 
}

+ (BOOL) tryDecodeUsage:(NSString*)encodedName usage:(VertexElementUsage*)usage {
	return [VertexChannelNames tryGetUsageForName:[VertexChannelNames decodeBaseName:encodedName] usage:usage];
}

+ (NSString*) binormalWithUsageIndex:(int)usageIndex {
	return [VertexChannelNames encodeUsage:VertexElementUsageBinormal usageIndex:usageIndex];
}

+ (NSString*) colorWithUsageIndex:(int)usageIndex {
	return [VertexChannelNames encodeUsage:VertexElementUsageColor usageIndex:usageIndex];
}

+ (NSString*) normal {
	return [VertexChannelNames encodeUsage:VertexElementUsageNormal usageIndex:0];
}

+ (NSString*) normalWithUsageIndex:(int)usageIndex {
	return [VertexChannelNames encodeUsage:VertexElementUsageNormal usageIndex:usageIndex];
}

+ (NSString*) tangentWithUsageIndex:(int)usageIndex {
	return [VertexChannelNames encodeUsage:VertexElementUsageTangent usageIndex:usageIndex];
}

+ (NSString*) textureCoordinateWithUsageIndex:(int)usageIndex {
	return [VertexChannelNames encodeUsage:VertexElementUsageTextureCoordinate usageIndex:usageIndex];
}

+ (NSString*) weights {
	return [VertexChannelNames encodeUsage:VertexElementUsageBlendWeight usageIndex:0];
}

+ (NSString*) weightsWithUsageIndex:(int)usageIndex {
	return [VertexChannelNames encodeUsage:VertexElementUsageBlendWeight usageIndex:usageIndex];
}

@end
