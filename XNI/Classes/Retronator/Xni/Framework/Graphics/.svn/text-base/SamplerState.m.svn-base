//
//  SamplerState.m
//  XNI
//
//  Created by Matej Jan on 16.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "SamplerState.h"

#import "Retronator.Xni.Framework.h"
#import "Retronator.Xni.Framework.Graphics.h"

static SamplerState *anisotropicClamp;
static SamplerState *anisotropicWrap;
static SamplerState *linearClamp;
static SamplerState *linearWrap;
static SamplerState *pointClamp;
static SamplerState *pointWrap;

@implementation SamplerState

- (id) init
{
	self = [super init];
	if (self != nil) {
		addressU = TextureAddressModeClamp;
		addressV = TextureAddressModeClamp;
		addressW = TextureAddressModeClamp;
		filter = TextureFilterPoint;
		maxAnisotropy = 0;
		maxMipLevel = 0;
		mipMapLevelOfDetailBias = 0;
	}
	return self;
}

+ (void) initialize {
	if (!anisotropicClamp) {
		anisotropicClamp = [[SamplerState alloc] init];
		anisotropicClamp.filter = TextureFilterAnisotropic;
		anisotropicClamp.addressU = TextureAddressModeClamp;
		anisotropicClamp.addressV = TextureAddressModeClamp;
		anisotropicClamp.addressW = TextureAddressModeClamp;
	}
	
	if (!anisotropicWrap) {
		anisotropicWrap = [[SamplerState alloc] init];
		anisotropicWrap.filter = TextureFilterAnisotropic;
		anisotropicWrap.addressU = TextureAddressModeWrap;
		anisotropicWrap.addressV = TextureAddressModeWrap;
		anisotropicWrap.addressW = TextureAddressModeWrap;
	}
	
	if (!linearClamp) {
		linearClamp = [[SamplerState alloc] init];
		linearClamp.filter = TextureFilterLinear;
		linearClamp.addressU = TextureAddressModeClamp;
		linearClamp.addressV = TextureAddressModeClamp;
		linearClamp.addressW = TextureAddressModeClamp;
	}
	
	if (!linearWrap) {
		linearWrap = [[SamplerState alloc] init];
		linearWrap.filter = TextureFilterLinear;
		linearWrap.addressU = TextureAddressModeWrap;
		linearWrap.addressV = TextureAddressModeWrap;
		linearWrap.addressW = TextureAddressModeWrap;
	}
	
	if (!pointClamp) {
		pointClamp = [[SamplerState alloc] init];
		pointClamp.filter = TextureFilterPoint;
		pointClamp.addressU = TextureAddressModeClamp;
		pointClamp.addressV = TextureAddressModeClamp;
		pointClamp.addressW = TextureAddressModeClamp;
	}
	
	if (!pointWrap) {
		pointWrap = [[SamplerState alloc] init];
		pointWrap.filter = TextureFilterPoint;
		pointWrap.addressU = TextureAddressModeWrap;
		pointWrap.addressV = TextureAddressModeWrap;
		pointWrap.addressW = TextureAddressModeWrap;
	}
}

@synthesize addressU;
@synthesize addressV;
@synthesize addressW;
@synthesize filter;
@synthesize maxAnisotropy;
@synthesize maxMipLevel;
@synthesize mipMapLevelOfDetailBias;

+ (SamplerState*) anisotropicClamp { return anisotropicClamp; }
+ (SamplerState*) anisotropicWrap { return anisotropicWrap; }
+ (SamplerState*) linearClamp { return linearClamp; }
+ (SamplerState*) linearWrap { return linearWrap; }
+ (SamplerState*) pointClamp { return pointClamp; }
+ (SamplerState*) pointWrap { return pointWrap; }

@end
