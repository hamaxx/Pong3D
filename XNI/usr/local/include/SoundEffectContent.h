//
//  SoundEffectContent.h
//  XNI
//
//  Created by Matej Jan on 15.12.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Retronator.Xni.Framework.Content.Pipeline.Audio.classes.h"

@interface SoundEffectContent : NSObject {
@private
	NSData *data;
	AudioFormat *format;
}

@end
