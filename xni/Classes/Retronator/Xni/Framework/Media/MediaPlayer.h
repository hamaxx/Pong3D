//
//  MediaPlayer.h
//  XNI
//
//  Created by Matej Jan on 18.1.11.
//  Copyright 2011 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

#import "System.h"

#import "Retronator.Xni.Framework.Media.classes.h"

@interface MediaPlayer : NSObject <AVAudioPlayerDelegate> {
	BOOL soloModeActivated;
	BOOL isMuted;
	BOOL isRepeating;
	BOOL isShuffled;
	MediaQueue *queue;
	MediaState state;
	float volume;
	
	Event *activeSongChanged;
	Event *mediaStateChanged;
}

@property (nonatomic, readonly) BOOL gameHasControl;
@property (nonatomic) BOOL isMuted;
@property (nonatomic) BOOL isRepeating;
@property (nonatomic) BOOL isShuffled;
@property (nonatomic, readonly) NSTimeInterval playPosition;
@property (nonatomic, readonly) MediaQueue *queue;
@property (nonatomic, readonly) MediaState state;
@property (nonatomic) float volume;

@property (nonatomic, readonly) Event *activeSongChanged;
@property (nonatomic, readonly) Event *mediaStateChanged;

+ (MediaPlayer*) getInstance;

+ (void) moveNext;
+ (void) movePrevious;
+ (void) pause;
+ (void) playSong:(Song*)song;
+ (void) resume;
+ (void) stop;

- (void) moveNext;
- (void) movePrevious;
- (void) pause;
- (void) playSong:(Song*)song;
- (void) resume;
- (void) stop;

@end
