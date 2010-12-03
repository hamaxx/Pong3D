//
//  TextureCollection.h
//  XNI
//
//  Created by Matej Jan on 21.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "System.h"

#import "Retronator.Xni.Framework.Graphics.classes.h"

@interface TextureCollection : NSObject {
	Texture *textures[GL_MAX_TEXTURE_UNITS];
	Event *textureChanged;
}

- (Texture*)itemAtIndex:(NSUInteger)index;
- (void)setItem:(Texture*)item atIndex:(NSUInteger)index;

@end
