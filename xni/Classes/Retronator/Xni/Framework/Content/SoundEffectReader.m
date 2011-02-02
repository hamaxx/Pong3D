//
//  SoundEffectReader.m
//  XNI
//
//  Created by Matej Jan on 15.12.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "SoundEffectReader.h"

#import "Retronator.Xni.Framework.Content.h"
#import "Retronator.Xni.Framework.Audio.h"
#import "Retronator.Xni.Framework.Content.Pipeline.Processors.h"
#import "Retronator.Xni.Framework.Content.Pipeline.Audio.h"

#import "SoundEffectContent+Internal.h"

@implementation SoundEffectReader

- (id) readFromInput:(ContentReader *)input into:(id)existingInstance {
	SoundEffectContent *content = input.content;

	AudioChannels channels = AudioChannelsMono;
	if (content.format.channelCount == 2) {
		channels = AudioChannelsStereo;
	}
	
	SoundEffect *soundEffect = [[[SoundEffect alloc] initWithBuffer:content.data 
														 sampleRate:content.format.sampleRate 
														   channels:channels] autorelease];
	
	return soundEffect;
}

@end
