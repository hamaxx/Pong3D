//
//  AudioContent.h
//  XNI
//
//  Created by Matej Jan on 15.12.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Retronator.Xni.Framework.Content.Pipeline.Audio.classes.h"

#import "ContentItem.h"

@interface AudioContent : ContentItem {
	NSTimeInterval duration;
	NSString *fileName;
	AudioFileType fileType;
	AudioFormat *format;
	int loopLength;
	int loopStart;

@private
	NSURL *fileUrl;
	ExtAudioFileRef extRef;
}

- (id) initWithAudioFileName:(NSString*)theFileName audioFileType:(AudioFileType)theFileType;

@property (nonatomic, readonly) NSData *data;
@property (nonatomic, readonly) NSTimeInterval duration;
@property (nonatomic, readonly) NSString *fileName;
@property (nonatomic, readonly) AudioFileType fileType;
@property (nonatomic, readonly) AudioFormat *format;
@property (nonatomic, readonly) int loopLength;
@property (nonatomic, readonly) int loopStart;

- (void) convertFormatTo:(ConversionFormat)formatType quality:(ConversionQuality)quality targetFileName:(NSString*)targetFileName;

@end
