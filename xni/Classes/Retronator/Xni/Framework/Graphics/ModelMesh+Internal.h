//
//  ModelMesh+Internal.h
//  XNI
//
//  Created by Matej Jan on 22.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ModelMesh (Internal)

- (id) initWithName:(NSString*)theName parentBone:(ModelBone*)theParentBone modelMeshParts:(NSArray*)theModelMeshParts tag:(id)theTag;

@end
