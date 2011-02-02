//
//  Mp3Importer.m
//  XNI
//
//  Created by Matej Jan on 15.12.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "Mp3Importer.h"

#import "Retronator.Xni.Framework.Content.Pipeline.Audio.h"

@implementation Mp3Importer

- (id) importFile:(NSString *)filename {
	AudioContent *content = [[[AudioContent alloc] initWithAudioFileName:filename audioFileType:AudioFileTypeMp3] autorelease];
	if (content.format.channelCount > 2) {
		[NSException raise:@"NotSupportedException" format:@"Only mono and stereo sounds are supported. Got %i channels.", content.format.channelCount];
	}
	return content;
}

@end
