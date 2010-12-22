//
//  ExternalReference.m
//  XNI
//
//  Created by Matej Jan on 29.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "ExternalReference.h"

#import "Retronator.Xni.Framework.Content.Pipeline.h"

@implementation ExternalReference

- (id) initWithFilename:(NSString *)theFilename
{
	self = [super init];
	if (self != nil) {
		filename = [theFilename retain];
	}
	return self;
}

- (id) initWithFilename:(NSString *)theFilename relativeToContent:(ContentIdentity *)relativeToContent {
	/*NSString *absoluteFilename = [NSString pathWithComponents:[NSArray arrayWithObjects:@"/", relativeToContent.sourceFilename, theFilename, nil]];
	return [self initWithFilename:[absoluteFilename stringByStandardizingPath]];*/
	return [self initWithFilename:theFilename];
}

@synthesize filename;

- (void) dealloc
{
	[filename release];
	[super dealloc];
}


@end
