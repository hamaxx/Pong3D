//
//  SpriteFont.m
//  XNI
//
//  Created by Matej Jan on 20.12.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "SpriteFont.h"
#import "SpriteFont+Internal.h"

#import "Retronator.Xni.Framework.h"

@implementation SpriteFont

- (id) initWithTexture:(Texture2D*)theTexture characterMap:(NSDictionary *)theCharacterMap lineSpacing:(int)theLineSpacing
{
	self = [super init];
	if (self != nil) {
		texture = [theTexture retain];
		characterMap = [theCharacterMap retain];
		
		characters = [[NSSet alloc] initWithArray:[characterMap allKeys]];

		lineSpacing = theLineSpacing;
	}
	return self;
}

@synthesize characters, defaultCharacter, lineSpacing, spacing;

- (Texture2D *) texture {
	return texture;
}

- (Vector2 *) measureString:(NSString *)text {
	Vector2 *size = [Vector2 zero];
	Vector2 *currentPosition = [Vector2 vectorWithX:0 y:lineSpacing];
	
	for (int i = 0; i < [text length]; i++) {
		unichar character = [text characterAtIndex:i];
		if ([[NSCharacterSet newlineCharacterSet] characterIsMember:character]) {
			// This is a control character for a new line.
			currentPosition.x = 0;
			currentPosition.y += lineSpacing;
		} else {
			// Draw this character
			Rectangle *sourceRectangle = [self sourceRectangleForCharacter:character];
			currentPosition.x += sourceRectangle.width + spacing;
			
			if (currentPosition.x > size.x) {
				size.x = currentPosition.x;
			}
			
			if (currentPosition.y > size.y) {
				size.y = currentPosition.y;
			}
		}
	}	
	
	return size;
}

- (Rectangle *) sourceRectangleForCharacter:(unichar)character {
	Rectangle *result = [characterMap objectForKey:[NSNumber numberWithChar:character]];
	
	if (!result && defaultCharacter) {
		result = [characterMap objectForKey:defaultCharacter];
	}
	
	if (!result) {
		[NSException raise:@"ArgumentException" format:@"The character %C with charcode %i is not supported by this sprite font.", character, (int)character];
	}
	
	return result;
}

- (void) dealloc
{
	[characters release];
	[defaultCharacter release];
	[texture release];
	[characterMap release];
	[super dealloc];
}


@end
