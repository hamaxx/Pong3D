//
//  GameHost.m
//  XNI
//
//  Created by Matej Jan on 20.7.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "GameHost.h"

#import "Retronator.Xni.Framework.h"

@implementation GameHost

- (id) init {
    if (self = [super init]) {
        window = [[GameWindow alloc] init]; 		
    }
    return self;
}

@synthesize window;

- (void) run {    	
    // Hijack the run loop.
    NSLog(@"Starting the game loop.");
    
    game = [self delegate];
    
    SInt32 runResult;
    
    while (!isExiting)
    {   
        // We run a very tight autorelease pool loop.
        NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
        
        // Handle all the waiting event sources.
        do {
            runResult = CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0, YES);
        } while (runResult == kCFRunLoopRunHandledSource);
        
        [game tick];
        
        // We release memory every frame.
        [pool release];
    }
}

- (void) exit {
    NSLog(@"Exiting the game loop.");
    isExiting = YES;
}

- (void) dealloc
{
	[window release];
    [super dealloc];
}


@end
