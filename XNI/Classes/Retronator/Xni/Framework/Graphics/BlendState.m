//
//  BlendState.m
//  XNI
//
//  Created by Matej Jan on 16.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "BlendState.h"

#import "Retronator.Xni.Framework.h"
#import "Retronator.Xni.Framework.Graphics.h"

static BlendState *additive = nil;
static BlendState *alphaBlend = nil;
static BlendState *nonPremultiplied = nil;
static BlendState *opaque = nil;

@implementation BlendState

- (id) init
{
	self = [super init];
	if (self != nil) {
		alphaBlendFunction = BlendFunctionAdd;
		alphaDestinationBlend = BlendOne;
		alphaSourceBlend = BlendOne;
		blendFactor = [[Color transparent] retain];
		colorBlendFunction = BlendFunctionAdd;
		colorDestinationBlend = BlendOne;
		colorSourceBlend = BlendOne;
		colorWriteChannels = ColorWriteChannelsNone;
		colorWriteChannels1 = ColorWriteChannelsNone;
		colorWriteChannels2 = ColorWriteChannelsNone;
		colorWriteChannels3 = ColorWriteChannelsNone;
		multiSampleMask = 0xffffffff;
	}
	return self;
}

+ (void) initialize {
	if (!additive) {
		additive = [[BlendState alloc] init];
	}
	
	if (!alphaBlend) {
		alphaBlend = [[BlendState alloc] init];
		alphaBlend.colorDestinationBlend = BlendInverseSourceAlpha;
		alphaBlend.alphaDestinationBlend = BlendInverseSourceAlpha;
	}
	
	if (!nonPremultiplied) {
		nonPremultiplied = [[BlendState alloc] init];
		nonPremultiplied.colorSourceBlend = BlendSourceAlpha;
		nonPremultiplied.alphaSourceBlend = BlendSourceAlpha;
		nonPremultiplied.colorDestinationBlend = BlendInverseSourceAlpha;
		nonPremultiplied.alphaDestinationBlend = BlendInverseSourceAlpha;
	}
	
	if (!opaque) {
		opaque = [[BlendState alloc] init];
		opaque.colorDestinationBlend = BlendZero;
		opaque.alphaDestinationBlend = BlendZero;
	}	
}

@synthesize alphaBlendFunction;
@synthesize alphaDestinationBlend;
@synthesize alphaSourceBlend;
@synthesize blendFactor;
@synthesize colorBlendFunction;
@synthesize colorDestinationBlend;
@synthesize colorSourceBlend;
@synthesize colorWriteChannels;
@synthesize colorWriteChannels1;
@synthesize colorWriteChannels2;
@synthesize colorWriteChannels3;
@synthesize multiSampleMask;

+ (BlendState*) additive { return additive; }
+ (BlendState*) alphaBlend { return alphaBlend; }
+ (BlendState*) nonPremultiplied { return nonPremultiplied; }
+ (BlendState*) opaque { return opaque; }

- (void) dealloc
{
	[blendFactor release];
	[super dealloc];
}

@end
