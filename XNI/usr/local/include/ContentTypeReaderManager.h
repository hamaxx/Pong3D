//
//  ContentTypeReaderManager.h
//  XNI
//
//  Created by Matej Jan on 10.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Retronator.Xni.Framework.Content.classes.h"

@interface ContentTypeReaderManager : NSObject {
	Texture2DReader *texture2DReader;
	ModelReader *modelReader;
	ModelMeshReader *modelMeshReader;
	ModelMeshPartReader *modelMeshPartReader;
	BasicEffectReader *basicEffectReader;
	IndexBufferReader *indexBufferReader;
	VertexBufferReader *vertexBufferReader;
	ModelBoneReader *modelBoneReader;
	VertexDeclarationReader *vertexDeclarationReader;
	SoundEffectReader *soundEffectReader;
	SongReader *songReader;
	SpriteFontReader *spriteFontReader;
}

- (ContentTypeReader*) getTypeReaderFor:(Class)targetType;

@end
