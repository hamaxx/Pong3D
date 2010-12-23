//
//  SoundEffect.h
//  XNI
//
//  Created by Matej Jan on 15.12.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <OpenAL/al.h>
#import <OpenAL/alc.h>

#import "Retronator.Xni.Framework.Audio.classes.h"

@interface SoundEffect : NSObject {
@private
	NSData *buffer;
	int offset;
	int count;
	int sampleRate;
	AudioChannels channels;
	int loopStart;
	int loopLength;
	NSString *name;
	
	NSUInteger bufferID;
}

- (id) initWithBuffer:(NSData*)theBuffer sampleRate:(int)theSampleRate channels:(AudioChannels)theChannels;
- (id) initWithBuffer:(NSData*)theBuffer offset:(int)theOffset count:(int)theCount sampleRate:(int)theSampleRate channels:(AudioChannels)theChannels loopStart:(int)theLoopStart loopLength:(int)theLoopLength;

@property (nonatomic, readonly) NSTimeInterval duration;
@property (nonatomic, retain) NSString *name;

+ (float) speedOfSound;
+ (void) setSpeedOfSound:(float)value;

+ (float) masterVolume;
+ (void) setMasterVolume:(float)value;

+ (SoundEffect*) fromStream:(NSStream*)stream;
+ (NSTimeInterval) getSampleDurationForSizeInBytes:(int)sizeInBytes sampleRate:(int)sampleRate channels:(AudioChannels)channels;
+ (int) getSampleSizeInBytesForDuration:(NSTimeInterval)duration sampleRate:(int)sampleRate channels:(AudioChannels)channels;

- (SoundEffectInstance*) createInstance;
- (BOOL) play;
- (BOOL) playWithVolume:(float)volume pitch:(float)pitch pan:(float)pan;

@end
