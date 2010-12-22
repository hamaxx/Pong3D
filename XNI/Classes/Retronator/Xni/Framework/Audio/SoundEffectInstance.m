//
//  SoundEffectInstance.m
//  XNI
//
//  Created by Matej Jan on 15.12.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "SoundEffectInstance.h"
#import "SoundEffectInstance+Internal.h"

@implementation SoundEffectInstance

- (id) initWithBufferID:(NSUInteger)bufferID
{
	self = [super init];
	if (self != nil) {
		// grab a source ID from openAL
		alGenSources(1, &sourceID); 
		
		// attach the buffer to the source
		alSourcei(sourceID, AL_BUFFER, bufferID);
		
		// set some basic source prefs
		alSourcef(sourceID, AL_PITCH, 1.0f);
		alSourcef(sourceID, AL_GAIN, 1.0f);	
	}
	return self;
}

@synthesize isLooped, pan, pitch, volume;

- (void) setIsLooped:(BOOL)value {
	isLooped = value;
	alSourcei(sourceID, AL_LOOPING, isLooped);
}

- (SoundState) state {
	ALenum state;
    alGetSourcei(sourceID, AL_SOURCE_STATE, &state);
	return state;
}

- (void) setPan:(float)value {	
	pan = value;
	alSource3f(sourceID, AL_POSITION, pan, 0, 0);
}

- (void) setPitch:(float)value {
	pitch = value;
	float alPitch = pow(2, value);
	alSourcef(sourceID, AL_PITCH, alPitch);
}

- (void) setVolume:(float)value {
	volume = value;
	alSourcef(sourceID, AL_GAIN, volume);		
}

- (void) play {
	alSourcePlay(sourceID);
}


- (void) pause {
	alSourcePause(sourceID);	
}


- (void) resume {
	alSourcePlay(sourceID);
}

- (void) stop {
	[self stopImmediate:YES];
}

- (void) stopImmediate:(BOOL)immediate {
	if (immediate) {
		alSourceStop(sourceID);
	}
}

- (void) dealloc
{
	alDeleteSources(1, &sourceID);
	[super dealloc];
}


@end
