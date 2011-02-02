//
//  Song.m
//  XNI
//
//  Created by Matej Jan on 18.1.11.
//  Copyright 2011 Retronator. All rights reserved.
//

#import "Song.h"
#import "Song+Internal.h"

@implementation Song

- (id) initWithUrl:(NSURL*)url 
{
	self = [super init];
	if (self != nil) {
		audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
		[audioPlayer prepareToPlay];
	}
	return self;
}

- (NSTimeInterval) duration {
	return audioPlayer.duration;
}

- (AVAudioPlayer *) audioPlayer {
	return audioPlayer;
}

- (void) dealloc
{
	[audioPlayer release];
	[super dealloc];
}


@end
