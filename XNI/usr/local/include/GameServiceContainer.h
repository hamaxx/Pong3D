//
//  GameServiceContainer.h
//  XNI
//
//  Created by Matej Jan on 27.7.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "System.h"

@interface GameServiceContainer : NSObject <IServiceProvider> {
    CFMutableDictionaryRef services;
}

- (void)addService:(id)provider ofType:(id)type;
- (void)removeServiceOfType:(id)type;

@end
