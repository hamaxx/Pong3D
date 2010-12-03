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

@interface ContentManager : NSObject {
	NSString *rootDirectory;
	id<IServiceProvider> serviceProvider;

@private
	NSMutableDictionary *loadedAssets;
	ContentTypeReaderManager *readerManager;
}

- (id) initWithServiceProvider:(id<IServiceProvider>)theServiceProvider;
- (id) initWithServiceProvider:(id<IServiceProvider>)theServiceProvider andRootDirectory:(NSString*)theRootDirectory;

@property (nonatomic, retain) NSString *rootDirectory;
@property (nonatomic, readonly) id<IServiceProvider> serviceProvider;

- (id) load:(NSString*)assetName;

- (id) load:(NSString*)assetName fromFile:(NSString*)filePath;

- (void) unload;

@end
