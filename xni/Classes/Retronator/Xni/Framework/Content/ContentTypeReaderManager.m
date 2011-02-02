//
//  ContentTypeReaderManager.m
//  XNI
//
//  Created by Matej Jan on 10.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "ContentTypeReaderManager.h"

#import "Retronator.Xni.Framework.Content.h"
#import "Retronator.Xni.Framework.Content.Pipeline.Graphics.h"
#import "Retronator.Xni.Framework.Content.Pipeline.Processors.h"

@implementation ContentTypeReaderManager

- (id) init
{
	self = [super init];
	if (self != nil) {
		texture2DReader = [[Texture2DReader alloc] init];
		modelReader = [[ModelReader alloc] init];
		modelMeshReader = [[ModelMeshReader alloc] init];
		modelMeshPartReader = [[ModelMeshPartReader alloc] init];
		basicEffectReader = [[BasicEffectReader alloc] init];
		indexBufferReader = [[IndexBufferReader alloc] init];
		vertexBufferReader = [[VertexBufferReader alloc] init];
		modelBoneReader = [[ModelBoneReader alloc] init];
		vertexDeclarationReader = [[VertexDeclarationReader alloc] init];
		soundEffectReader = [[SoundEffectReader alloc] init];
		songReader = [[SongReader alloc] init];
		spriteFontReader = [[SpriteFontReader alloc] init];
	}
	return self;
}


- (ContentTypeReader *) getTypeReaderFor:(Class)targetType {
	if (targetType == [Texture2DContent class]) {
		return texture2DReader;
	} else if (targetType == [ModelContent class]) {
		return modelReader;
	} else if (targetType == [ModelMeshContent class]) {
		return modelMeshReader;
	} else if (targetType == [ModelMeshPartContent class]) {
		return modelMeshPartReader;
	} else if (targetType == [BasicMaterialContent class]) {
		return basicEffectReader;
	} else if (targetType == [IndexCollection class]) {
		return indexBufferReader;
	} else if (targetType == [VertexBufferContent class]) {
		return vertexBufferReader;
	} else if (targetType == [ModelBoneContent class]) {
		return modelBoneReader;
	} else if (targetType == [VertexDeclarationContent class]) {
		return vertexDeclarationReader;
	} else if (targetType == [SoundEffectContent class]) {
		return soundEffectReader;
	} else if (targetType == [SongContent class]) {
		return songReader;
	} else if (targetType == [SpriteFontContent class]) {
		return spriteFontReader;
	} else {
		return nil;
	}
}

- (void) dealloc
{
	[texture2DReader release];
	[modelReader release];
	[modelMeshReader release];
	[modelMeshPartReader release];
	[basicEffectReader release];
	[indexBufferReader release];
	[vertexBufferReader release];
	[modelBoneReader release];
	[vertexDeclarationReader release];
	[soundEffectReader release];
	[songReader release];
	[spriteFontReader release];
	[super dealloc];
}


@end
