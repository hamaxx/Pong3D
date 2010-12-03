//
//  BlendState.h
//  XNI
//
//  Created by Matej Jan on 16.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Retronator.Xni.Framework.Graphics.classes.h"
#import "GraphicsResource.h"

@interface BlendState : GraphicsResource {
	BlendFunction alphaBlendFunction;
	Blend alphaDestinationBlend;
	Blend alphaSourceBlend;
	Color *blendFactor;
	BlendFunction colorBlendFunction;
	Blend colorDestinationBlend;
	Blend colorSourceBlend;
	ColorWriteChannels colorWriteChannels;
	ColorWriteChannels colorWriteChannels1;
	ColorWriteChannels colorWriteChannels2;
	ColorWriteChannels colorWriteChannels3;
	int multiSampleMask;
}

@property (nonatomic) BlendFunction alphaBlendFunction;
@property (nonatomic) Blend alphaDestinationBlend;
@property (nonatomic) Blend alphaSourceBlend;
@property (nonatomic, retain) Color *blendFactor;
@property (nonatomic) BlendFunction colorBlendFunction;
@property (nonatomic) Blend colorDestinationBlend;
@property (nonatomic) Blend colorSourceBlend;
@property (nonatomic) ColorWriteChannels colorWriteChannels;
@property (nonatomic) ColorWriteChannels colorWriteChannels1;
@property (nonatomic) ColorWriteChannels colorWriteChannels2;
@property (nonatomic) ColorWriteChannels colorWriteChannels3;
@property (nonatomic) int multiSampleMask;

+ (BlendState*) additive;
+ (BlendState*) alphaBlend;
+ (BlendState*) nonPremultiplied;
+ (BlendState*) opaque;

@end
