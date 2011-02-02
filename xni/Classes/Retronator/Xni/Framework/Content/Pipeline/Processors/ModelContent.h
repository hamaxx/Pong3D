//
//  ModelContent.h
//  XNI
//
//  Created by Matej Jan on 22.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Retronator.Xni.Framework.Content.Pipeline.Processors.classes.h"

@interface ModelContent : NSObject {
	ModelBoneContentCollection *bones;
	ModelMeshContentCollection *meshes;
	ModelBoneContent *root;
	id tag;
}

@property (nonatomic, readonly) ModelBoneContentCollection *bones;
@property (nonatomic, readonly) ModelMeshContentCollection *meshes;
@property (nonatomic, readonly) ModelBoneContent *root;
@property (nonatomic, retain) id tag;

@end
