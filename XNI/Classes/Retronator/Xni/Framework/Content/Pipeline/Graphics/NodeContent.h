//
//  NodeContent.h
//  XNI
//
//  Created by Matej Jan on 22.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Retronator.Xni.Framework.classes.h"
#import "Retronator.Xni.Framework.Content.Pipeline.Graphics.classes.h"

#import "ContentItem.h"

@interface NodeContent : ContentItem {
	NodeContentCollection *children;
	NodeContent *parent;
	Matrix *transform;
}

@property (nonatomic, readonly) NodeContentCollection *children;
@property (nonatomic, assign) NodeContent *parent;	// We need to assign the parent, so the children don't retain the parent in existence.
@property (nonatomic, retain) Matrix *transform;
@property (nonatomic, readonly) Matrix *absoluteTransform;

@end
