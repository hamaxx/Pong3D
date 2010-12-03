//
//  ContentTypeReaderManager.m
//  XNI
//
//  Created by Matej Jan on 10.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "ContentTypeReaderManager.h"

#import "Retronator.Xni.Framework.Content.h"
#import "Retronator.Xni.Framework.Content.Pipeline.Graphics.h"

@implementation ContentTypeReaderManager

- (id) init
{
	self = [super init];
	if (self != nil) {
		texture2DContentTypeReader = [[Texture2DContentTypeReader alloc] init];
	}
	return self;
}


- (ContentTypeReader *) getTypeReaderFor:(Class)targetType {
	if (targetType == [Texture2DContent class]) {
		return texture2DContentTypeReader;
	} else {
		return nil;
	}
}

- (void) dealloc
{
	[texture2DContentTypeReader dealloc];
	[super dealloc];
}


@end
