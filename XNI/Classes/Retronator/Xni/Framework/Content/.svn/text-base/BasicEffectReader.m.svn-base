//
//  BasicEffectReader.m
//  XNI
//
//  Created by Matej Jan on 23.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "BasicEffectReader.h"

#import "Retronator.Xni.Framework.Content.h"
#import "Retronator.Xni.Framework.Graphics.h"
#import "Retronator.Xni.Framework.Content.Pipeline.Graphics.h"

@implementation BasicEffectReader

- (id) readFromInput:(ContentReader *)input into:(id)existingInstance {
	BasicMaterialContent *content = input.content;
	GraphicsDevice *graphicsDevice = [[input.contentManager.serviceProvider getServiceOfType:@protocol(IGraphicsDeviceService)] graphicsDevice];

	BasicEffect *effect = [[[BasicEffect alloc] initWithGraphicsDevice:graphicsDevice] autorelease];
	effect.alpha = [content.alpha floatValue];
	effect.diffuseColor = content.diffuseColor;
	effect.specularPower = [content.specularPower floatValue];
	effect.specularColor = content.specularColor;
	effect.emissiveColor = content.emissiveColor;
	effect.texture = [input readSharedResourceFrom:content.texture];
	effect.textureEnabled = effect.texture != nil;
	
	return effect;
}

@end
