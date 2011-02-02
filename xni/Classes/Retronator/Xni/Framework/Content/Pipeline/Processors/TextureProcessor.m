//
//  TextureProcessor.m
//  XNI
//
//  Created by Matej Jan on 22.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "TextureProcessor.h"

#import "Retronator.Xni.Framework.Content.Pipeline.Graphics.h"

@implementation TextureProcessor

- (Class) inputType { return [TextureContent class];}
- (Class) outputType { return [TextureContent class];}

@end
