//
//  Delegate.h
//  XNI
//
//  Created by Matej Jan on 20.7.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Delegate : NSObject {
    id target;
    SEL method;
}

- (id) initWithTarget:(id)theTarget Method:(SEL)theMethod;

+ (Delegate*) delegateWithTarget:(id)target Method:(SEL)method;

- (id) invokeWithArguments: (NSArray*) args;
- (id) invoke;
- (id) invokeWithArgument:(id)arg;
- (id) invokeWithArgument:(id)arg1 argument:(id)arg2;

@end
