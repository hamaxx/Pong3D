//
//  ModelBoneCollection.h
//  XNI
//
//  Created by Matej Jan on 29.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Retronator.Xni.Framework.Graphics.classes.h"

#define ReadOnlyCollection ModelBoneCollection
#define T ModelBone*
#define Variables NSMutableDictionary *bones;

#include "ReadOnlyCollection.h"

@interface ModelBoneCollection (Custom)

- (ModelBone*) itemForName:(NSString*)name;

@end


#undef ReadOnlyCollection
#undef T
#undef Variables