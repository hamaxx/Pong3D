//
//  Effect.h
//  XNI
//
//  Created by Matej Jan on 16.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GraphicsResource.h"

@interface Effect : GraphicsResource {
    EffectTechnique *currentTechnique;
    NSDictionary *techniques;
}

@property (nonatomic, retain) EffectTechnique *currentTechnique;
@property (nonatomic, readonly) NSDictionary *techniques;

@end