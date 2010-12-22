//
//  MaterialContent.h
//  XNI
//
//  Created by Matej Jan on 22.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Retronator.Xni.Framework.Content.Pipeline.Graphics.classes.h"

#import "ContentItem.h"

@interface MaterialContent : ContentItem {
	TextureReferenceDictionary *textures;
}

@property (nonatomic, readonly) TextureReferenceDictionary *textures;

@end
