//
//  MeshContent.h
//  XNI
//
//  Created by Matej Jan on 22.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NodeContent.h"
#import "Retronator.Xni.Framework.Content.Pipeline.Graphics.classes.h"

@interface MeshContent : NodeContent {
	GeometryContentCollection *geometry;
	PositionCollection *positions;
}

@property (nonatomic, readonly) GeometryContentCollection *geometry;
@property (nonatomic, readonly) PositionCollection *positions;

@end
