//
//  TextureContent.h
//  XNI
//
//  Created by Matej Jan on 7.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Retronator.Xni.Framework.Content.Pipeline.Graphics.classes.h"

@interface TextureContent : NSObject {
	MipmapChainCollection *faces;
}

- (id) initWithFaces:(MipmapChainCollection*)theFaces;

@property (nonatomic, readonly) MipmapChainCollection *faces;

- (void) generateMipmapsAndOverwriteExistingMipmaps:(BOOL)overwriteExistingMipmaps;
- (void) convertBitmapTypeTo:(Class)newBitmapType;
- (void) validate;
- (void) validateWithFacesMustHaveSameMipCount:(BOOL)facesMustHaveSameMipCount;

@end
