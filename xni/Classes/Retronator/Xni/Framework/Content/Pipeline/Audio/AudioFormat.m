//
//  AudioFormat.m
//  XNI
//
//  Created by Matej Jan on 15.12.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "AudioFormat.h"


@implementation AudioFormat

- (id) initWithDescription:(AudioStreamBasicDescription)description {
	self = [super init];
	if (self != nil) {
		averageBytesPerSecond = description.mSampleRate * description.mBytesPerFrame;
		bitsPerSample = description.mBitsPerChannel;
		blockAlign = description.mBytesPerFrame;
		channelCount = description.mChannelsPerFrame;
		format = description.mFormatID;
		nativeWaveFormat = description;
		sampleRate = description.mSampleRate;
	}
	return self;
}

@synthesize averageBytesPerSecond, bitsPerSample, blockAlign, channelCount, format, nativeWaveFormat, sampleRate;


@end
