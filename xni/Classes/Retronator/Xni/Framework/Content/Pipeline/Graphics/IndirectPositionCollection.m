//
//  IndirectPositionCollection.m
//  XNI
//
//  Created by Matej Jan on 26.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "IndirectPositionCollection.h"

#import "Retronator.Xni.Framework.Content.Pipeline.Graphics.h"

@implementation IndirectPositionCollection

- (id) initWithPositionIndices:(VertexChannel*)thePositionIndices positions:(PositionCollection*)thePositions
{
	self = [super init];
	if (self != nil) {
		positionIndices = [thePositionIndices retain];
		positions = [thePositions retain];
	}
	return self;
}

- (Vector3*)itemAt:(int)index {
	NSNumber *positionIndex = [positionIndices itemAt:index];
	return [positions itemAt:[positionIndex intValue]];
}

- (void)setItem:(Vector3*)item at:(int)index {
	NSNumber *positionIndex = [positionIndices itemAt:index];
	[positions setItem:item at:[positionIndex intValue]];
}

- (void) dealloc
{
	[positionIndices release];
	[positions release];
	[super dealloc];
}


@end
