//
//  ShortIndexArray.m
//  XNI
//
//  Created by Matej Jan on 30.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "ShortIndexArray.h"

#import "Retronator.Xni.Framework.Graphics.h"

@implementation ShortIndexArray


- (id) initWithInitialCapacity:(int)initialCapacity {
	if (self = [super initWithItemSize:sizeof(short) initialCapacity:initialCapacity]) {
	}
	return self;
}

- (IndexElementSize) indexElementSize { 
	return IndexElementSizeSixteenBits; 
}

- (void) addIndex:(short)index {
	[super addIndex:&index];
}

@end
