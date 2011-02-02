//
//  VertexDeclarationContent.h
//  XNI
//
//  Created by Matej Jan on 26.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ContentItem.h"

@interface VertexDeclarationContent : ContentItem {
	NSMutableArray *vertexElements;
	NSNumber *vertexStride;
}

@property (nonatomic, readonly) NSMutableArray *vertexElements;
@property (nonatomic, retain) NSNumber *vertexStride;

@end
