//
//  MediaPlayer.m
//  XNI
//
//  Created by Matej Jan on 18.1.11.
//  Copyright 2011 Retronator. All rights reserved.
//

#import "MediaPlayer.h"

#import <AudioToolbox/AudioToolbox.h>

#import "Retronator.Xni.Framework.Media.h"
#import "MediaQueue+Internal.h"
#import "Song+Internal.h"

@interface MediaPlayer ()

- (BOOL) checkAvailability;
- (void) setMediaState:(MediaState)value;

@end


@implementation MediaPlayer

static MediaPlayer *instance;

+ (void) initialize {
	if (!instance) {
		instance = [[MediaPlayer alloc] init];
	}
}

- (id) init
{
	self = [super init];
	if (self != nil) {		
		// Start in ambient mode so we let user music play until a call to MediaPlayer play changes this.
		[[AVAudioSession sharedInstance]
		 setCategory: AVAudioSessionCategoryAmbient
		 error: nil];
		
		queue = [[MediaQueue alloc] init];
		isMuted = NO;
		volume = 1;
		
		[queue.activeSongChanged subscribeDelegate:[Delegate delegateWithTarget:self Method:@selector(queueActiveSongChanged)]];
		
		activeSongChanged = [[Event alloc] init];
		mediaStateChanged = [[Event alloc] init];
	}
	return self;
}

- (BOOL) gameHasControl {
	UInt32 otherAudioIsPlaying;
	UInt32 propertySize = sizeof(otherAudioIsPlaying);
	
	AudioSessionGetProperty (
							 kAudioSessionProperty_OtherAudioIsPlaying,
							 &propertySize,
							 &otherAudioIsPlaying
							 );
	
	return !otherAudioIsPlaying;
}

@synthesize isMuted;

- (void) setIsMuted:(BOOL)value {
	isMuted = value;
	
	if (isMuted) {
		queue.activeSong.audioPlayer.volume = 0;
	} else {
		queue.activeSong.audioPlayer.volume = volume;
	}
}

@synthesize isRepeating;
@synthesize isShuffled;

- (NSTimeInterval) playPosition {
	return queue.activeSong.audioPlayer.currentTime;
}

@synthesize volume;

- (void) setVolume:(float)value {
	volume = value;
	
	if (!isMuted) {
		queue.activeSong.audioPlayer.volume = volume;
	}
}

@synthesize queue, state, mediaStateChanged;

- (Event *) activeSongChanged {
	return queue.activeSongChanged;
}


+ (MediaPlayer*) getInstance {
	return instance;
}

+ (void) moveNext { [instance moveNext];}
+ (void) movePrevious { [instance movePrevious];}
+ (void) pause { [instance pause];}
+ (void) playSong:(Song*)song { [instance playSong:song];}
+ (void) resume { [instance resume];}
+ (void) stop { [instance stop];}

- (void) moveNext {
	if (![self checkAvailability]) {
		return;
	}
	
	if (isShuffled) {
		queue.activeSongIndex = random() % queue.count;
	} else {
		queue.activeSongIndex = (queue.activeSongIndex + 1) % queue.count;
	}
}

- (void) movePrevious {
	if (![self checkAvailability]) {
		return;
	}
	
	if (isShuffled) {
		queue.activeSongIndex = random() % queue.count;
	} else {
		queue.activeSongIndex = (queue.activeSongIndex - 1 + queue.count) % queue.count;
	}
}

- (void) pause {
	if (![self checkAvailability]) {
		return;
	}
	
	[queue.activeSong.audioPlayer pause];	
	[self setMediaState:MediaStatePaused];
}

- (void) playSong:(Song*)song {
	if (![self checkAvailability]) {
		return;
	}
	
	song.audioPlayer.delegate = self;
	[queue setSong:song];
	[queue.activeSong.audioPlayer play];
	[self setMediaState:MediaStatePlaying];
}

- (void) resume {
	if (![self checkAvailability]) {
		return;
	}
	
	[queue.activeSong.audioPlayer play];
	[self setMediaState:MediaStatePlaying];
}

- (void) stop {
	if (![self checkAvailability]) {
		return;
	}
	
	[queue.activeSong.audioPlayer pause];
	queue.activeSong.audioPlayer.currentTime = 0;
	[self setMediaState:MediaStateStopped];
}

- (BOOL) checkAvailability {
	if (!self.gameHasControl) {
		return NO;
	}
	
	if (!soloModeActivated) {
		// Switch to solo mode so we silence user audio before playing our music.
		[[AVAudioSession sharedInstance] setCategory: AVAudioSessionCategorySoloAmbient error:nil];
		soloModeActivated = YES;
	}
	
	return YES;
}

- (void) queueActiveSongChanged {
	[activeSongChanged raiseWithSender:self];
}

- (void) setMediaState:(MediaState)value {
	if (state == value) {
		return;
	}
	
	state = value;
	[mediaStateChanged raiseWithSender:self];
}

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
	[self moveNext];
	[self resume];
}

- (void) dealloc
{
	[activeSongChanged release];
	[mediaStateChanged release];
	[queue release];
	[super dealloc];
}


@end
