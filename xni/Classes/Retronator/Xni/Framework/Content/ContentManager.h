//
//  ContentManager.h
//  XNI
//
//  Created by Matej Jan on 6.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "System.h"

#import "Retronator.Xni.Framework.classes.h"
#import "Retronator.Xni.Framework.Content.classes.h"
#import "Retronator.Xni.Framework.Content.Pipeline.classes.h"

@interface ContentManager : NSObject {
	NSString *rootDirectory;
	id<IServiceProvider> serviceProvider;

@private
	NSMutableDictionary *loadedAssets;
	NSMutableDictionary *loadedFiles;
	ContentTypeReaderManager *readerManager;
}

- (id) initWithServiceProvider:(id<IServiceProvider>)theServiceProvider;
- (id) initWithServiceProvider:(id<IServiceProvider>)theServiceProvider andRootDirectory:(NSString*)theRootDirectory;

@property (nonatomic, retain) NSString *rootDirectory;
@property (nonatomic, readonly) id<IServiceProvider> serviceProvider;

- (id) load:(NSString*)assetName;
- (id) load:(NSString *)assetName processor:(ContentProcessor*)processor;
- (id) load:(NSString *)assetName importer:(ContentImporter*)importer processor:(ContentProcessor*)processor;

- (id) load:(NSString*)assetName fromFile:(NSString*)filePath;
- (id) load:(NSString *)assetName fromFile:(NSString*)filePath processor:(ContentProcessor*)processor;
- (id) load:(NSString *)assetName fromFile:(NSString*)filePath importer:(ContentImporter*)importer processor:(ContentProcessor*)processor;

- (void) unload;

@end
