//
//  GameTime.h
//  XNI
//
//  Created by Matej Jan on 27.7.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface GameTime : NSObject {
    NSTimeInterval elapsedGameTime;
    NSTimeInterval totalGameTime;
    BOOL isRunningSlowly;
}

- (id) initWithElapsedGameTime:(NSTimeInterval)theElapsedGameTime totalGameTime:(NSTimeInterval)theTotalGameTime;
- (id) initWithElapsedGameTime:(NSTimeInterval)theElapsedGameTime totalGameTime:(NSTimeInterval)theTotalGameTime isRunningSlowly:(BOOL)runningSlowly;

+ (GameTime*) gameTime;
+ (GameTime*) gameTimeWithElapsedGameTime:(NSTimeInterval)theElapsedGameTime totalGameTime:(NSTimeInterval)theTotalGameTime;
+ (GameTime*) gameTimeWithElapsedGameTime:(NSTimeInterval)theElapsedGameTime totalGameTime:(NSTimeInterval)theTotalGameTime isRunningSlowly:(BOOL)runningSlowly;

@property (nonatomic) NSTimeInterval elapsedGameTime;
@property (nonatomic) NSTimeInterval totalGameTime;
@property (nonatomic) BOOL isRunningSlowly;

@end
