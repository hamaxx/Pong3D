//
//  SongContent.m
//  XNI
//
//  Created by Matej Jan on 15.12.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "SongContent.h"
#import "SongContent+Internal.h"

@implementation SongContent

- (id) initWithFileName:(NSString*)fileName
{
	self = [super init];
	if (self != nil) {
		url = [[NSURL alloc] initFileURLWithPath:fileName];
	}
	return self;
}

- (NSURL *) url {
	return url;
}

- (void) dealloc
{
	[url release];
	[super dealloc];
}


@end
