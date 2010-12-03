//
//  VertexPositionColorArray.m
//  XNI
//
//  Created by Matej Jan on 21.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "VertexPositionColorArray.h"

#import "Retronator.Xni.Framework.Graphics.h"

@implementation VertexPositionColorArray

- (id) initWithInitialCapacity:(int)initialCapacity {
	if (self = [super initWithItemSize:sizeof(VertexPositionColorStruct) initialCapacity:initialCapacity]) {
	}
	return self;
}

- (VertexDeclaration *) vertexDeclaration { 
	return [VertexPositionColor vertexDeclaration];
}

- (void) addVertex:(VertexPositionColorStruct*)vertex {
	[super addVertex:vertex];
}

@end
