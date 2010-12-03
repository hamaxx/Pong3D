//
//  Scene.h
//  Pong3D
//
//  Created by Matej Jan on 20.10.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Namespace.Pong3D.classes.h"

/**
 Holds scene items in a data structure.
 This simple implementation just uses an array and delegates all actions to it.
 */
@interface Scene : NSObject <NSFastEnumeration> {
	NSMutableArray *items;
}

- (void) addItem:(id)item;

@end
