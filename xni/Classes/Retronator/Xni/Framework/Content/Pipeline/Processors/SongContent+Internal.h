//
//  SongContent+Internal.h
//  XNI
//
//  Created by Matej Jan on 18.1.11.
//  Copyright 2011 Retronator. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SongContent (Internal)

- (id) initWithFileName:(NSString*)fileName;

@property (nonatomic, readonly) NSURL *url;

@end
