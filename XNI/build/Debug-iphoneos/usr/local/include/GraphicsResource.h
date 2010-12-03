//
//  GraphicsResource.h
//  XNI
//
//  Created by Matej Jan on 1.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Retronator.Xni.Framework.classes.h"
#import "Retronator.Xni.Framework.Graphics.classes.h"

@interface GraphicsResource : NSObject {
	GraphicsDevice *graphicsDevice;
	BOOL isDisposed;
	NSString *name;
	id tag;
}

- (id) initWithGraphicsDevice:(GraphicsDevice*)theGraphicsDevice;
							   
@property (nonatomic, readonly) GraphicsDevice *graphicsDevice;
@property (nonatomic, readonly) BOOL isDisposed;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) id tag;

@end
