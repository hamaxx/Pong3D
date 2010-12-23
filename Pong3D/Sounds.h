//
//  Sounds.h
//  Pong3D
//
//  Created by Jure Ham on 12/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Retronator.Xni.Framework.Audio.h"
#import "Namespace.Pong3D.classes.h"

@interface Sounds : GameComponent {
	SoundEffect *wall;
	SoundEffect *racket;
	SoundEffect *win;
	SoundEffect *lose;
	SoundEffect *hit;
	SoundEffect *miss;
}

+ (void) initializeWithGane: (Game*)game;
+ (void) play:(NSInteger) effect;

@end
