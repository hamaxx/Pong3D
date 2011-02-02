//
//  Viewport.m
//  XNI
//
//  Created by Matej Jan on 23.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "Viewport.h"

#import "Retronator.Xni.Framework.h"

@implementation Viewport

- (id) init
{
	self = [super init];
	if (self != nil) {
		minDepth = 0;
		maxDepth = 1;
	}
	return self;
}


- (float) aspectRatio {
	return (float)width/(float)height;
}

@synthesize height;
@synthesize maxDepth;
@synthesize minDepth;

- (Rectangle *) titleSafeArea {
	int border = height * 0.05;
	return [Rectangle rectangleWithX:x + border y:y + border width:width - 2 * border height:height - 2* border];
}

@synthesize width;
@synthesize x;
@synthesize y;

- (Vector3 *) project:(Vector3 *)source projection:(Matrix *)projection view:(Matrix *)view world:(Matrix *)world {
	Vector4 *projectionSpace = [Vector4 vectorWithX:source.x y:source.y z:source.z w:1];
	[[[projectionSpace transformWith:world] transformWith:view] transformWith:projection];
	projectionSpace.z *= (maxDepth - minDepth);
	[projectionSpace multiplyBy:1/projectionSpace.w];
	
	float resultX = x + (projectionSpace.x + 1) / 2 * width;
	float resultY = y - (projectionSpace.y - 1) / 2 * height;
	float resultZ = minDepth + projectionSpace.z;
	return [Vector3 vectorWithX:resultX y:resultY z:resultZ];	
}

- (Vector3 *) unproject:(Vector3 *)source projection:(Matrix *)projection view:(Matrix *)view world:(Matrix *)world {
	float projectionX = (source.x - x) * 2 / width - 1;
	float projectionY = -((source.y - y) * 2 / height) + 1;
	float projectionZ = (source.z - minDepth) / (maxDepth - minDepth);
	
	Vector4 *objectSpace = [Vector4 vectorWithX:projectionX y:projectionY z:projectionZ w:1];
	[objectSpace transformWith:[Matrix invert:projection]];
	[objectSpace transformWith:[Matrix invert:view]];
	[objectSpace transformWith:[Matrix invert:world]];
	[objectSpace multiplyBy:1/objectSpace.w];
	
	return [Vector3 vectorWithX:objectSpace.x y:objectSpace.y z:objectSpace.z];
}

@end
