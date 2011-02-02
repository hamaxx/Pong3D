//
//  SoundEffectContent.m
//  XNI
//
//  Created by Matej Jan on 15.12.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "SoundEffectContent.h"
#import "SoundEffectContent+Internal.h"

@implementation SoundEffectContent

- (id) initWithData:(NSData *)theData format:(AudioFormat*)theFormat
{
	self = [super init];
	if (self != nil) {
		data = [theData retain];
		format = [theFormat retain];
	}
	return self;
}

- (NSData *) data {
	return data;
}

- (AudioFormat *) format {
	return format;
}

- (void) dealloc
{
	[data release];
	[format release];
	[super dealloc];
}


@end
