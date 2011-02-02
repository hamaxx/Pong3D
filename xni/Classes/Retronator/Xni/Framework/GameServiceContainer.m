//
//  GameServiceContainer.m
//  XNI
//
//  Created by Matej Jan on 27.7.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "GameServiceContainer.h"


@implementation GameServiceContainer

- (id) init {
    if (self = [super init]) {
        services = CFDictionaryCreateMutable(NULL, 0, NULL, &kCFTypeDictionaryValueCallBacks);
    }
    return self;
}

- (void)addService:(id)provider ofType:(id)type {
    CFDictionarySetValue(services, type, provider);
}

- (id)getServiceOfType:(id)type {
    return (id)CFDictionaryGetValue(services, type);
}

- (void)removeServiceOfType:(id)type {
    CFDictionaryRemoveValue(services, type);
}

- (void) dealloc
{
    CFRelease(services);
    [super dealloc];
}

@end

