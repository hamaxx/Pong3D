//
//  Event.h
//  XNI
//
//  Created by Matej Jan on 20.7.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "System.classes.h"

@interface Event : NSObject {
    NSMutableSet *delegates;
}

- (void) subscribeDelegate:(Delegate*)delegate;
- (void) unsubscribeDelegate:(Delegate*)delegate;
- (void) raiseWithSender:(id)sender;
- (void) raiseWithSender:(id)sender eventArgs:(EventArgs*)e;

@end
