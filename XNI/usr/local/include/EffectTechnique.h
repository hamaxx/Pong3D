//
//  EffectTechnique.h
//  XNI
//
//  Created by Matej Jan on 21.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EffectTechnique : NSObject {
    NSArray *passes;
    NSString *name;
}

- (id) initWithName:(NSString*)theName passes:(NSArray*)thePasses;

@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSArray *passes;

@end
