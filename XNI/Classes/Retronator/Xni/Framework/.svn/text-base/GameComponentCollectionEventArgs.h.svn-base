//
//  GameComponentCollectionEventArgs.h
//  XNI
//
//  Created by Matej Jan on 27.7.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "EventArgs.h"
#import "Retronator.Xni.Framework.classes.h"

@interface GameComponentCollectionEventArgs : EventArgs {
    id<IGameComponent> gameComponent;
}

- (id) initWithGameComponent:(id<IGameComponent>)theGameComponent;

+ (id) eventArgsWithGameComponent:(id<IGameComponent>)gameComponent;

@property (nonatomic, readonly) id<IGameComponent> gameComponent;

@end
