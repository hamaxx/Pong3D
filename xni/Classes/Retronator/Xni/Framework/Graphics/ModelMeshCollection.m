//
//  ModelMeshCollection.m
//  XNI
//
//  Created by Matej Jan on 22.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "ModelMeshCollection.h"

#import "Retronator.Xni.Framework.Graphics.h"

#define ReadOnlyCollection ModelMeshCollection
#define T ModelMesh*
#define Initialization meshes = [[NSMutableDictionary alloc] init]; for (ModelMesh* mesh in collection) {[meshes setObject:mesh forKey:mesh.name];}
#define Disposing [meshes release];

#include "ReadOnlyCollection.m.h"

@implementation ModelMeshCollection (Custom)

- (ModelMesh *) itemForName:(NSString *)name {
	return [meshes objectForKey:name];
}

@end


#undef ReadOnlyCollection
#undef T
#undef Initialization