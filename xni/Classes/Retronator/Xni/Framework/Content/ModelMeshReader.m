//
//  ModelMeshReader.m
//  XNI
//
//  Created by Matej Jan on 23.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "ModelMeshReader.h"

#import "Retronator.Xni.Framework.Content.h"
#import "Retronator.Xni.Framework.Graphics.h"
#import "Retronator.Xni.Framework.Content.Pipeline.Processors.h"
#import "ModelMesh+Internal.h"

@implementation ModelMeshReader

- (id) readFromInput:(ContentReader *)input into:(id)existingInstance {
	ModelMeshContent *content = input.content;
	
	// Create all model mesh parts.
	NSMutableArray *meshParts = [NSMutableArray array];
	for (ModelMeshPartContent *meshPartContent in content.meshParts) {
		id mp = [input readObjectFrom:meshPartContent];
		if (mp != nil) {
			[meshParts addObject:mp];
		}
	}
	
	ModelBone *parentBone = [input readSharedResourceFrom:content.parentBone];

	//NSLog(@"mash parts %d %@", [meshParts count], [[meshParts objectAtIndex:0] ]);
	
	ModelMesh *mesh = [[[ModelMesh alloc] initWithName:content.name parentBone:parentBone modelMeshParts:meshParts tag:content.tag] autorelease];

	return mesh;
}

@end
