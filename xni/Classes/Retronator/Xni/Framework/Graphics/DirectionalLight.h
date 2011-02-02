//
//  DirectionalLight.h
//  XNI
//
//  Created by Matej Jan on 21.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Retronator.Xni.Framework.classes.h"

@interface DirectionalLight : NSObject {
    Vector3 *diffuseColor;
    Vector3 *direction;
    BOOL enabled;
    Vector3 *specularColor;
}

@property (nonatomic, retain) Vector3 *diffuseColor;
@property (nonatomic, retain) Vector3 *direction;
@property (nonatomic) BOOL enabled;
@property (nonatomic, retain) Vector3 *specularColor;

@end
