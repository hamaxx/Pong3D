//
//  ModelMeshContent+Internal.h
//  XNI
//
//  Created by Matej Jan on 22.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ModelMeshContent.h"

@interface ModelMeshContent (Internal)

- (id) initWithName:(NSString*)theName parentBone:(ModelBoneContent*)theParentBone modelMeshParts:(NSArray*)theModelMeshParts tag:(id)theTag sourceMesh:(MeshContent*)theSourceMesh;

@end
