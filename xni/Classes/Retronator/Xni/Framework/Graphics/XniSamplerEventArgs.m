//
//  SamplerEvent.m
//  XNI
//
//  Created by Matej Jan on 26.10.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "XniSamplerEventArgs.h"


@implementation XniSamplerEventArgs

- (id) initWithSamplerIndex:(int)theSamplerIndex
{
	self = [super init];
	if (self != nil) {
		samplerIndex = theSamplerIndex;
	}
	return self;
}

+ (id) eventArgsWithSamplerIndex:(int)theSamplerIndex {
	return [[[XniSamplerEventArgs alloc] initWithSamplerIndex:theSamplerIndex] autorelease];
}

@synthesize samplerIndex;

@end
