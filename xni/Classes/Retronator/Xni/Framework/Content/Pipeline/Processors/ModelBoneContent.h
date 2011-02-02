//
//  ModelBoneContent.h
//  XNI
//
//  Created by Matej Jan on 29.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Retronator.Xni.Framework.classes.h"
#import "Retronator.Xni.Framework.Content.Pipeline.Processors.classes.h"

@interface ModelBoneContent : NSObject {
	ModelBoneContentCollection *children;
	int index;
	NSString *name;
	ModelBoneContent *parent;
	Matrix *transform;
}

@property (nonatomic, readonly) ModelBoneContentCollection *children;
@property (nonatomic, readonly) int index;
@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) ModelBoneContent *parent;
@property (nonatomic, retain) Matrix *transform;

@end
