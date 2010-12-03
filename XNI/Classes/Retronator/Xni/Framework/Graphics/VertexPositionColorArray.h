//
//  VertexPositionColorArray.h
//  XNI
//
//  Created by Matej Jan on 21.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "VertexArray.h"

@interface VertexPositionColorArray : VertexArray {

}

- (id) initWithInitialCapacity:(int)initialCapacity;

- (void) addVertex:(VertexPositionColorStruct*)vertex;

@end
