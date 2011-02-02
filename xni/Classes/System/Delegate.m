//
//  Delegate.m
//  XNI
//
//  Created by Matej Jan on 20.7.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "Delegate.h"


@implementation Delegate

- (id) initWithTarget:(id)theTarget Method:(SEL)theMethod {
    if (self = [super init]) {
        target = theTarget;
        method = theMethod;
    }
    return self;
}

+ (Delegate*) delegateWithTarget:(id)target Method:(SEL)method {
    return [[[Delegate alloc] initWithTarget:target Method:method] autorelease];
}

- (id) invokeWithArguments: (NSArray*) args {
	switch ([args count]) {
		case 0:
			return [self invoke];
			break;
		case 1:
			return [self invokeWithArgument:[args objectAtIndex:0]];
			break;
		case 2:
			return [self invokeWithArgument:[args objectAtIndex:0] argument:[args objectAtIndex:1]];																																		   
			break;			
		default:
			// TODO: Use NSInvocation instead of performSelector.
			return nil;
			break;
	}
}

- (id) invoke {
	return [target performSelector:method];
}

- (id) invokeWithArgument:(id)arg {
    return [target performSelector:method withObject:arg];
}

- (id) invokeWithArgument:(id)arg1 argument:(id)arg2 {
    return [target performSelector:method withObject:arg1 withObject:arg2];
}

- (BOOL) isEqual:(id)object {
    if ([object isKindOfClass:[Delegate class]]) {
        Delegate *delegate = object;
        return [target isEqual:delegate->target] && method==delegate->method;
    }
    return NO;
}

- (NSUInteger) hash {
    return [target hash] ^ [NSStringFromSelector(method) hash];
}

@end
