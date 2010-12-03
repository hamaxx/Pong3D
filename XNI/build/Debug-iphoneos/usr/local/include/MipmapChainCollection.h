//
//  MipmapChainCollection.h
//  XNI
//
//  Created by Matej Jan on 10.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Retronator.Xni.Framework.Content.Pipeline.Graphics.classes.h"

@interface MipmapChainCollection : NSObject {
	NSMutableArray *collection;
}

- (int) count;
- (MipmapChain*)objectAtIndex:(NSUInteger)index;
- (void)addObject:(MipmapChain*)anObject;
- (void)insertObject:(MipmapChain*)anObject atIndex:(NSUInteger)index;

@end
