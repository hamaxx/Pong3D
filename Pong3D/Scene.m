//
//  Scene.m
//  Pong3D
//
//  Created by Matej Jan on 20.10.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "Scene.h"


@implementation Scene

- (id) init
{
	self = [super init];
	if (self != nil) {
		items = [[NSMutableArray alloc] init];
	}
	return self;
}

- (void) addItem:(id)item {
	[items addObject:item];
}

- (NSUInteger) countByEnumeratingWithState:(NSFastEnumerationState *)state 
								   objects:(id *)stackbuf 
									 count:(NSUInteger)len {
    return [items countByEnumeratingWithState:state objects:stackbuf count:len];
}

- (void) dealloc
{
	[items release];
	[super dealloc];
}

@end
