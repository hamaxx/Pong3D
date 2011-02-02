//
//  MediaQueue.h
//  XNI
//
//  Created by Matej Jan on 18.1.11.
//  Copyright 2011 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "System.h"

#import "Retronator.Xni.Framework.Media.classes.h"

@interface MediaQueue : NSObject {
	NSMutableArray *queue;
	int activeSongIndex;
	
	Event *activeSongChanged;
}

@property (nonatomic, readonly) Song *activeSong;
@property (nonatomic) int activeSongIndex;
@property (nonatomic, readonly) int count;

- (Song*) itemAt:(int)index;

@end
