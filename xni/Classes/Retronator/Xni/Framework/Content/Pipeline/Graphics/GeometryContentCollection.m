//
//  GeometryContentCollection.m
//  XNI
//
//  Created by Matej Jan on 26.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "GeometryContentCollection.h"

#import "Retronator.Xni.Framework.Content.Pipeline.Graphics.h"

@implementation GeometryContentCollection

- (MeshContent*) getParentOf:(GeometryContent*)child {
	return child.parent;
}

- (void) setParentOf:(GeometryContent*)child to:(MeshContent*)theParent {
	child.parent = theParent;
}

@end
