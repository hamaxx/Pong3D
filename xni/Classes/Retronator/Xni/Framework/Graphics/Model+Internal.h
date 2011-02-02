//
//  Model+Internal.h
//  XNI
//
//  Created by Matej Jan on 22.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Model.h"
#import "Retronator.Xni.Framework.Content.classes.h"

@interface Model (Internal)

- (id) initWithBones:(NSArray*)theBones meshes:(NSArray*)theMeshes root:(ModelBone*)theRoot tag:(id)theTag;

@end
