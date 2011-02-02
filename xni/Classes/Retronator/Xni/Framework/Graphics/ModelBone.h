//
//  ModelBone.h
//  XNI
//
//  Created by Matej Jan on 29.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Retronator.Xni.Framework.classes.h"
#import "Retronator.Xni.Framework.Graphics.classes.h"

@interface ModelBone : NSObject {
	ModelBoneCollection *children;
	int index;
	NSString *name;
	ModelBone *parent;
	Matrix *transform;
}

@property (nonatomic, readonly) ModelBoneCollection *children;
@property (nonatomic, readonly) int index;
@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) ModelBone *parent;
@property (nonatomic, retain) Matrix *transform;

@end
