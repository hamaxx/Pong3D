//
//  Sprite.h
//  Pong3D
//
//  Created by Matej Jan on 20.10.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Namespace.Pong3D.classes.h"

/**
 Represents a part of an image, usually a sprite on a sprite sheet.
 */
@interface Sprite : NSObject {
	Texture2D *texture;
	Rectangle *sourceRectangle;
	Vector2 *origin;
	Vector2 *relative;
}

/**
 Which texture to use for drawing this sprite.
 */
@property (nonatomic, retain) Texture2D *texture;
 
/**
 The part of the texture that holds the desired sprite.
 */
@property (nonatomic, retain) Rectangle *sourceRectangle;

/**
 What is the reference point within the source rectangle, relative to which the sprite is positioned.
 */
@property (nonatomic, retain) Vector2 *origin;

@property (nonatomic, retain) Vector2 *relative;

@end
