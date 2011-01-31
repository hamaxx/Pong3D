//
//  Position.h
//  Pong3D
//
//  Created by Matej Jan on 20.10.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GameObject<NSObject>

@property (nonatomic, retain) Vector3 *position;

- (void) loadContent:(GraphicsDevice *) gd :(ContentManager *)cm;
- (void) draw:(BasicEffect *)effect :(GraphicsDevice *)graphicsDevice: (SpriteBatch *)spriteBatch;

@end
