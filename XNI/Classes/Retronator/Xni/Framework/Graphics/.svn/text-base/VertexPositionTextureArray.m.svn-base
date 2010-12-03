//
//  VertexPositionTextureArray.m
//  XNI
//
//  Created by Matej Jan on 21.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "VertexPositionTextureArray.h"

#import "Retronator.Xni.Framework.Graphics.h"

@implementation VertexPositionTextureArray

- (id) initWithInitialCapacity:(int)initialCapacity {
	if (self = [super initWithItemSize:sizeof(VertexPositionTextureStruct) initialCapacity:initialCapacity]) {
	}
	return self;
}

- (VertexDeclaration *) vertexDeclaration { 
	return [VertexPositionTexture vertexDeclaration];
}

- (void) addVertex:(VertexPositionTextureStruct*)vertex {
	[super addVertex:vertex];
}

@end
