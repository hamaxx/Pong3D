//
//  ChildCollection.h
//  XNI
//
//  Created by Matej Jan on 26.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ChildCollection : NSObject <NSFastEnumeration> {
	NSMutableArray *children;
	id parent;
}

- (id) initWithParent:(id)theParent;

@property (nonatomic, readonly) int count;

- (id)itemAt:(int)index;
- (void)setItem:(id)item at:(int)index;

- (void)add:(id)item;
- (void)insert:(id)item at:(int)index;

- (void)remove:(id)item;
- (void)removeAt:(int)index;

- (id)getParentOf:(id)child;
- (void)setParentOf:(id)child to:(id)theParent;

@end
