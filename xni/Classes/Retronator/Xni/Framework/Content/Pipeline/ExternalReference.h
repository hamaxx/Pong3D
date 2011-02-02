//
//  ExternalReference.h
//  XNI
//
//  Created by Matej Jan on 29.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Retronator.Xni.Framework.Content.Pipeline.classes.h"

#import "ContentItem.h"

@interface ExternalReference : ContentItem {
	NSString *filename;
}

- (id) initWithFilename:(NSString*)theFilename;
- (id) initWithFilename:(NSString *)theFilename relativeToContent:(ContentIdentity*)relativeToContent;

@property (nonatomic, retain) NSString *filename;

@end
