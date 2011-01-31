//
//  GameRenderer.m
//  Pong3D
//
//  Created by Matej Jan on 20.10.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "GameRenderer.h"

#import "Namespace.Pong3D.h"

@implementation GameRenderer

- (id) initWithGame:(Game *)theGame level:(Level *)theLevel
{
	self = [super initWithGame:theGame];
	if (self != nil) {
		level = theLevel;
		
		// We create our own content manager, so we can unload all the resources loaded with it.
		content = [[ContentManager alloc] initWithServiceProvider:theGame.services];
	}
	return self;
}

- (void) loadContent {
	viewFrom = [[Vector3 vectorWithX:40 y:50 z:20] retain];
	viewTo = [[Vector3 vectorWithX:-30 y:-30 z:-40] retain];
	changeView = YES;
	
	generalEffect = [[BasicEffect alloc] initWithGraphicsDevice:self.graphicsDevice];
	
	generalEffect.view = [Matrix createLookAtFrom:viewFrom to: viewTo up:[Vector3 up]];
	generalEffect.projection = [Matrix createPerspectiveFieldOfView:M_PI_2
										aspectRatio:self.graphicsDevice.viewport.aspectRatio
										nearPlaneDistance:1 farPlaneDistance:1000];
	generalEffect.vertexColorEnabled = YES;
	generalEffect.textureEnabled = YES;
	
	self.graphicsDevice.blendState = [BlendState alphaBlend];
	
	spriteBatch = [[SpriteBatch alloc] initWithGraphicsDevice:self.graphicsDevice];
	
	for (id<GameObject> gameObject in level.scene) {
		
		if ([gameObject conformsToProtocol:@protocol(GameObject)]) {
			[gameObject loadContent:self.graphicsDevice:content];
		}
		
	}
	
}

- (void) changeView {
	[viewFrom subtract:[Vector3 vectorWithX:0 y:0 z:16]];
	[viewFrom multiplyBy:0.95];
	
	[viewTo multiplyBy:0.95];
	
	if ([viewFrom lengthSquared] < 0.01 && [viewTo lengthSquared] < 0.01) {
		viewFrom = [Vector3 vectorWithX:0 y:0 z:16];
		viewTo = [Vector3 vectorWithX:0 y:0 z:0];
		changeView = NO;
		NSLog(@"stop change view");
	} else {
		[viewFrom add:[Vector3 vectorWithX:0 y:0 z:16]];
	}

	generalEffect.view = [Matrix createLookAtFrom:viewFrom to: viewTo up:[Vector3 up]];
	
}

- (void) drawWithGameTime:(GameTime *)gameTime {	
	[self.graphicsDevice clearWithColor:[Color black]];
	[spriteBatch begin];

	for (id<GameObject> gameObject in level.scene) {
	
		if ([gameObject conformsToProtocol:@protocol(GameObject)]) {
			[gameObject draw:generalEffect :self.graphicsDevice :spriteBatch];
		} 		
	}
	
	[spriteBatch end];
	
	if (changeView) {
		[self changeView];
	}
}

- (void) unloadContent {
	// We tell our content manager not to hold on to loaded resources anymore.
	[content unload];	
}

- (void) dealloc
{
	[spriteBatch release];		
	[level release];
	[super dealloc];
}

@end
