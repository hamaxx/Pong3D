//
//  BasicEffect.h
//  XNI
//
//  Created by Matej Jan on 21.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Effect.h"

@interface BasicEffect : Effect {
    // Material
    float alpha;
    Vector3 *ambientColor;
    Vector3 *diffuseColor;
    Vector3 *emissiveColor;
    Vector3 *specularColor;
    float specularPower;
    BOOL vertexColorEnabled;
    
    // Texturing
    BOOL textureEnabled;
    Texture2D *texture;
    
    // Lighting
    BOOL lightingEnabled;
    Vector3 *ambientLightColor;
    DirectionalLight *directionalLight0;
    DirectionalLight *directionalLight1;
    DirectionalLight *directionalLight2;    
    
    // Fog
    BOOL fogEnabled;
    Vector3 *fogColor;
    float fogStart;
    float fogEnd;
    
    // Transformations
    Matrix *projection;
    Matrix *view;
    Matrix *world;
}

@property (nonatomic) float alpha;
@property (nonatomic, retain) Vector3 *ambientColor;
@property (nonatomic, retain) Vector3 *diffuseColor;
@property (nonatomic, retain) Vector3 *emissiveColor;
@property (nonatomic, retain) Vector3 *specularColor;
@property (nonatomic) float specularPower;
@property (nonatomic) BOOL vertexColorEnabled;

@property (nonatomic) BOOL textureEnabled;
@property (nonatomic, retain) Texture2D *texture;

@property (nonatomic) BOOL lightingEnabled;
@property (nonatomic, retain) Vector3 *ambientLightColor;
@property (nonatomic, readonly) DirectionalLight *directionalLight0;
@property (nonatomic, readonly) DirectionalLight *directionalLight1;
@property (nonatomic, readonly) DirectionalLight *directionalLight2;    

@property (nonatomic) BOOL fogEnabled;
@property (nonatomic, retain) Vector3 *fogColor;
@property (nonatomic) float fogStart;
@property (nonatomic) float fogEnd;

@property (nonatomic, retain) Matrix *projection;
@property (nonatomic, retain) Matrix *view;
@property (nonatomic, retain) Matrix *world;

@end
