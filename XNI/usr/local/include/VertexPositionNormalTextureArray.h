//
//  VertexPositionNormalTextureArray.h
//  XNI
//
//  Created by Matej Jan on 29.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "VertexArray.h"

@interface VertexPositionNormalTextureArray : VertexArray {

}

- (id) initWithInitialCapacity:(int)initialCapacity;

- (void) addVertex:(VertexPositionNormalTextureStruct*)vertex;

@end
