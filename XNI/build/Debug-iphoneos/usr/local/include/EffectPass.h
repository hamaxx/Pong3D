//
//  EffectPass.h
//  XNI
//
//  Created by Matej Jan on 21.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Retronator.Xni.Framework.Graphics.classes.h"

@interface EffectPass : NSObject {
    NSString *name;
	GraphicsDevice *graphicsDevice;
}

- (id) initWithName:(NSString*)theName graphicsDevice:(GraphicsDevice*)theGraphicsDevice;

@property (nonatomic, readonly) NSString *name;

- (void) apply;

@end
