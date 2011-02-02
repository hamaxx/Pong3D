//
//  ModelContent+Internal.h
//  XNI
//
//  Created by Matej Jan on 22.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ModelContent.h"

@interface ModelContent (Internal)

- (id) initWithBones:(NSArray*)theBones meshes:(NSArray*)theMeshes root:(ModelBoneContent*)theRoot tag:(id)theTag;

@end
