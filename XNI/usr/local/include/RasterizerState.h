//
//  RasterizerState.h
//  XNI
//
//  Created by Matej Jan on 16.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Retronator.Xni.Framework.Graphics.classes.h"
#import "GraphicsResource.h"

@interface RasterizerState : NSObject {
	CullMode cullMode;
	float depthBias;
	FillMode fillMode;
	BOOL multiSampleAntiAlias;
	BOOL scissorTestEnable;
	float slopeScaleDepthBias;
}

@property (nonatomic) CullMode cullMode;
@property (nonatomic) float depthBias;
@property (nonatomic) FillMode fillMode;
@property (nonatomic) BOOL multiSampleAntiAlias;
@property (nonatomic) BOOL scissorTestEnable;
@property (nonatomic) float slopeScaleDepthBias;

+ (RasterizerState*) cullClockwise;
+ (RasterizerState*) cullCounterClockwise;
+ (RasterizerState*) cullNone;

@end
