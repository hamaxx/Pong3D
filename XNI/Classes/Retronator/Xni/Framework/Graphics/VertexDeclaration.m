//
//  VertexDeclaration.m
//  XNI
//
//  Created by Matej Jan on 21.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "VertexDeclaration.h"

#import "Retronator.Xni.Framework.Graphics.h"

@implementation VertexDeclaration

- (id) initWithElements:(NSArray *)theVertexElements {
    if (self = [super init]) {
        vertexElements = [theVertexElements retain];
		
	    vertexStride = 0;
		for (VertexElement* vertexElement in vertexElements) {
			vertexStride += [vertexElement getSize];
		}	
    }
    return self;
}

@synthesize vertexElements;
@synthesize vertexStride;

- (void) dealloc
{
    [vertexElements release];
    [super dealloc];
}

@end

