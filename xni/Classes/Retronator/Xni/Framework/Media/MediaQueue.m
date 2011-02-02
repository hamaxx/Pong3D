//
//  MediaQueue.m
//  XNI
//
//  Created by Matej Jan on 18.1.11.
//  Copyright 2011 Retronator. All rights reserved.
//

#import "MediaQueue.h"

#import <AVFoundation/AVFoundation.h>

#import "MediaQueue+Internal.h"
#import "Song+Internal.h"

@implementation MediaQueue

- (id) init
{
	self = [super init];
	if (self != nil) {
		queue = [[NSMutableArray alloc] init];
		
		activeSongChanged = [[Event alloc] init];
	}
	return self;
}

@synthesize activeSongIndex;

- (Event *) activeSongChanged {
	return activeSongChanged;
}

- (void) setActiveSongIndex:(int)value {
	if (value == activeSongIndex) {
		return;
	}
	
	AVAudioPlayer *player = self.activeSong.audioPlayer;
	BOOL playing = player.playing;
	
	if (playing) {
		// Stop playing current song.
		[player pause];
		player.currentTime = 0;
	}
	
	activeSongIndex = value;
	
	if (playing) {
		// Start new song.
		[self.activeSong.audioPlayer play];
	}
	
	[activeSongChanged raiseWithSender:self];
}

- (Song *) activeSong {
	return [queue objectAtIndex:activeSongIndex];
}

- (int) count {
	return [queue count];
}

- (Song *) itemAt:(int)index {
	return [queue objectAtIndex:index];
}

- (void) setSong:(Song *)song {
	[queue removeAllObjects];
	[queue addObject:song];
	activeSongIndex = 0;
}

- (void) dealloc
{
	[activeSongChanged release];
	[queue release];
	[super dealloc];
}



@end
