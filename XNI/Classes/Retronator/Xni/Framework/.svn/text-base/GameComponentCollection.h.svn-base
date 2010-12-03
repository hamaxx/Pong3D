//
//  GameComponentCollection.h
//  XNI
//
//  Created by Matej Jan on 27.7.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "System.h"

#import "Retronator.Xni.Framework.classes.h"

@interface GameComponentCollection : NSObject <NSFastEnumeration> {
    NSMutableArray *components;
    Event *componentAdded;
    Event *componentRemoved;
}

@property (nonatomic, readonly) Event *componentAdded;
@property (nonatomic, readonly) Event *componentRemoved;

- (void) addComponent:(id<IGameComponent>)component;
- (void) removeComponent:(id<IGameComponent>)component;

@end
