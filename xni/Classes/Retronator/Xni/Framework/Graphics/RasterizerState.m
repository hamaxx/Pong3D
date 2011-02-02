//
//  RasterizerState.m
//  XNI
//
//  Created by Matej Jan on 16.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "RasterizerState.h"

#import "Retronator.Xni.Framework.h"
#import "Retronator.Xni.Framework.Graphics.h"

static RasterizerState *cullClockwise;
static RasterizerState *cullCounterClockwise;
static RasterizerState *cullNone;

@implementation RasterizerState

- (id) init {
	self = [super init];
	if (self != nil) {
		cullMode = CullModeCullCounterClockwiseFace;
		depthBias = 0;
		fillMode = FillModeSolid;
		multiSampleAntiAlias = YES;
		scissorTestEnable = NO;
		slopeScaleDepthBias = 0;
	}
	return self;
}

+ (void) initialize {
	if (!cullClockwise) {
		cullClockwise = [[RasterizerState alloc] init];
		cullClockwise.cullMode = CullModeCullClockwiseFace;
	}
	
	if (!cullCounterClockwise) {
		cullCounterClockwise = [[RasterizerState alloc] init];
		cullCounterClockwise.cullMode = CullModeCullCounterClockwiseFace;
	}

	if (!cullNone) {
		cullNone = [[RasterizerState alloc] init];
		cullNone.cullMode = CullModeNone;
	}	
}

@synthesize cullMode;
@synthesize depthBias;
@synthesize fillMode;
@synthesize multiSampleAntiAlias;
@synthesize scissorTestEnable;
@synthesize slopeScaleDepthBias;

+ (RasterizerState*) cullClockwise { return cullClockwise; }
+ (RasterizerState*) cullCounterClockwise { return cullCounterClockwise; }
+ (RasterizerState*) cullNone { return cullNone; }

@end
