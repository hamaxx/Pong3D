//
//  ModelReader.m
//  XNI
//
//  Created by Matej Jan on 22.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "ModelReader.h"

#import "Retronator.Xni.Framework.Content.h"
#import "Retronator.Xni.Framework.Graphics.h"
#import "Retronator.Xni.Framework.Content.Pipeline.Processors.h"
#import "Model+Internal.h"

@implementation ModelReader

- (id) readFromInput:(ContentReader *)input into:(id)existingInstance {
	ModelContent *content = input.content;
	
	// Create all model bones.
	NSMutableArray *bones = [NSMutableArray array];
	for (ModelBoneContent *boneContent in content.bones) {
		[bones addObject:[input readSharedResourceFrom:boneContent]];
	}
	
	// Create all model meshes.
	NSMutableArray *meshes = [NSMutableArray array];
	for (ModelMeshContent *meshContent in content.meshes) {
		[meshes addObject:[input readObjectFrom:meshContent]];
	}
	
	ModelBone *root = [input readSharedResourceFrom:content.root];
	
	Model *model = [[Model alloc] initWithBones:bones meshes:meshes root:root tag:nil];
	return [model autorelease];	
}

@end
