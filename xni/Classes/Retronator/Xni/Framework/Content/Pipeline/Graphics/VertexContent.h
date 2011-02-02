//
//  VertexContent.h
//  XNI
//
//  Created by Matej Jan on 22.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Retronator.Xni.Framework.Content.Pipeline.Graphics.classes.h"
#import "Retronator.Xni.Framework.Content.Pipeline.Processors.classes.h"

@interface VertexContent : NSObject {
	VertexChannelCollection *channels;
	VertexChannel *positionIndices;
	IndirectPositionCollection *positions;
	int vertexCount;	
}

- (id) initWithPositions:(PositionCollection*)thePositions;

@property (nonatomic, readonly) VertexChannelCollection *channels;
@property (nonatomic, readonly) VertexChannel *positionIndices;
@property (nonatomic, readonly) IndirectPositionCollection *positions;
@property (nonatomic, readonly) int vertexCount;

- (int) add:(int)positionIndex;
- (void) addRange:(NSArray*)positionIndexCollection;

- (void) insert:(int)positionIndex at:(int)index;
- (void) insertRange:(NSArray*)positionIndexCollection at:(int)index;

- (void) removeAt:(int)index;
- (void) removeRangeAt:(int)index count:(int)count;

- (VertexBufferContent*) createVertexBuffer;

@end
