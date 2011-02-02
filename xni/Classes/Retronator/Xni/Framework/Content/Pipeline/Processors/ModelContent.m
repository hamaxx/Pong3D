//
//  ModelContent.m
//  XNI
//
//  Created by Matej Jan on 22.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "ModelContent.h"

#import "Retronator.Xni.Framework.Content.Pipeline.Processors.h"

@implementation ModelContent

- (id) initWithBones:(NSArray*)theBones meshes:(NSArray*)theMeshes root:(ModelBoneContent*)theRoot tag:(id)theTag;
{
	self = [super init];
	if (self != nil) {
		bones = [[ModelBoneContentCollection alloc] initWithItems:theBones];
		meshes = [[ModelMeshContentCollection alloc] initWithItems:theMeshes];		
		root = [theRoot retain];
		self.tag = theTag;
	}
	return self;
}

@synthesize bones, meshes, root, tag;

- (void) dealloc
{
	[bones release];
	[meshes release];
	[root release];
	[tag release];
	[super dealloc];
}


@end
 