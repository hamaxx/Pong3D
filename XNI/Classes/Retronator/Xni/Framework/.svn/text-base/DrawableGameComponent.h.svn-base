//
//  DrawableGameComponent.h
//  XNI
//
//  Created by Matej Jan on 12.10.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Retronator.Xni.Framework.Graphics.classes.h"
#import "GameComponent.h"
#import "IDrawable.h"

@interface DrawableGameComponent : GameComponent <IDrawable> {
@private
	BOOL visible;
	int drawOrder;
	
    Event *visibleChanged;
    Event *drawOrderChanged;
	
	id<IGraphicsDeviceService> graphicsDeviceService;
	
	BOOL contentLoaded;
}

@property (nonatomic, readonly) GraphicsDevice* graphicsDevice;

- (void) loadContent;
- (void) unloadContent;

@end
