//
//  VectorConverter.m
//  XNI
//
//  Created by Matej Jan on 9.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "VectorConverter.h"

#import "Retronator.Xni.Framework.h"
#import "Retronator.Xni.Framework.Graphics.PackedVector.h"

@implementation VectorConverter

+ (BOOL) tryGetSizeInBytesOfSurfaceFormat:(SurfaceFormat)surfaceFormat sizeInBytes:(int*)sizeInBytes {
	switch (surfaceFormat) {
		case SurfaceFormatColor:
			*sizeInBytes = sizeof(Byte4);
			return YES;
		case SurfaceFormatRgb565:
			*sizeInBytes = sizeof(Rgb565);
			return YES;
		case SurfaceFormatRgba5551:
			*sizeInBytes = sizeof(Rgba5551);
			return YES;
		case SurfaceFormatRgba4444:
			*sizeInBytes = sizeof(Rgba4444);
			return YES;
		case SurfaceFormatAlpha8:
			*sizeInBytes = sizeof(Alpha8);
			return YES;			
		default:
			break;
	}
	
	return NO;	
}

+ (BOOL) tryGetVectorTypeOfSurfaceFormat:(SurfaceFormat)surfaceFormat vectorType:(Class*)type {
	switch (surfaceFormat) {
		case SurfaceFormatColor:
			*type = [Vector4 class];
			return YES;
		case SurfaceFormatRgb565:
			*type = [Vector3 class];
			return YES;
		case SurfaceFormatRgba5551:
			*type = [Vector4 class];
			return YES;
		case SurfaceFormatRgba4444:
			*type = [Vector4 class];
			return YES;
		case SurfaceFormatAlpha8:
			*type = [NSNumber class];
			return YES;
		default:
			break;
	}
	
	return NO;
}

@end
