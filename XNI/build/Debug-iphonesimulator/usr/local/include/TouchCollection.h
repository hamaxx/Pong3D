//
//  TouchCollection.h
//  XNI
//
//  Created by Matej Jan on 29.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Retronator.Xni.Framework.Input.Touch.classes.h"

@interface TouchCollection : NSObject <NSFastEnumeration> {
	NSMutableArray *collection;
}

- (id) initWithArray:(NSArray*)array;

- (int) count;
- (TouchLocation*)objectAtIndex:(NSUInteger)index;
- (void)addObject:(TouchLocation*)anObject;
- (void)insertObject:(TouchLocation*)anObject atIndex:(NSUInteger)index;

@end
