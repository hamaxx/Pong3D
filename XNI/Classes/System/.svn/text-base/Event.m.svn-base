//
//  Event.m
//  XNI
//
//  Created by Matej Jan on 20.7.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "Event.h"

#import "System.h"

@implementation Event

- (id) init {
    if (self = [super init]) {
        delegates = [[NSMutableSet alloc] init];
    }
    return self;
}

- (void) subscribeDelegate:(Delegate*)delegate {
    [delegates addObject:delegate];
}

- (void) unsubscribeDelegate:(Delegate*)delegate {
    [delegates removeObject:delegate];
}

- (void) raiseWithSender:(id)sender {
	EventArgs *e = [EventArgs empty];
	[self raiseWithSender:sender eventArgs:e];
}

- (void) raiseWithSender:(id)sender eventArgs:(EventArgs*)e {
    for (Delegate *delegate in delegates) {
        [delegate invokeWithArgument:sender argument:e];
    }
}

- (void) dealloc {
    [delegates release];
    [super dealloc];
}

@end