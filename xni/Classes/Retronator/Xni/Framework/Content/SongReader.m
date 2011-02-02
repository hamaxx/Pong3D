//
//  SongReader.m
//  XNI
//
//  Created by Matej Jan on 18.1.11.
//  Copyright 2011 Retronator. All rights reserved.
//

#import "SongReader.h"

#import "Retronator.Xni.Framework.Content.h"
#import "Retronator.Xni.Framework.Media.h"
#import "Retronator.Xni.Framework.Content.Pipeline.Processors.h"
#import "Retronator.Xni.Framework.Content.Pipeline.Audio.h"

#import "SongContent+Internal.h"
#import "Song+Internal.h"

@implementation SongReader

- (id) readFromInput:(ContentReader *)input into:(id)existingInstance {
	SongContent *content = input.content;
	
	Song *song = [[[Song alloc] initWithUrl:content.url] autorelease];
	
	return song;
}


@end
