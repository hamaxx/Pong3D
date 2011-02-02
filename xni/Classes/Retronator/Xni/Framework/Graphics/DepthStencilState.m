//
//  DepthStencilState.m
//  XNI
//
//  Created by Matej Jan on 16.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "DepthStencilState.h"

#import "Retronator.Xni.Framework.h"
#import "Retronator.Xni.Framework.Graphics.h"

static DepthStencilState *defaultDepth;
static DepthStencilState *depthRead;
static DepthStencilState *none;

@implementation DepthStencilState

- (id) init
{
	self = [super init];
	if (self != nil) {
		counterClockwiseStencilDepthBufferFail = StencilOperationKeep;
		counterClockwiseStencilFail = StencilOperationKeep;
		counterClockwiseStencilFunction = CompareFunctionAlways;
		counterClockwiseStencilPass = StencilOperationKeep;
		depthBufferEnable = YES;
		depthBufferFunction = CompareFunctionLessEqual;
		depthBufferWriteEnable = YES;
		referenceStencil = 0;
		stencilDepthBufferFail = StencilOperationKeep;
		stencilFail = StencilOperationKeep;
		stencilFunction = CompareFunctionAlways;
		stencilMask = StencilOperationKeep;
		stencilPass = StencilOperationKeep;
		stencilWriteMask = INT32_MAX;
		twoSidedStencilMode = NO;
	}
	return self;
}

+ (void) initialize {
	if (!defaultDepth) {
		defaultDepth = [[DepthStencilState alloc] init];
	}
	
	if (!depthRead) {
		depthRead = [[DepthStencilState alloc] init];
		depthRead.depthBufferWriteEnable = NO;
	}
	
	if (!none) {
		none = [[DepthStencilState alloc] init];
		none.depthBufferEnable = NO;
		none.depthBufferWriteEnable = NO;
	}
}

@synthesize counterClockwiseStencilDepthBufferFail;
@synthesize counterClockwiseStencilFail;
@synthesize counterClockwiseStencilFunction;
@synthesize counterClockwiseStencilPass;
@synthesize depthBufferEnable;
@synthesize depthBufferFunction;
@synthesize depthBufferWriteEnable;
@synthesize referenceStencil;
@synthesize stencilDepthBufferFail;
@synthesize stencilFail;
@synthesize stencilFunction;
@synthesize stencilMask;
@synthesize stencilPass;
@synthesize stencilWriteMask;
@synthesize twoSidedStencilMode;

+ (DepthStencilState*) defaultDepth { return defaultDepth; }
+ (DepthStencilState*) depthRead { return depthRead; }
+ (DepthStencilState*) none { return none; }

@end
