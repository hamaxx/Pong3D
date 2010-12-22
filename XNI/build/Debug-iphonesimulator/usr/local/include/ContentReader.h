//
//  ContentReader.h
//  XNI
//
//  Created by Matej Jan on 10.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Retronator.Xni.Framework.Content.classes.h"

@interface ContentReader : NSObject {
	ContentManager *contentManager;
	id content;
}

- (id) initWithContentManager:(ContentManager*)theContentManager Content:(id)theContent;

@property (nonatomic, readonly) ContentManager *contentManager;
@property (nonatomic, readonly) id content;

@end
