//
//  BasicMaterialContent.h
//  XNI
//
//  Created by Matej Jan on 22.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Retronator.Xni.Framework.classes.h"

#import "MaterialContent.h"

@interface BasicMaterialContent : MaterialContent {
	
}

@property (nonatomic, readonly) NSString *alphaKey;
@property (nonatomic, readonly) NSString *diffuseColorKey;
@property (nonatomic, readonly) NSString *emissiveColorKey;
@property (nonatomic, readonly) NSString *specularColorKey;
@property (nonatomic, readonly) NSString *specularPowerKey;
@property (nonatomic, readonly) NSString *textureKey;
@property (nonatomic, readonly) NSString *vertexColorEnabledKey;

@property (nonatomic, retain) NSNumber *alpha;
@property (nonatomic, retain) Vector3 *diffuseColor;
@property (nonatomic, retain) Vector3 *emissiveColor;
@property (nonatomic, retain) Vector3 *specularColor;
@property (nonatomic, retain) NSNumber *specularPower;
@property (nonatomic, retain) ExternalReference *texture;
@property (nonatomic, retain) NSNumber *vertexColorEnabled;

@end
