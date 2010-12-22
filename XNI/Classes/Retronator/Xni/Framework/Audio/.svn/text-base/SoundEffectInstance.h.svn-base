//
//  SoundEffectInstance.h
//  XNI
//
//  Created by Matej Jan on 15.12.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <OpenAL/al.h>
#import <OpenAL/alc.h>

#import "Retronator.Xni.Framework.Audio.classes.h"

@interface SoundEffectInstance : NSObject {
@private
	BOOL isLooped;	
	float pan, pitch, volume;
	NSUInteger sourceID;
}

@property (nonatomic) BOOL isLooped;
@property (nonatomic, readonly) SoundState state;
@property (nonatomic) float pan, pitch, volume;

- (void) play;
- (void) pause;
- (void) resume;
- (void) stop;
- (void) stopImmediate:(BOOL)immediate;

@end
