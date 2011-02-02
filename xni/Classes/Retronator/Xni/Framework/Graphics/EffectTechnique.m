//
//  EffectTechnique.m
//  XNI
//
//  Created by Matej Jan on 21.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "EffectTechnique.h"

@implementation EffectTechnique

-(id) initWithName:(NSString *)theName passes:(NSArray *)thePasses {
    if (self = [super init]) {
        name = [theName retain];
        passes = [thePasses retain];
    }
    return self;
}

@synthesize name;
@synthesize passes;

- (void) dealloc
{
    [name release];
    [passes release];
    [super dealloc];
}

@end