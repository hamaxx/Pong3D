//
//  IContentProcessor.h
//  XNI
//
//  Created by Matej Jan on 22.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol IContentProcessor

@property (nonatomic, readonly) Class inputType;
@property (nonatomic, readonly) Class outputType;

- (id) process:(id)input;

@end
