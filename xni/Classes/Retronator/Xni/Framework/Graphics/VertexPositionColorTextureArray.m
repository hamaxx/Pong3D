//
//  VertexPositionColorTextureArray.m
//  XNI
//
//  Created by Matej Jan on 23.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "VertexPositionColorTextureArray.h"

#import "Retronator.Xni.Framework.Graphics.h"

@implementation VertexPositionColorTextureArray

- (id) initWithInitialCapacity:(int)initialCapacity {
	if (self = [super initWithItemSize:sizeof(VertexPositionColorTextureStruct) initialCapacity:initialCapacity]) {
	}
	return self;
}

- (VertexDeclaration *) vertexDeclaration { 
	return [VertexPositionColorTexture vertexDeclaration];
}

- (void) addVertex:(VertexPositionColorTextureStruct*)vertex {
	[super addVertex:vertex];
}

@end
