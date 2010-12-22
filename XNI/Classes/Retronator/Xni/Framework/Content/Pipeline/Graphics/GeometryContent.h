//
//  GeometryContent.h
//  XNI
//
//  Created by Matej Jan on 22.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ContentItem.h"
#import "Retronator.Xni.Framework.Content.Pipeline.Graphics.classes.h"

@interface GeometryContent : ContentItem {
	IndexCollection *indices;
	MaterialContent *material;
	MeshContent *parent;
	VertexContent *vertices;
}

- (id) initWithPositions:(PositionCollection*)thePositions;

@property (nonatomic, readonly) IndexCollection *indices;
@property (nonatomic, retain) MaterialContent *material;
@property (nonatomic, assign) MeshContent *parent;	// Parent is assigned so the children don't hold parent's in existence.
@property (nonatomic, readonly) VertexContent *vertices;

@end
