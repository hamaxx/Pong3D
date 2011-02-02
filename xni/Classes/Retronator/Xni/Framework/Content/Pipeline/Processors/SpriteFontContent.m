//
//  SpriteFontContent.m
//  XNI
//
//  Created by Matej Jan on 20.12.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "SpriteFontContent.h"
#import "SpriteFontContent+Internal.h"


@implementation SpriteFontContent

- (id) initWithTexture:(Texture2DContent*)theTexture characterMap:(NSDictionary*)theCharacterMap lineSpacing:(int)theLineSpacing
{
	self = [super init];
	if (self != nil) {
		texture = [theTexture retain];
		characterMap = [theCharacterMap retain];
		lineSpacing = theLineSpacing;
	}
	return self;
}

- (Texture2DContent *) texture {
	return texture;
}

- (NSDictionary *) characterMap {
	return characterMap;
}

- (int) lineSpacing {
	return lineSpacing;
}

- (void) dealloc
{
	[texture release];
	[characterMap release];
	[super dealloc];
}

@end
