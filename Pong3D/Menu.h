//
//  Menu.h
//  Pong3D
//
//  Created by Jure Ham on 1/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Namespace.Pong3D.classes.h"
#import <CommonCrypto/CommonDigest.h>


@interface Menu : NSObject<GameObject> {
	Level *level;
	
	Texture2D * menu;
	Texture2D * newGame;
	Texture2D * cont;
	Texture2D * scores;
	Texture2D * addscore;
	
	Vector2 *press;
	
	Score *score;
}

+ (BOOL) shown;
+ (void) shown: (BOOL) sh :(BOOL) c;


- (id) initWithLevel:(Level *) l :(Score *) sc;

@end
