//
//  Collection.h
//  XNI
//
//  Created by Matej Jan on 26.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

// #define Collection CollectionName
// #define T DataType

@interface Collection : NSObject <NSFastEnumeration> {
	NSMutableArray *collection;
#ifdef Variables
	Variables
#endif
}

@property (nonatomic, readonly) int count;

- (T)itemAt:(int)index;
- (void)setItem:(T)item at:(int)index;

- (void)add:(T)item;
- (void)addRange:(NSArray*)items;
- (void)insert:(T)item at:(int)index;

- (void)remove:(T)item;
- (void)removeAt:(int)index;

- (void) clear;

@end

// #undef Collection
// #undef T
