//
//  FontTextureProcessor.m
//  XNI
//
//  Created by Matej Jan on 20.12.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "FontTextureProcessor.h"

#import "Retronator.Xni.Framework.h"
#import "Retronator.Xni.Framework.Content.Pipeline.Graphics.h"

#import "SpriteFontContent+Internal.h"

static inline BOOL IsOnCharacter(Byte *color) {
	return color[0] != 255 || color[1] != 0 || color[2] != 255 || color[3] != 255;
}

static inline BOOL IsOnBlack(Byte *color) {
	return color[0] == 0 && color[1] == 0 && color[2] == 0;
}

@implementation FontTextureProcessor

- (id) init
{
	self = [super init];
	if (self != nil) {
		firstCharacter = ' ';
	}
	return self;
}

@synthesize firstCharacter, premultiplyAlpha;

- (Class) inputType { return [Texture2DContent class];}
- (Class) outputType { return [SpriteFontContent class];}

- (SpriteFontContent*) process:(Texture2DContent*)input {
	PixelBitmapContent *bitmap = (PixelBitmapContent*)[input.mipmaps objectAtIndex:0];
	
	NSMutableDictionary *characterMap = [NSMutableDictionary dictionary];
	NSMutableArray *incompleteCharacters = [NSMutableArray array];
	
	BOOL usesAlpha = NO;
	
	int lineSpacing = 0;
	
	int index = 0;
	
	for (int y = 0; y < bitmap.height; y++) {
		// Clear all incomplete characters past this line.
		int i=0;
		while (i<[incompleteCharacters count]) {
			Rectangle *rectangle = [incompleteCharacters objectAtIndex:i];
			if (y >= rectangle.y + rectangle.height) {
				[incompleteCharacters removeObjectAtIndex:i];
			} else {
				i++;
			}
		}
		
		int x = 0;
		BOOL wasOnCharacter = NO;
		
		while (x < bitmap.width) {
			Byte *color = [bitmap getPixelAtX:x Y:y];
			if (!usesAlpha && color[3] < 255) {
				usesAlpha = YES;
			}			
			
			BOOL onCharacter = IsOnCharacter(color);
			
			if (!wasOnCharacter && onCharacter) {
				// We've reached a new character, but first see if it is one of the incomplete ones.
				BOOL new = YES;
				for (Rectangle *rectangle in incompleteCharacters) {
					if ([rectangle containsX:x y:y]) {
						new = NO;
						x = rectangle.x + rectangle.width - 1;
						break;
					}
				}
				
				if (new) {
					unichar character = [self getCharacterForIndex:index];
					Rectangle *rectangle = [Rectangle rectangleWithX:x y:y width:0 height:0];
					
					// Find first off character pixel to the right.
					int right = x;
					while (right < bitmap.width && IsOnCharacter([bitmap getPixelAtX:right Y:y])) {
						right++;
					}
					
					// Do the same for bottom.
					int bottom = y;
					while (bottom < bitmap.height && IsOnCharacter([bitmap getPixelAtX:x Y:bottom])) {
						bottom++;
					}
					
					rectangle.width = right - x;
					rectangle.height = bottom - y;
					
					if (rectangle.height > lineSpacing) {
						lineSpacing = rectangle.height;
					}
					
					[characterMap setObject:rectangle forKey:[NSNumber numberWithChar:character]];
					[incompleteCharacters addObject:rectangle];
					
					index++;
					x = right - 1;
				}
			}
			
			wasOnCharacter = onCharacter;
			x++;
		}
	}
	
	for (int x = 0; x < bitmap.width; x++) {
		for (int y = 0; y < bitmap.height; y++) {
			Byte *color = [bitmap getPixelAtX:x Y:y];
						
			if (!IsOnCharacter(color) || !usesAlpha && IsOnBlack(color)) {
				// If the sprite font does not use an alpha channel we should key the black color.
				// Always also key the separator color.
				for (int i = 0; i < 4; i++) {
					color[i]=0;
				}
			} else if (premultiplyAlpha) {
				// Premultiply alpha for support of non-premultiplied images.
				float factor = (float)color[4]/255.0f;
				for (int i = 0; i < 3; i++) {
					color[i] = (Byte)((float)color[i]*factor);
				}
			}
		}
	}
	
	SpriteFontContent* result = [[[SpriteFontContent alloc] initWithTexture:input
															   characterMap:characterMap 
																lineSpacing:lineSpacing] autorelease];
	return result;
}

- (unichar) getCharacterForIndex:(int)index {
	return firstCharacter + index;
}

@end
