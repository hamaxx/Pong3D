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

@end
