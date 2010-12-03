//
//  SamplerEvent.h
//  XNI
//
//  Created by Matej Jan on 26.10.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "System.h"

@interface XniSamplerEventArgs : EventArgs {
	int samplerIndex;
}

- (id) initWithSamplerIndex:(int)theSamplerIndex;
+ (id) eventArgsWithSamplerIndex:(int)theSamplerIndex;

@property (nonatomic, readonly) int samplerIndex;

@end
