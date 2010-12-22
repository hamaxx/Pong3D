//
//  AudioFormat.h
//  XNI
//
//  Created by Matej Jan on 15.12.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <AudioToolbox/AudioToolbox.h>

@interface AudioFormat : NSObject {
	int averageBytesPerSecond;
	int bitsPerSample;
	int blockAlign;
	int channelCount;
	int format;
	AudioStreamBasicDescription nativeWaveFormat;
	int sampleRate;
}

- (id) initWithDescription:(AudioStreamBasicDescription)description;

@property (nonatomic, readonly) int averageBytesPerSecond;
@property (nonatomic, readonly) int bitsPerSample;
@property (nonatomic, readonly) int blockAlign;
@property (nonatomic, readonly) int channelCount;
@property (nonatomic, readonly) int format;
@property (nonatomic, readonly) AudioStreamBasicDescription nativeWaveFormat;
@property (nonatomic, readonly) int sampleRate;

@end
