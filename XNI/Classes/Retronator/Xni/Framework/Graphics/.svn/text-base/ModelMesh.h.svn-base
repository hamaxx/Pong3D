//
//  ModelMesh.h
//  XNI
//
//  Created by Matej Jan on 22.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Retronator.Xni.Framework.Graphics.classes.h"

@interface ModelMesh : NSObject {
	ModelEffectCollection *effects;
	ModelMeshPartCollection *meshParts;
	NSString *name;
	ModelBone *parentBone;
	id tag;
}

@property (nonatomic, readonly) ModelEffectCollection *effects;
@property (nonatomic, readonly) ModelMeshPartCollection *meshParts;
@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) ModelBone *parentBone;
@property (nonatomic, retain) id tag;

- (void) draw;

@end
