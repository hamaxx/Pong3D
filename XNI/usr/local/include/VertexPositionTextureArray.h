//
//  VertexPositionTextureArray.h
//  XNI
//
//  Created by Matej Jan on 21.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "VertexArray.h"

@interface VertexPositionTextureArray : VertexArray {

}

- (id) initWithInitialCapacity:(int)initialCapacity;

- (void) addVertex:(VertexPositionTextureStruct*)vertex;

@end
