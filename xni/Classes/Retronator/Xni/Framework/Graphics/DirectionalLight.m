//
//  DirectionalLight.m
//  XNI
//
//  Created by Matej Jan on 21.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "DirectionalLight.h"

#import "Retronator.Xni.Framework.h"

@implementation DirectionalLight

- (id) init {
    if (self = [super init]) {
        self.enabled = NO;
        self.diffuseColor = [Vector3 zero];
        self.specularColor = [Vector3 zero];
        self.direction = [Vector3 zero];
    }
    return self;
}

@synthesize diffuseColor;
@synthesize direction;
@synthesize enabled;
@synthesize specularColor;

- (void) dealloc
{
	[diffuseColor release];
	[specularColor release];
	[direction release];
	[super dealloc];
}


@end

