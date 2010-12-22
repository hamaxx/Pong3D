//
//  ModelBone.m
//  XNI
//
//  Created by Matej Jan on 29.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "ModelBone.h"
#import "ModelBone+Internal.h"

#import "Retronator.Xni.Framework.Graphics.h"

@implementation ModelBone

- (id) initWithChildren:(NSArray *)theChildren 
				  index:(int)theIndex 
				   name:(NSString *)theName 
			  transform:(Matrix *)theTransform
{
	self = [super init];
	if (self != nil) {
		children = [[ModelBoneCollection alloc] initWithItems:theChildren];
		index = theIndex;
		name = [theName retain];
		transform = [theTransform retain];
	}
	return self;
}

@synthesize children, index, name, parent, transform;

- (void) setParent:(ModelBone*)theParent {
	parent = theParent;	
}

- (void) dealloc
{
	[children release];
	[name release];
	[transform release];
	[super dealloc];
}


@end
