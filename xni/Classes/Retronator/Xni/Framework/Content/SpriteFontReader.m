//
//  SpriteFontReader.m
//  XNI
//
//  Created by Matej Jan on 20.12.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "SpriteFontReader.h"

#import "Retronator.Xni.Framework.Graphics.h"
#import "Retronator.Xni.Framework.Content.h"
#import "Retronator.Xni.Framework.Content.Pipeline.Processors.h"

#import "SpriteFontContent+Internal.h"
#import "SpriteFont+Internal.h"

@implementation SpriteFontReader

- (id) readFromInput:(ContentReader *)input into:(id)existingInstance {
	SpriteFontContent *content = input.content;
	
	Texture2D *texture = [input readObjectFrom:content.texture];

	SpriteFont *result = [[(SpriteFont*)[SpriteFont alloc] initWithTexture:texture 
															  characterMap:content.characterMap
															   lineSpacing:content.lineSpacing] autorelease];
	
	return result;
}

@end
