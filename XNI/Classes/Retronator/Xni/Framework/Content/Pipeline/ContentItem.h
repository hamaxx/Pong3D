//
//  ContentItem.h
//  XNI
//
//  Created by Matej Jan on 7.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Retronator.Xni.Framework.Content.Pipeline.classes.h"

@interface ContentItem : NSObject {
	ContentIdentity *identity;
	NSString *name;
	OpaqueDataDictionary *opaqueData;
}

@property (nonatomic, retain) ContentIdentity *identity;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, readonly) OpaqueDataDictionary *opaqueData;

@end