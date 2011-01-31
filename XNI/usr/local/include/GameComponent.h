//
//  GameComponent.h
//  XNI
//
//  Created by Matej Jan on 12.10.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "System.classes.h"
#import "Retronator.Xni.Framework.classes.h"
#import "IGameComponent.h"
#import "IUpdatable.h"

@interface GameComponent : NSObject <IGameComponent, IUpdatable> {
@private
    BOOL enabled;
    Game *game;
	int updateOrder;

	Event *enabledChanged;
	Event *updateOrderChanged;
}

- (id) initWithGame:(Game*) theGame;

@property (nonatomic, readonly) Game *game;

@end
