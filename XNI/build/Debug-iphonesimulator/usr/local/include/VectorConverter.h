//
//  VectorConverter.h
//  XNI
//
//  Created by Matej Jan on 9.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Retronator.Xni.Framework.Graphics.classes.h"


@interface VectorConverter : NSObject {

}

+ (BOOL) tryGetSizeInBytesOfSurfaceFormat:(SurfaceFormat)surfaceFormat sizeInBytes:(int*)sizeInBytes;

+ (BOOL) tryGetVectorTypeOfSurfaceFormat:(SurfaceFormat)surfaceFormat vectorType:(Class*)type;

@end
