//
//  Score.h
//  Pong3D
//
//  Created by Jure Ham on 11/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Namespace.Pong3D.classes.h"
#import "Label.h"

@interface Score : NSObject<GameObject> {
	NSInteger home, away;
	VertexPositionColorArray *vertexArrayHome;
	VertexPositionColorArray *vertexArrayAway;
	
	NSInteger score;
	NSInteger level;
	
	SpriteFont *font;
	
	Label *label;
}

@property (nonatomic) NSInteger home;
@property (nonatomic) NSInteger away;

@property (nonatomic) NSInteger score;
@property (nonatomic) NSInteger level;

- (void) addScore: (NSInteger) side;
- (void) scoreLabel;

@end
