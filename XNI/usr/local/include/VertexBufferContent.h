//
//  VertexBufferContent.h
//  XNI
//
//  Created by Matej Jan on 22.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Retronator.Xni.Framework.Content.Pipeline.Processors.classes.h"

#import "ContentItem.h"

@interface VertexBufferContent : ContentItem {
	NSMutableData *vertexData;
	VertexDeclarationContent *vertexDeclaration;
}

@property (nonatomic, readonly) NSMutableData *vertexData;
@property (nonatomic, retain) VertexDeclarationContent *vertexDeclaration;

@end
