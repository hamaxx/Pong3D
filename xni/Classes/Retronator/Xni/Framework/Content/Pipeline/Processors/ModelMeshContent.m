//
//  ModelMeshContent.m
//  XNI
//
//  Created by Matej Jan on 22.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "ModelMeshContent.h"

#import "Retronator.Xni.Framework.Content.Pipeline.Processors.h"
#import "Retronator.Xni.Framework.Content.Pipeline.Graphics.h"

@implementation ModelMeshContent

- (id) initWithName:(NSString *)theName parentBone:(ModelBoneContent*)theParentBone modelMeshParts:(NSArray *)theModelMeshParts tag:(id)theTag sourceMesh:(MeshContent*)theSourceMesh
{
	self = [super init];
	if (self != nil) {
		name = [[NSString alloc] initWithString:theName];
		meshParts = [[ModelMeshPartContentCollection alloc] initWithItems:theModelMeshParts];
		parentBone = [theParentBone retain];
		self.tag = theTag;
		sourceMesh = [theSourceMesh retain];
	}
	return self;
}

@synthesize name, parentBone, meshParts, tag, sourceMesh;

- (void) dealloc
{
	[sourceMesh release];
	[name release];
	[parentBone release];
	[meshParts release];
	[tag release];
	[super dealloc];
}

@end
