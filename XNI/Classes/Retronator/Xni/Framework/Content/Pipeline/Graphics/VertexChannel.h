//
//  VertexChannel.h
//  XNI
//
//  Created by Matej Jan on 26.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VertexChannel : NSObject <NSFastEnumeration> {
	NSMutableArray *collection;
	Class elementType;
	NSString *name;
}

- (id) initWithElementType:(Class)theElementType name:(NSString*)theName channelData:(NSArray*)channelData;

@property (nonatomic, readonly) int count;
@property (nonatomic, readonly) Class elementType;
@property (nonatomic, readonly) NSString *name;

- (id)itemAt:(int)index;
- (void)setItem:(id)item at:(int)index;

- (void)add:(id)item;
- (void)insert:(id)item at:(int)index;

- (void)remove:(id)item;
- (void)removeAt:(int)index;

- (void) clear;

@end

