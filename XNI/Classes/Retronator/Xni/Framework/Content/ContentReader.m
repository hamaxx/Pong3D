//
//  ContentReader.m
//  XNI
//
//  Created by Matej Jan on 10.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "ContentReader.h"


@implementation ContentReader

- (id) initWithContentManager:(ContentManager *)theContentManager Content:(id)theContent {
	if (self = [super init]) {
		contentManager = theContentManager;
		content = theContent;
	}
	return self;
}

@synthesize contentManager;
@synthesize content;

@end
