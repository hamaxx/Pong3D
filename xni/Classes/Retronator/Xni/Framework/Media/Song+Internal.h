//
//  Song+Internal.h
//  XNI
//
//  Created by Matej Jan on 18.1.11.
//  Copyright 2011 Retronator. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Song.h"

@interface Song (Internal)

- (id) initWithUrl:(NSURL*)url;

@property (nonatomic, readonly) AVAudioPlayer *audioPlayer;

@end
