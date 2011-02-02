//
//  Song.h
//  XNI
//
//  Created by Matej Jan on 18.1.11.
//  Copyright 2011 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <AVFoundation/AVFoundation.h>

@interface Song : NSObject {
	AVAudioPlayer *audioPlayer;
}

@property (nonatomic, readonly) NSTimeInterval duration;

@end
