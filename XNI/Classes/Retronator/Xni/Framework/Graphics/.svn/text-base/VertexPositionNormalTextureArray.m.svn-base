//
//  VertexPositionNormalTextureArray.m
//  XNI
//
//  Created by Matej Jan on 29.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "VertexPositionNormalTextureArray.h"

#import "Retronator.Xni.Framework.Graphics.h"

@implementation VertexPositionNormalTextureArray

- (id) initWithInitialCapacity:(int)initialCapacity {
	if (self = [super initWithItemSize:sizeof(VertexPositionNormalTextureStruct) initialCapacity:initialCapacity]) {
	}
	return self;
}

- (VertexDeclaration *) vertexDeclaration { 
	return [VertexPositionNormalTexture vertexDeclaration];
}

- (void) addVertex:(VertexPositionNormalTextureStruct*)vertex {
	[super addVertex:vertex];
}

@end
