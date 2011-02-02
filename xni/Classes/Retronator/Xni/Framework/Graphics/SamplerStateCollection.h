//
//  SamplerStateCollection.h
//  XNI
//
//  Created by Matej Jan on 21.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "System.h"

#import "Retronator.Xni.Framework.Graphics.classes.h"

@interface SamplerStateCollection : NSObject {
	SamplerState *samplerStates[GL_MAX_TEXTURE_UNITS];
	Event *samplerStateChanged;
}
 
- (SamplerState*)itemAtIndex:(NSUInteger)index;
- (void)setItem:(SamplerState*)item atIndex:(NSUInteger)index;

@end
