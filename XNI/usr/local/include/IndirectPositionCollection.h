//
//  IndirectPositionCollection.h
//  XNI
//
//  Created by Matej Jan on 26.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Retronator.Xni.Framework.classes.h"
#import "Retronator.Xni.Framework.Content.Pipeline.Graphics.classes.h"

@interface IndirectPositionCollection : NSObject {
	VertexChannel *positionIndices;
	PositionCollection *positions;
}

- (id) initWithPositionIndices:(VertexChannel*)thePositionIndices positions:(PositionCollection*)thePositions;

- (Vector3*)itemAt:(int)index;
- (void)setItem:(Vector3*)item at:(int)index;

@end
