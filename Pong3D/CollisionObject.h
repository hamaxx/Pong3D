//
//  CollisionObject.h
//  Pong3D
//
//  Created by Jure Ham on 11/11/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol CollisionObject

- (Vector3 *) collide: (Vector3 *) theSpeed :(Vector3 *) thePosition : (Vector3 *)theAccel :(NSInteger) radius;

@end
