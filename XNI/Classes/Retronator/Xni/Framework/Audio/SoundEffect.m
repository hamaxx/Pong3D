//
//  SoundEffect.m
//  XNI
//
//  Created by Matej Jan on 15.12.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "SoundEffect.h"

#import "Retronator.Xni.Framework.Audio.h"

#import "SoundEffectInstance+Internal.h"

@implementation SoundEffect

static ALCdevice *audioDevice = nil;
static ALCcontext *audioContext = nil;

static NSMutableArray *playingInstances;

static float speedOfSound = 343.5;
static float masterVolume = 1;

+ (void) initialize {
	if (!audioDevice) {
		// Initialization
		audioDevice = alcOpenDevice(NULL); // select the "preferred device"
		if (audioDevice) {
			// use the device to make a context
			audioContext=alcCreateContext(audioDevice,NULL);
			// set my context to the currently active one
			alcMakeContextCurrent(audioContext);
		}
		
		playingInstances = [[NSMutableArray alloc] init];
	}
}

- (id) initWithBuffer:(NSData*)theBuffer sampleRate:(int)theSampleRate channels:(AudioChannels)theChannels {
	return [self initWithBuffer:theBuffer offset:0 count:[theBuffer length] sampleRate:theSampleRate channels:theChannels loopStart:0 loopLength:0];
}

- (id) initWithBuffer:(NSData*)theBuffer
			   offset:(int)theOffset 
				count:(int)theCount
		   sampleRate:(int)theSampleRate 
			 channels:(AudioChannels)theChannels 
			loopStart:(int)theLoopStart 
		   loopLength:(int)theLoopLength
{
	self = [super init];
	if (self != nil) {
		buffer = theBuffer;
		offset = theOffset;
		count = theCount;
		sampleRate = theSampleRate;
		channels = theChannels;
		loopStart = theLoopStart;
		loopLength = theLoopLength;
		
		// Create an OpenAL buffer.
		alGenBuffers(1, &bufferID);				
		alBufferData(bufferID, channels, [theBuffer bytes], [theBuffer length], theSampleRate);
	}
	return self;
}

@synthesize duration, name;

+ (float) speedOfSound {
	return speedOfSound;
}

+ (void) setSpeedOfSound:(float)value {
	speedOfSound = value;
	alSpeedOfSound(speedOfSound);
}

+ (float) masterVolume {
	return masterVolume;
}

+ (void) setMasterVolume:(float)value {
	masterVolume = value;
	alListenerf(AL_GAIN, masterVolume);
}

+ (SoundEffect*) fromStream:(NSStream*)stream {
	return nil;
}

+ (int) getSecondInBytesForSampleRate:(int)sampleRate channels:(AudioChannels)channels {
	int secondInBytes = sampleRate;
	
	// 16 bits per sample = 2 bytes per sample.
	secondInBytes *= 2;
	
	// Multiply with number of channels.
	if (channels == AudioChannelsStereo) {
		secondInBytes *= 2;
	}	
	
	return secondInBytes;
}

+ (NSTimeInterval) getSampleDurationForSizeInBytes:(int)sizeInBytes sampleRate:(int)sampleRate channels:(AudioChannels)channels {
	return (double)sizeInBytes / (double)[SoundEffect getSecondInBytesForSampleRate:sampleRate channels:channels];
}

+ (int) getSampleSizeInBytesForDuration:(NSTimeInterval)duration sampleRate:(int)sampleRate channels:(AudioChannels)channels {
	return (int)(duration * [SoundEffect getSecondInBytesForSampleRate:sampleRate channels:channels]);
}

+ (void) update {
	int i=0;
	while (i<[playingInstances count]) {
		SoundEffectInstance *instance = [playingInstances objectAtIndex:i];
		if (instance.state == SoundStateStopped) {
			[playingInstances removeObjectAtIndex:i];
		} else {
			i++;
		}
	}
}

- (SoundEffectInstance *) createInstance {
	return [[[SoundEffectInstance alloc] initWithBufferID:bufferID] autorelease];
}

- (BOOL) play {
	return [self playWithVolume:1 pitch:0 pan:0];
}

- (BOOL) playWithVolume:(float)volume pitch:(float)pitch pan:(float)pan {
	SoundEffectInstance *instance = [self createInstance];
	[playingInstances addObject:instance];
	instance.volume = volume;
	instance.pitch = pitch;
	instance.pan = pan;
	[instance play];
	return YES;
}

- (void) dealloc
{
	alDeleteBuffers(1, &bufferID);
	[super dealloc];
}

@end
