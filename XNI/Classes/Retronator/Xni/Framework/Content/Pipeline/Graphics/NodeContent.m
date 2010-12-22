//
//  NodeContent.m
//  XNI
//
//  Created by Matej Jan on 22.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "NodeContent.h"

#import "Retronator.Xni.Framework.h"
#import "Retronator.Xni.Framework.Content.Pipeline.Graphics.h"

@implementation NodeContent

- (id) init
{
	self = [super init];
	if (self != nil) {
		children = [[NodeContentCollection alloc] initWithParent:self];
		transform = [[Matrix identity] retain];
	}
	return self;
}

@synthesize children, parent, transform;

- (Matrix *) absoluteTransform {
	if (!parent) {
		// Create a new matrix in the root node.
		return [Matrix matrixWithMatrix:transform];
	} else {
		// Multiply the passed down matrix with itself.
		return [parent.absoluteTransform multiplyBy:transform];
	}
}

- (void) dealloc
{
	[transform release];
	[children release];
	[super dealloc];
}




@end
