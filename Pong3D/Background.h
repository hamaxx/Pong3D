//
//  Background.h
//  Pong3D
//
//  Created by preona on 10/27/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Namespace.Pong3D.classes.h"

@interface Background : NSObject <GameObject, CollisionObject> {
	VertexPositionColorArray *vertexArray;
}

@end
