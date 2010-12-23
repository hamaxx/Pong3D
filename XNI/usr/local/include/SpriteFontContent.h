//
//  SpriteFontContent.h
//  XNI
//
//  Created by Matej Jan on 20.12.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Retronator.Xni.Framework.Content.Pipeline.Graphics.classes.h"

@interface SpriteFontContent : NSObject {
@private
	Texture2DContent *texture;
	NSDictionary *characterMap;
	int lineSpacing;
}

@end
