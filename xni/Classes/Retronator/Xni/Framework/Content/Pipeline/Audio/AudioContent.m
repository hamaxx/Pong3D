//
//  AudioContent.m
//  XNI
//
//  Created by Matej Jan on 15.12.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "AudioContent.h"

#import "Retronator.Xni.Framework.Content.Pipeline.Audio.h"

@implementation AudioContent

- (id) initWithAudioFileName:(NSString *)theFileName audioFileType:(AudioFileType)theFileType
{
	self = [super init];
	if (self != nil) {
		fileName = theFileName;
		fileType = theFileType;

		// Load file.
		OSStatus err = noErr;
		AudioStreamBasicDescription theFileFormat;
		UInt32 thePropertySize = sizeof(theFileFormat);
		
		// Open a file with ExtAudioFileOpen().
		fileUrl = [[NSURL fileURLWithPath:theFileName] retain];
		extRef = nil;
		err = ExtAudioFileOpenURL((CFURLRef)fileUrl, &extRef);
		if (err) {
			[NSException raise:@"NotSupportedException" format:@"ExtAudioFileOpenURL FAILED, Error = %ld\n", err];
		}
		
		// Get the audio data format.
		err = ExtAudioFileGetProperty(extRef, kExtAudioFileProperty_FileDataFormat, &thePropertySize, &theFileFormat);
		if (err) {
			[NSException raise:@"NotSupportedException" format:@"ExtAudioFileGetProperty(kExtAudioFileProperty_FileDataFormat) FAILED, Error = %ld\n", err];
		}	
		
		format = [[AudioFormat alloc] initWithDescription:theFileFormat];
	}
	return self;
}

@synthesize duration, fileName, fileType, format, loopLength, loopStart;

- (NSData *) data {
	// Get the total frame count
	void* theData = NULL;
	SInt64 theFileLengthInFrames = 0;
	UInt32 thePropertySize = sizeof(theFileLengthInFrames);
	OSStatus err = noErr;
	err = ExtAudioFileGetProperty(extRef, kExtAudioFileProperty_FileLengthFrames, &thePropertySize, &theFileLengthInFrames);
	if (err) { 
		[NSException raise:@"NotSupportedException" format:@"MyGetOpenALAudioData: ExtAudioFileGetProperty(kExtAudioFileProperty_FileLengthFrames) FAILED, Error = %ld\n", err];
	}
	
	duration = (double)theFileLengthInFrames / (double)format.sampleRate;
	
	// Read all the data into memory
	UInt32 dataSize = theFileLengthInFrames * format.nativeWaveFormat.mBytesPerFrame;
	
	theData = malloc(dataSize);
	if (theData)
	{
		AudioBufferList	theDataBuffer;
		theDataBuffer.mNumberBuffers = 1;
		theDataBuffer.mBuffers[0].mDataByteSize = dataSize;
		theDataBuffer.mBuffers[0].mNumberChannels = format.nativeWaveFormat.mChannelsPerFrame;
		theDataBuffer.mBuffers[0].mData = theData;
		
		// Read the data into an AudioBufferList
		err = ExtAudioFileRead(extRef, (UInt32*)&theFileLengthInFrames, &theDataBuffer);
		if (err) {
			// failure
			[NSException raise:@"NotSupportedException" format:@"MyGetOpenALAudioData: ExtAudioFileRead FAILED, Error = %ld\n", err];
		}
	}
	
	NSData *result = [NSData dataWithBytes:theData length:dataSize];
	free(theData);
	return result;
}

- (void) convertFormatTo:(ConversionFormat)formatType quality:(ConversionQuality)quality targetFileName:(NSString *)targetFileName {
	AudioStreamBasicDescription theOutputFormat;
	
	// Set the client format to 16 bit signed integer (native-endian) data
	// Maintain the channel count and sample rate of the original source format
	theOutputFormat.mSampleRate = format.nativeWaveFormat.mSampleRate;
	theOutputFormat.mChannelsPerFrame = format.nativeWaveFormat.mChannelsPerFrame;
	
	theOutputFormat.mFormatID = formatType;
	theOutputFormat.mBytesPerPacket = 2 * theOutputFormat.mChannelsPerFrame;
	theOutputFormat.mFramesPerPacket = 1;
	theOutputFormat.mBytesPerFrame = 2 * theOutputFormat.mChannelsPerFrame;
	theOutputFormat.mBitsPerChannel = 16;
	theOutputFormat.mFormatFlags = kAudioFormatFlagsNativeEndian | kAudioFormatFlagIsPacked | kAudioFormatFlagIsSignedInteger;
	
	// Set the desired client (output) data format
	OSStatus err = noErr;
	err = ExtAudioFileSetProperty(extRef, kExtAudioFileProperty_ClientDataFormat, sizeof(theOutputFormat), &theOutputFormat);
	if (err) { 
		[NSException raise:@"NotSupportedException" format:@"MyGetOpenALAudioData: ExtAudioFileSetProperty(kExtAudioFileProperty_ClientDataFormat) FAILED, Error = %ld\n", err];
	}	

	[format release];
	format = [[AudioFormat alloc] initWithDescription:theOutputFormat];
}

- (void) dealloc
{
	//if (extRef) ExtAudioFileDispose(extRef);	
	[format release];
	[fileUrl release];
	[super dealloc];
}

@end
