//
//  ModelMeshContent.h
//  XNI
//
//  Created by Matej Jan on 22.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Retronator.Xni.Framework.Content.Pipeline.Processors.classes.h"
#import "Retronator.Xni.Framework.Content.Pipeline.Graphics.classes.h"

@interface ModelMeshContent : NSObject {
	ModelMeshPartContentCollection *meshParts;
	NSString *name;
	ModelBoneContent *parentBone;
	id tag;
	MeshContent *sourceMesh;
}

@property (nonatomic, readonly) ModelMeshPartContentCollection *meshParts;
@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) ModelBoneContent *parentBone;
@property (nonatomic, retain) id tag;
@property (nonatomic, readonly) MeshContent *sourceMesh;

@end
