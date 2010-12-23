//
//  VertexBufferBinding.h
//  XNI
//
//  Created by Matej Jan on 21.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Retronator.Xni.Framework.Graphics.classes.h"

@interface VertexBufferBinding : NSObject {
	int instanceFrequency;
	VertexBuffer *vertexBuffer;
	int vertexOffset;
}

- (id) initWithVertexBuffer:(VertexBuffer*)theVertexBuffer;
- (id) initWithVertexBuffer:(VertexBuffer*)theVertexBuffer vertexOffset:(int)theVertexOffset;
- (id) initWithVertexBuffer:(VertexBuffer*)theVertexBuffer vertexOffset:(int)theVertexOffset instanceFrequency:(int)theInstanceFrequency;

@property (nonatomic, readonly) int instanceFrequency;
@property (nonatomic, readonly) VertexBuffer *vertexBuffer;
@property (nonatomic, readonly) int vertexOffset;

@end
