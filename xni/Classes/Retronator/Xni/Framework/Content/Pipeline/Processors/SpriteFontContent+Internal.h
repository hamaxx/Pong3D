//
//  SpriteFontContent+Internal.h
//  XNI
//
//  Created by Matej Jan on 20.12.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SpriteFontContent.h"

@interface SpriteFontContent (Internal)

- (id) initWithTexture:(Texture2DContent*)theTexture characterMap:(NSDictionary*)theCharacterMap lineSpacing:(int)theLineSpacing;

@property (nonatomic, readonly) Texture2DContent *texture;
@property (nonatomic, readonly) NSDictionary *characterMap;
@property (nonatomic, readonly) int lineSpacing;

@end
