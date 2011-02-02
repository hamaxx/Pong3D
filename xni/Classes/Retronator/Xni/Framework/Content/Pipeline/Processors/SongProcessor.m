//
//  SongProcessor.m
//  XNI
//
//  Created by Matej Jan on 15.12.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "SongProcessor.h"

#import "Retronator.Xni.Framework.Content.Pipeline.Processors.h"
#import "Retronator.Xni.Framework.Content.Pipeline.Audio.h"

#import "SongContent+Internal.h"

@implementation SongProcessor

- (Class) inputType { return [AudioContent class];}
- (Class) outputType { return [SongContent class];}

- (SongContent*) process:(AudioContent*)input {
	return [[[SongContent alloc] initWithFileName:input.fileName] autorelease];
}

@end
