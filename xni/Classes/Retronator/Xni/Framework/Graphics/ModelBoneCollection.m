//
//  ModelBoneCollection.m
//  XNI
//
//  Created by Matej Jan on 29.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "ModelBoneCollection.h"

#import "Retronator.Xni.Framework.Graphics.h"

#define ReadOnlyCollection ModelBoneCollection
#define T ModelBone*
#define Initialization bones = [[NSMutableDictionary alloc] init]; for (ModelBone* bone in collection) {if (bone.name) [bones setObject:bone forKey:bone.name];}
#define Disposing [bones release];

#include "ReadOnlyCollection.m.h"

@implementation ModelBoneCollection (Custom)

- (ModelBone *) itemForName:(NSString *)name {
	return [bones objectForKey:name];
}

@end


#undef ReadOnlyCollection
#undef T
#undef Initialization