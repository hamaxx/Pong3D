//
//  ModelProcessor.m
//  XNI
//
//  Created by Matej Jan on 22.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "ModelProcessor.h"

#import "Retronator.Xni.Framework.Content.Pipeline.Graphics.h"
#import "Retronator.Xni.Framework.Content.Pipeline.Processors.h"

#import "ModelContent+Internal.h"
#import "ModelMeshContent+Internal.h"
#import "ModelMeshPartContent+Internal.h"
#import "ModelBoneContent+Internal.h"

@interface ModelProcessor ()

- (ModelBoneContent*) createMeshes:(NSMutableArray*)meshes
							 bones:(NSMutableArray*)bones 
							  from:(NodeContent*)input;

- (ModelMeshContent*) createMeshFrom:(MeshContent*)input parentBone:(ModelBoneContent*)parentBone;

- (ModelMeshPartContent*) createMeshPartFrom:(GeometryContent*)input;

@end


@implementation ModelProcessor

- (Class) inputType { return [NodeContent class];}
- (Class) outputType { return [ModelContent class];}

- (ModelContent*) process:(NodeContent*)input {
	NSMutableArray *meshes = [NSMutableArray array];
	NSMutableArray *bones = [NSMutableArray array];
	
	ModelBoneContent *root = [self createMeshes:meshes bones:bones from:input];
	
	ModelContent* output = [[[ModelContent alloc] initWithBones:bones meshes:meshes root:root tag:nil] autorelease];
	
	return output;
}

- (ModelBoneContent*) createMeshes:(NSMutableArray*)meshes 
							 bones:(NSMutableArray*)bones 
							  from:(NodeContent*)input {
	
	// First create all children bones.
	NSMutableArray *childrenBones = [NSMutableArray array];
	
	for (NodeContent *node in input.children) {
		// Skip meshes.
		if (![node isKindOfClass:[MeshContent class]]) {
			ModelBoneContent *childBone = [self createMeshes:meshes bones:bones from:node];
			[childrenBones addObject:childBone];
		}
	}
	
	// Now we can create the bone for this node.
	ModelBoneContent *bone = [[[ModelBoneContent alloc] initWithChildren:childrenBones 
																   index:[bones count] 
																	name:input.name
															   transform:input.transform] autorelease];
	[bones addObject:bone];
	
	// Update children's parent.
	for (ModelBoneContent *child in bone.children) {
		[child setParent:bone];
	}

	// Now we can create meshes and pass them the bone as their parent.
	for (NodeContent *node in input.children) {
		if ([node isKindOfClass:[MeshContent class]]) {
			ModelMeshContent *mesh = [self createMeshFrom:(MeshContent*)node parentBone:bone];
			[meshes addObject:mesh];
		}
	}
	
	// Return the created bone.
	return bone;
}

- (ModelMeshContent*) createMeshFrom:(MeshContent*)input parentBone:(ModelBoneContent*)parentBone {
	NSMutableArray *meshParts = [NSMutableArray array];
	
	for (GeometryContent *geometry in input.geometry) {
		ModelMeshPartContent *meshPart = [self createMeshPartFrom:geometry];
		[meshParts addObject:meshPart];
	}
	
	ModelMeshContent *mesh = [[[ModelMeshContent alloc] initWithName:input.name
														  parentBone:parentBone 
													  modelMeshParts:meshParts 
																 tag:nil 
														  sourceMesh:input] autorelease];
	
	return mesh;
}

- (ModelMeshPartContent *) createMeshPartFrom:(GeometryContent *)input {
	ModelMeshPartContent *meshPart = [[[ModelMeshPartContent alloc] initWithVertexOffset:0
																			 numVertices:input.vertices.vertexCount
																			  startIndex:0
																		  primitiveCount:input.indices.count/3
																					 tag:nil
																			 indexBuffer:input.indices
																			vertexBuffer:[input.vertices createVertexBuffer]
																				material:input.material] autorelease];
	return meshPart;
}

@end
