//
//  GameRenderer.h
//  Pong3D
//
//  Created by Matej Jan on 20.10.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Retronator.Xni.Framework.Graphics.h"
#import "Retronator.Xni.Framework.Content.h"

#import "Namespace.Pong3D.classes.h"

/**
 The game renderer knows how to render a game level.
 */
@interface GameRenderer : DrawableGameComponent {
	
	ContentManager *content;
	SpriteBatch *spriteBatch;
	
	BasicEffect *generalEffect;

	Level *level;
	
	BOOL changeView;
	Vector3 *viewFrom;
	Vector3 *viewTo;
}

- (id) initWithGame:(Game *)theGame level:(Level *)theLevel;

@end
