//
//  Model.m
//  XNI
//
//  Created by Matej Jan on 22.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "Model.h"
#import "Model+Internal.h"

#import "Retronator.Xni.Framework.h"
#import "Retronator.Xni.Framework.Graphics.h"
#import "ModelMesh+Internal.h"
#import "ModelMeshPart+Internal.h"
#import "Retronator.Xni.Framework.Content.h"
#import "Retronator.Xni.Framework.Content.Pipeline.Processors.h"

@interface Model ()

- (void) copyAbsoluteBoneTransformsTo:(NSArray *)destinationBoneTransforms forBone:(ModelBone*)bone;

@end


@implementation Model

- (id) initWithBones:(NSArray*)theBones meshes:(NSArray*)theMeshes root:(ModelBone*)theRoot tag:(id)theTag;
{
	self = [super init];
	if (self != nil) {
		bones = [[ModelBoneCollection alloc] initWithItems:theBones];
		meshes = [[ModelMeshCollection alloc] initWithItems:theMeshes];		
		root = [theRoot retain];
		self.tag = theTag;
		
		absoluteBones = [[NSMutableArray alloc] initWithCapacity:bones.count];
		for (int i = 0; i < bones.count; i++) {
			[absoluteBones addObject:[Matrix zero]];
		}
	}
	return self;
}

@synthesize bones, meshes, root, tag;

- (void) copyAbsoluteBoneTransformsTo:(NSArray *)destinationBoneTransforms {
	[self copyAbsoluteBoneTransformsTo:destinationBoneTransforms forBone:root];	
}

- (void) copyAbsoluteBoneTransformsTo:(NSArray *)destinationBoneTransforms forBone:(ModelBone*)bone {
	Matrix *parent = bone.parent ? [destinationBoneTransforms objectAtIndex:bone.parent.index] : [Matrix identity];
	Matrix *target = [destinationBoneTransforms objectAtIndex:bone.index];
	[target set:[Matrix multiply:parent by:bone.transform]];
	for (ModelBone *child in bone.children) {
		[self copyAbsoluteBoneTransformsTo:destinationBoneTransforms forBone:child];
	}
}

- (void) drawWithWorld:(Matrix *)world view:(Matrix *)view projection:(Matrix *)projection {
	[self copyAbsoluteBoneTransformsTo:absoluteBones];
	
	for (ModelMesh *mesh in meshes) {
		
		// Set matrices on all mesh's effects.
		for (Effect *effect in mesh.effects) {
			BasicEffect *basicEffect = [effect isKindOfClass:[BasicEffect class]] ? (BasicEffect*)effect : nil;
			
			if (basicEffect) {
				basicEffect.world = [Matrix multiply:[absoluteBones objectAtIndex:mesh.parentBone.index] by:world];
				basicEffect.view = view;
				basicEffect.projection = projection;
			}
		}
		
		// Draw the mesh.
		[mesh draw];
	}
}

- (void) dealloc
{
	[absoluteBones release];
	[bones release];
	[meshes release];
	[root release];
	[tag release];
	[super dealloc];
}


@end
