//
//  Viewport.h
//  XNI
//
//  Created by Matej Jan on 23.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Retronator.Xni.Framework.classes.h"

@interface Viewport : NSObject {
	int height;
	float maxDepth;
	float minDepth;
	int width;
	int x;
	int y;
}

@property (nonatomic, readonly) float aspectRatio;
@property (nonatomic) int height;
@property (nonatomic) float maxDepth;
@property (nonatomic) float minDepth;
@property (nonatomic, readonly) Rectangle *titleSafeArea;
@property (nonatomic) int width;
@property (nonatomic) int x;
@property (nonatomic) int y;

- (Vector3*) project:(Vector3*)source projection:(Matrix*)projection view:(Matrix*)view world:(Matrix*)world;
- (Vector3*) unproject:(Vector3*)source projection:(Matrix*)projection view:(Matrix*)view world:(Matrix*)world;

@end
