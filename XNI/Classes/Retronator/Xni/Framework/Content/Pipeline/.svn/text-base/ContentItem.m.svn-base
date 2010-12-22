//
//  ContentItem.m
//  XNI
//
//  Created by Matej Jan on 7.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "ContentItem.h"

#import "Retronator.Xni.Framework.Content.Pipeline.h"

@implementation ContentItem

- (id) init
{
	self = [super init];
	if (self != nil) {
		identity = [[ContentIdentity alloc] init];
		opaqueData = [[OpaqueDataDictionary alloc] init];
	}
	return self;
}

@synthesize identity, name, opaqueData;

- (void) dealloc
{
	[name release];
	[identity release];
	[opaqueData release];
	[super dealloc];
}


@end
