//
//  FontTextureProcessor.h
//  XNI
//
//  Created by Matej Jan on 20.12.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ContentProcessor.h"

@interface FontTextureProcessor : ContentProcessor {
	unichar firstCharacter;
	BOOL premultiplyAlpha;
}

@property (nonatomic) unichar firstCharacter;
@property (nonatomic) BOOL premultiplyAlpha;

- (unichar) getCharacterForIndex:(int)index;

@end
