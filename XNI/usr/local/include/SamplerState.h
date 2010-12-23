//
//  SamplerState.h
//  XNI
//
//  Created by Matej Jan on 16.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Retronator.Xni.Framework.Graphics.classes.h"
#import "GraphicsResource.h"

@interface SamplerState : NSObject {
	TextureAddressMode addressU;
	TextureAddressMode addressV;
	TextureAddressMode addressW;
	TextureFilter filter;
	int maxAnisotropy;
	int maxMipLevel;
	float mipMapLevelOfDetailBias;
}

@property (nonatomic) TextureAddressMode addressU;
@property (nonatomic) TextureAddressMode addressV;
@property (nonatomic) TextureAddressMode addressW;
@property (nonatomic) TextureFilter filter;
@property (nonatomic) int maxAnisotropy;
@property (nonatomic) int maxMipLevel;
@property (nonatomic) float mipMapLevelOfDetailBias;

+ (SamplerState*) anisotropicClamp;
+ (SamplerState*) anisotropicWrap;
+ (SamplerState*) linearClamp;
+ (SamplerState*) linearWrap;
+ (SamplerState*) pointClamp;
+ (SamplerState*) pointWrap;

@end
