//
//  ContentManager.m
//  XNI
//
//  Created by Matej Jan on 6.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "ContentManager.h"

#import "Retronator.Xni.Framework.Content.Pipeline.h"
#import "Retronator.Xni.Framework.Content.h"

@implementation ContentManager

- (id) initWithServiceProvider:(id <IServiceProvider>)theServiceProvider {
	return [self initWithServiceProvider:theServiceProvider andRootDirectory:@""];
}

- (id) initWithServiceProvider:(id <IServiceProvider>)theServiceProvider andRootDirectory:(NSString *)theRootDirectory {
	if (self = [super init]) {
		rootDirectory = theRootDirectory;
		serviceProvider = theServiceProvider;
		
		loadedAssets = [[NSMutableDictionary alloc] init];
		readerManager = [[ContentTypeReaderManager alloc] init];
	}
	return self;
}


@synthesize rootDirectory;
@synthesize serviceProvider;

- (id) load:(NSString *)assetName{
	
	// Check if we have already loaded this asset.
	id existing = [loadedAssets objectForKey:assetName];
	if (existing) {
		return existing;
	}
	
	NSFileManager *fileManager = [NSFileManager defaultManager];
	NSString *rootPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingString:rootDirectory];
	NSError *error;
	NSArray *files = [fileManager contentsOfDirectoryAtPath:rootPath error:&error];
	int count = [files count];
	
	for (int i = 0; i < count; i++) {
		NSString *file = [files objectAtIndex:i];
		if ([[file stringByDeletingPathExtension] isEqual:assetName]) {
			return [self load:assetName fromFile:file];
		}
	}
	
	[NSException raise:@"FileNotFoundException" format:@"The provided asset name does not match any files in the root directory"];
	return nil;
}

- (id) load:(NSString *)assetName fromFile:(NSString *)filePath {
	// Check if we have already loaded this asset.
	id existing = [loadedAssets objectForKey:assetName];
	if (existing) {
		return existing;
	}
	
	// Find extension and absolute path.
	NSString *fileName = [filePath stringByDeletingPathExtension];
	NSString *extension = [[filePath pathExtension] lowercaseString];
	NSString *absolutePath = [[NSBundle mainBundle] pathForResource:fileName ofType:extension inDirectory:rootDirectory];
	
	ContentReader *input;
	
	if ([extension isEqual:@"png"] || [extension isEqual:@"jpg"] || [extension isEqual:@"jpeg"] ||
		[extension isEqual:@"gif"] || [extension isEqual:@"tif"] || [extension isEqual:@"tiff"] ||
		[extension isEqual:@"ico"] || [extension isEqual:@"bmp"]) {
		// We have texture content
		TextureImporter *textureImporter = [[[TextureImporter alloc] init] autorelease];
		TextureContent *textureContent = [textureImporter importFile:absolutePath];
		input = [[ContentReader alloc] initWithContentManager:self Content:textureContent];
	} else {
		[NSException raise:@"InvalidArgumentException" format:@"Files with extension %@ are not supported", extension];
	}

	ContentTypeReader *reader = [readerManager getTypeReaderFor:[input.content class]];
	id result = [reader readFromInput:input into:nil];
	
	// Save the loaded asset for quick retreival.
	[loadedAssets setObject:result forKey:assetName];
	
	[input release];
	
	return result;
}

- (void) unload {
	[loadedAssets removeAllObjects];
}

- (void) dealloc
{
	[loadedAssets release];
	[readerManager release];
	[super dealloc];
}

@end
