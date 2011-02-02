//
//  GameComponentCollection.m
//  XNI
//
//  Created by Matej Jan on 27.7.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "GameComponentCollection.h"

#import "Retronator.Xni.Framework.h"

@implementation GameComponentCollection

- (id) init {
    if (self = [super init]) {
        components = [[NSMutableArray alloc] init];
        componentAdded = [[Event alloc] init];
        componentRemoved = [[Event alloc] init];
    }
    return self;
}

@synthesize componentAdded;
@synthesize componentRemoved;

- (int) count {
	return [components count];
}

- (id<IGameComponent>)itemAt:(int)index {
	return [components objectAtIndex:index];
}

- (void) addComponent:(id<IGameComponent>)component {
    [components addObject:component];
    [componentAdded raiseWithSender:self
						  eventArgs:[GameComponentCollectionEventArgs
									 eventArgsWithGameComponent:component]];
}

- (void) removeComponent:(id<IGameComponent>)component {
    [components removeObject:component];
    [componentRemoved raiseWithSender:self
							eventArgs:[GameComponentCollectionEventArgs
									   eventArgsWithGameComponent:component]];
}

- (NSUInteger) countByEnumeratingWithState:(NSFastEnumerationState *)state 
								   objects:(id *)stackbuf 
									 count:(NSUInteger)len {
    return [components countByEnumeratingWithState:state objects:stackbuf count:len];
}

- (void) dealloc
{
    [components release];
    [componentAdded release];
    [componentRemoved release];
    [super dealloc];
}

@end
