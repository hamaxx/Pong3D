//
//  MaterialProcessor.m
//  XNI
//
//  Created by Matej Jan on 22.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "MaterialProcessor.h"

#import "Retronator.Xni.Framework.Content.Pipeline.Graphics.h"

@implementation MaterialProcessor

- (Class) inputType { return [MaterialContent class];}
- (Class) outputType { return [MaterialContent class];}

@end
