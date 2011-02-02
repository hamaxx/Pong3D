//
//  MipmapChain.h
//  XNI
//
//  Created by Matej Jan on 10.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Retronator.Xni.Framework.Content.Pipeline.Graphics.classes.h"

@interface MipmapChain : NSObject {
	NSMutableArray *chain;
}

- (int) count;
- (BitmapContent*)objectAtIndex:(NSUInteger)index;
- (void)addObject:(BitmapContent*)anObject;
- (void)insertObject:(BitmapContent*)anObject atIndex:(NSUInteger)index;

@end

