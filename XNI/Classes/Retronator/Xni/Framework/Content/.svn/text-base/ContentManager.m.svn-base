//
//  ContentManager.m
//  XNI
//
//  Created by Matej Jan on 6.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "ContentManager.h"
#import "ContentManager+Internal.h"

#import "Retronator.Xni.Framework.Content.h"
#import "Retronator.Xni.Framework.Content.Pipeline.h"
#import "Retronator.Xni.Framework.Content.Pipeline.Processors.h"
#import "Retronator.Xni.Framework.Content.Pipeline.Audio.h"

@implementation ContentManager

- (id) initWithServiceProvider:(id <IServiceProvider>)theServiceProvider {
	return [self initWithServiceProvider:theServiceProvider andRootDirectory:@""];
}

- (id) initWithServiceProvider:(id <IServiceProvider>)theServiceProvider andRootDirectory:(NSString *)theRootDirectory {
	if (self = [super init]) {
		rootDirectory = theRootDirectory;
		serviceProvider = theServiceProvider;
		
		loadedAssets = [[NSMutableDictionary alloc] init];
		loadedFiles = [[NSMutableDictionary alloc] init];
		readerManager = [[ContentTypeReaderManager alloc] init];
	}
	return self;
}

@synthesize rootDirectory;
@synthesize serviceProvider;

- (ContentTypeReaderManager *) readerManager {
	return readerManager;
}

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
	
	[NSException raise:@"FileNotFoundException" format:@"The provided asset name %@ does not match any files in the root directory", assetName];
	return nil;
}

- (id) load:(NSString *)assetName fromFile:(NSString *)filePath {
	
	// Check if we have already loaded this file.
	id existing = [loadedFiles objectForKey:filePath];
	if (existing) {
		return existing;
	}
	
	// Find extension and absolute path.
	NSString *fileName = [filePath stringByDeletingPathExtension];
	NSString *extension = [filePath pathExtension];
	NSString *absolutePath = [[NSBundle mainBundle] pathForResource:fileName ofType:extension inDirectory:rootDirectory];
	[absolutePath autorelease];
	
	if (!absolutePath) {
		[NSException raise:@"InvalidArgumentException" format:@"Could not locate file '%@' in directory '%@'", filePath, rootDirectory];
	}
		
	ContentReader *input;

	// We pool autoreleased objects during the import process.
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

	// Compare lowercase extension.
	extension = [extension lowercaseString];
	
	if ([extension isEqualToString:@"png"] || [extension isEqualToString:@"jpg"] || [extension isEqualToString:@"jpeg"] ||
		[extension isEqualToString:@"gif"] || [extension isEqualToString:@"tif"] || [extension isEqualToString:@"tiff"] ||
		[extension isEqualToString:@"ico"] || [extension isEqualToString:@"bmp"]) {
		// Texture content
		TextureImporter *textureImporter = [[[TextureImporter alloc] init] autorelease];
		TextureContent *textureContent = [textureImporter importFile:absolutePath];
		input = [[ContentReader alloc] initWithContentManager:self Content:textureContent];
		
	} else if ([extension isEqualToString:@"x"]) { 
		// Direct x model content
		XImporter *xImporter = [[[XImporter alloc] init] autorelease];
		NodeContent *root = [xImporter importFile:absolutePath];
		ModelProcessor *modelProcessor = [[[ModelProcessor alloc] init] autorelease];
		ModelContent *modelContent = [modelProcessor process:root];
		input = [[ContentReader alloc] initWithContentManager:self Content:modelContent];
	} else if ([extension isEqualToString:@"wav"]) {
		// Wave audio content
		WavImporter *wavImporter = [[[WavImporter alloc] init] autorelease];
		AudioContent *audioContent = [wavImporter importFile:absolutePath];
		SoundEffectProcessor *soundEffectProcessor = [[[SoundEffectProcessor alloc] init] autorelease];
		SoundEffectContent *soundEffectContent = [soundEffectProcessor process:audioContent];
		input = [[ContentReader alloc] initWithContentManager:self Content:soundEffectContent];
	} else if ([extension isEqualToString:@"mp3"]) {
		// Wave audio content
		WavImporter *wavImporter = [[[WavImporter alloc] init] autorelease];
		AudioContent *audioContent = [wavImporter importFile:absolutePath];
		SongProcessor *songProcessor = [[[SongProcessor alloc] init] autorelease];
		SongContent *songContent = [songProcessor process:audioContent];
		input = [[ContentReader alloc] initWithContentManager:self Content:songContent];
	} else {
		[NSException raise:@"InvalidArgumentException" format:@"Files with extension %@ are not supported", extension];
	}
	
	[pool release];

	// And another pool for the conversion process.
	pool = [[NSAutoreleasePool alloc] init];

	ContentTypeReader *reader = [readerManager getTypeReaderFor:[input.content class]];
	id result = [[reader readFromInput:input into:nil] retain];
	
	// Save the loaded asset for quick retreival.
	if (assetName) {
		[loadedAssets setObject:result forKey:assetName];
	}
	
	[loadedFiles setObject:result forKey:filePath];
	
	[input release];
	
	[pool release];
	
	// We are returning a retained object since the loaded asset is always used for a longer time.
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
