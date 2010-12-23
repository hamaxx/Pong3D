//
//  ContentTypeReader.h
//  XNI
//
//  Created by Matej Jan on 10.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Retronator.Xni.Framework.Content.classes.h"

@interface ContentTypeReader : NSObject {

}

- (id) readFromInput:(ContentReader*)input into:(id)existingInstance;

@end
