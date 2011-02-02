//
//  SoundEffectProcessor.m
//  XNI
//
//  Created by Matej Jan on 15.12.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "SoundEffectProcessor.h"

#import "Retronator.Xni.Framework.Content.Pipeline.Processors.h"
#import "Retronator.Xni.Framework.Content.Pipeline.Audio.h"

#import "SoundEffectContent+Internal.h"

@implementation SoundEffectProcessor

- (Class) inputType { return [AudioContent class];}
- (Class) outputType { return [SoundEffectContent class];}

- (SoundEffectContent*) process:(AudioContent*)input {
	[input convertFormatTo:ConversionFormatPcm quality:ConversionQualityBest targetFileName:nil];
	return [[[SoundEffectContent alloc] initWithData:input.data format:input.format] autorelease];
}

@end
