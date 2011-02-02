//
//  MediaQueue+Internal.h
//  XNI
//
//  Created by Matej Jan on 18.1.11.
//  Copyright 2011 Retronator. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MediaQueue.h"

@interface MediaQueue (Internal)

@property (nonatomic, readonly) Event *activeSongChanged;

- (void) setSong:(Song*)song;

@end
