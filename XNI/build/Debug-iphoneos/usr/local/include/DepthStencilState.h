//
//  DepthStencilState.h
//  XNI
//
//  Created by Matej Jan on 16.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Retronator.Xni.Framework.Graphics.classes.h"
#import "GraphicsResource.h"

@interface DepthStencilState : NSObject {
	StencilOperation counterClockwiseStencilDepthBufferFail;
	StencilOperation counterClockwiseStencilFail;
	CompareFunction counterClockwiseStencilFunction;
	StencilOperation counterClockwiseStencilPass;
	BOOL depthBufferEnable;
	CompareFunction depthBufferFunction;
	BOOL depthBufferWriteEnable;
	int referenceStencil;
	StencilOperation stencilDepthBufferFail;
	StencilOperation stencilFail;
	CompareFunction stencilFunction;
	int stencilMask;
	StencilOperation stencilPass;
	int stencilWriteMask;
	BOOL twoSidedStencilMode;
}

@property (nonatomic) StencilOperation counterClockwiseStencilDepthBufferFail;
@property (nonatomic) StencilOperation counterClockwiseStencilFail;
@property (nonatomic) CompareFunction counterClockwiseStencilFunction;
@property (nonatomic) StencilOperation counterClockwiseStencilPass;
@property (nonatomic) BOOL depthBufferEnable;
@property (nonatomic) CompareFunction depthBufferFunction;
@property (nonatomic) BOOL depthBufferWriteEnable;
@property (nonatomic) int referenceStencil;
@property (nonatomic) StencilOperation stencilDepthBufferFail;
@property (nonatomic) StencilOperation stencilFail;
@property (nonatomic) CompareFunction stencilFunction;
@property (nonatomic) int stencilMask;
@property (nonatomic) StencilOperation stencilPass;
@property (nonatomic) int stencilWriteMask;
@property (nonatomic) BOOL twoSidedStencilMode;

+ (DepthStencilState*) defaultDepth;
+ (DepthStencilState*) depthRead;
+ (DepthStencilState*) none;

@end
