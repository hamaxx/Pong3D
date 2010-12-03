//
//  Level1.m
//  Pong3D
//
//  Created by Matej Jan on 20.10.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "Level1.h"

#import "Namespace.Pong3D.h"

@implementation Level1

- (void) reset {
	[super reset];
	
	// Place items to appropriate positions for level 1.
	home.position.x = 0;
	home.position.y = 0;
	home.position.z = 0;
	
	opponent.position.x = 0;
	opponent.position.y = 0;
	opponent.position.z = -50;
	
	ball.position.x = 0;
	ball.position.y = 0;
	ball.position.z = -2;
}

@end
