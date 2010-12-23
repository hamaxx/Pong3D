//
//  GestureSample.h
//  XNI
//
//  Created by Matej Jan on 29.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Retronator.Xni.Framework.classes.h"
#import "Retronator.Xni.Framework.Input.Touch.classes.h"

@interface GestureSample : NSObject {
	Vector2 *delta;
	Vector2 *delta2;
	GestureType gestureType;
	Vector2 *position;
	Vector2 *position2;
	NSTimeInterval timestamp;
}

@property (nonatomic, readonly) Vector2 *delta;
@property (nonatomic, readonly) Vector2 *delta2;
@property (nonatomic, readonly) GestureType gestureType;
@property (nonatomic, readonly) Vector2 *position;
@property (nonatomic, readonly) Vector2 *position2;
@property (nonatomic, readonly) NSTimeInterval timestamp;

@end
