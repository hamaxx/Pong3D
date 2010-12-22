//
//  Model.h
//  XNI
//
//  Created by Matej Jan on 22.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Retronator.Xni.Framework.Graphics.classes.h"

@interface Model : NSObject {
	ModelBoneCollection *bones;
	ModelMeshCollection *meshes;
	ModelBone *root;
	id tag;
	
	NSMutableArray *absoluteBones;
}

@property (nonatomic, readonly) ModelBoneCollection *bones;
@property (nonatomic, readonly) ModelMeshCollection *meshes;
@property (nonatomic, readonly) ModelBone *root;
@property (nonatomic, retain) id tag;

- (void) copyAbsoluteBoneTransformsTo:(NSArray*)destinationBoneTransforms;

- (void) drawWithWorld:(Matrix*)world view:(Matrix*)view projection:(Matrix*)projection;

@end
