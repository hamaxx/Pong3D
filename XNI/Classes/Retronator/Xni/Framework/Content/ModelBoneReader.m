//
//  ModelBoneReader.m
//  XNI
//
//  Created by Matej Jan on 29.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "ModelBoneReader.h"

#import "Retronator.Xni.Framework.Content.h"
#import "Retronator.Xni.Framework.Graphics.h"
#import "Retronator.Xni.Framework.Content.Pipeline.Processors.h"

#import "ModelBone+Internal.h"

@implementation ModelBoneReader

- (id) readFromInput:(ContentReader *)input into:(id)existingInstance {
	ModelBoneContent *content = input.content;
	
	NSMutableArray *children = [NSMutableArray array];
	
	// Create all children bones.
	for (ModelBoneContent *child in content.children) {
		ModelBone *childBone = [input readSharedResourceFrom:child];
		[children addObject:childBone];
	}
	
	// Create this bone.
	ModelBone *modelBone = [[[ModelBone alloc] initWithChildren:children
														  index:content.index
														   name:content.name  
													  transform:content.transform] autorelease];
	
	// Update children with new parent.
	for (ModelBone *child in children) {
		[child setParent:modelBone];
	}
	
	// Return created bone.
	return modelBone;
}

@end
