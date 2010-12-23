//
//  SpriteFont.h
//  XNI
//
//  Created by Matej Jan on 20.12.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Retronator.Xni.Framework.classes.h"
#import "Retronator.Xni.Framework.Graphics.classes.h"

@interface SpriteFont : NSObject {
	NSSet *characters;
	NSNumber *defaultCharacter;
	int lineSpacing;
	float spacing;
	
@private
	Texture2D *texture;
	NSDictionary *characterMap;
}

@property (nonatomic, readonly) NSSet *characters;
@property (nonatomic, retain) NSNumber *defaultCharacter;
@property (nonatomic) int lineSpacing;
@property (nonatomic) float spacing;

- (Vector2*) measureString:(NSString*)text;

@end
