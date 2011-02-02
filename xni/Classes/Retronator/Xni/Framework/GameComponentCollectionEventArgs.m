//
//  GameComponentCollectionEventArgs.m
//  XNI
//
//  Created by Matej Jan on 27.7.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "GameComponentCollectionEventArgs.h"


@implementation GameComponentCollectionEventArgs

- (id) initWithGameComponent:(id<IGameComponent>)theGameComponent {
    if (self = [super init]) {
        gameComponent = theGameComponent;
    }
    return self;
}

+ (id) eventArgsWithGameComponent:(id<IGameComponent>)gameComponent {
    return [[[GameComponentCollectionEventArgs alloc] initWithGameComponent:gameComponent] autorelease];
}

@synthesize gameComponent;

@end

