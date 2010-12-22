//
//  ContentReader.m
//  XNI
//
//  Created by Matej Jan on 10.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "ContentReader.h"

#import "Retronator.Xni.Framework.Content.h"
#import "Retronator.Xni.Framework.Content.Pipeline.h"
#import "ContentManager+Internal.h"

@implementation ContentReader

- (id) initWithContentManager:(ContentManager *)theContentManager Content:(id)theContent {
	if (self = [super init]) {
		contentManager = theContentManager;
		
		contentStack = [[NSMutableArray alloc] init];
		[contentStack addObject:theContent];
		
		sharedResources = CFDictionaryCreateMutable(NULL, 0, NULL, &kCFTypeDictionaryValueCallBacks);
	}
	return self;
}

@synthesize contentManager;

- (id) content {
	return [contentStack lastObject];
}

- (id) readObjectFrom:(id)source {
	// Push the source onto the content stack.
	[contentStack addObject:source];
	
	id result = nil;
	
	if ([source isKindOfClass:[ExternalReference class]]) {
		ExternalReference *externalReference = (ExternalReference*)source;
				
		// We should load the item with content manager.
		result = [contentManager load:externalReference.name fromFile:externalReference.filename];
	} else {
		// Get the correct reader for item.
		ContentTypeReader *typeReader = [contentManager.readerManager getTypeReaderFor:[source class]];
		
		// Read the object.
		result = [typeReader readFromInput:self into:nil];
	}
	
	// Return to previous content on the stack.
	[contentStack removeLastObject];
	
	return result;
}

- (id) readSharedResourceFrom:(id)source {
	if (!source) {
		return nil;
	}
	
	// See if the resource has already been loaded.
	id resource;
	void *resourcePointer = nil;
	CFDictionaryGetValueIfPresent(sharedResources, source, resourcePointer);
	resource = (id)resourcePointer;
	if (!resource) {		
		resource = [self readObjectFrom:source];
		CFDictionarySetValue(sharedResources, source, resource);
	}
	return resource;
}

- (void) dealloc
{
	CFRelease(sharedResources);
	[contentStack release];
	[super dealloc];
}


@end
