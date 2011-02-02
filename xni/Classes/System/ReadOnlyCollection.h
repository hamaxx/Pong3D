//
//  ReadOnlyCollection.h
//  XNI
//
//  Created by Matej Jan on 29.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

// #define ReadOnlyCollection ReadOnlyCollectionName
// #define T DataType

@interface ReadOnlyCollection : NSObject <NSFastEnumeration> {
	NSArray *collection;
#ifdef Variables
	Variables
#endif
}

- (id) initWithItems:(NSArray*)items;

@property (nonatomic, readonly) int count;

- (T)itemAt:(int)index;

@end

// #undef ReadOnlyCollection
// #undef T