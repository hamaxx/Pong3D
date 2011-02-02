//
//  SoundEffectContent+Internal.h
//  XNI
//
//  Created by Matej Jan on 15.12.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SoundEffectContent (Internal)

- (id) initWithData:(NSData*)theData format:(AudioFormat*)theFormat;

@property (nonatomic, readonly) NSData *data;
@property (nonatomic, readonly) AudioFormat *format;

@end
