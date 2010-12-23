//
//  TouchLocation.h
//  XNI
//
//  Created by Matej Jan on 29.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Retronator.Xni.Framework.classes.h"
#import "Retronator.Xni.Framework.Input.Touch.classes.h"

@interface TouchLocation : NSObject {
	int identifier;
	Vector2 *position;
	Vector2 *previousPosition;
	TouchLocationState state;
}

- (id) initWithIdentifier:(int)theIdentifier position:(Vector2*)thePosition 
		 previousPosition:(Vector2*)thePreviousPosition state:(TouchLocationState)theState;

@property (nonatomic, readonly) int identifier;
@property (nonatomic, readonly) Vector2 *position;
@property (nonatomic, readonly) TouchLocationState state;

- (BOOL) tryGetPreviousPosition:(Vector2**)previousPosition;

@end
