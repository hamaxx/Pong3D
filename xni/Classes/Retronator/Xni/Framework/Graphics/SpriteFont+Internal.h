//
//  SpriteFont+Internal.h
//  XNI
//
//  Created by Matej Jan on 20.12.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SpriteFont.h"

@interface SpriteFont (Internal)

- (id) initWithTexture:(Texture2D*)theTexture characterMap:(NSDictionary*)theCharacterMap lineSpacing:(int)theLineSpacing;

@property (nonatomic, readonly) Texture2D *texture;

- (Rectangle*) sourceRectangleForCharacter:(unichar)character;

@end
