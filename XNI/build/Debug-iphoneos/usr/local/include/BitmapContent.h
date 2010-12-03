//
//  BitmapContent.h
//  XNI
//
//  Created by Matej Jan on 7.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Retronator.Xni.Framework.Graphics.classes.h"

#import "ContentItem.h"

@interface BitmapContent : ContentItem {
	int width;
	int height;
}

- (id) initWithWidth:(int)theWidth height:(int)theHeight;

@property (nonatomic) int width;
@property (nonatomic) int height;

- (void*) getPixelData;
- (void) setPixelData:(void*)sourceData;
- (BOOL) tryGetFormat:(SurfaceFormat*)theFormat;

@end
