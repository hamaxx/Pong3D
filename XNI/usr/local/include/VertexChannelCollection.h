//
//  VertexChannelCollection.h
//  XNI
//
//  Created by Matej Jan on 26.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "Retronator.Xni.Framework.Content.Pipeline.Graphics.classes.h"

@interface VertexChannelCollection : NSObject <NSFastEnumeration> {
	NSMutableArray *channels;
	NSMutableDictionary *channelsByNames;
	VertexContent *parent;
}

- (id) initWithParent:(VertexContent*)theParent;

@property (nonatomic, readonly) int count;

- (VertexChannel*)itemAt:(int)index;
- (void)setItem:(VertexChannel*)item at:(int)index;

- (VertexChannel*)itemWithName:(NSString*)name;

- (void)addChannelWithName:(NSString*)name elementType:(Class)elementType channelData:(NSArray*)channelData;
- (void)insertChannelWithName:(NSString*)name elementType:(Class)elementType channelData:(NSArray*)channelData at:(int)index;

- (void)remove:(VertexChannel*)item;
- (void)removeAt:(int)index;
- (void)removeChannelWithName:(NSString*)name;

- (void) clear;

@end

