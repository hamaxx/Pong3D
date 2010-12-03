//
//  BasicEffect.m
//  XNI
//
//  Created by Matej Jan on 21.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "BasicEffect.h"

#import "Retronator.Xni.Framework.h"
#import "Retronator.Xni.Framework.Graphics.h"

@interface BasicEffectPass : EffectPass {
    BasicEffect *basicEffect;	
}

- (id) initWithBasicEffect:(BasicEffect*)theBasicEffect graphicsDevice:(GraphicsDevice*)theGraphicsDevice;

@end

@implementation BasicEffect

-(id) initWithGraphicsDevice:(GraphicsDevice *)theGraphicsDevice {
    if (self = [super initWithGraphicsDevice:theGraphicsDevice]) {
        // Create the main pass.
        BasicEffectPass *mainPass = [[BasicEffectPass alloc] initWithBasicEffect:self graphicsDevice:graphicsDevice];
        NSArray *passes = [NSArray arrayWithObject:mainPass];
        
        // Create the basic technique.
        EffectTechnique *basicTechnique = [[EffectTechnique alloc] initWithName:@"BasicEffect" passes:passes];
        
        techniques = [NSDictionary dictionaryWithObject:basicTechnique forKey:basicTechnique.name];
        currentTechnique = basicTechnique;
        
        // Set defaults.
        self.alpha = 1;
        self.ambientColor = [Vector3 zero];
        self.diffuseColor = [Vector3 zero];
        self.emissiveColor = [Vector3 zero];
        self.specularColor = [Vector3 zero];
        self.specularPower = 0;
        self.vertexColorEnabled = NO;
        
        self.textureEnabled = NO;
        self.texture = nil;
        
        self.lightingEnabled = NO;
        self.ambientLightColor = [Vector3 zero];
        directionalLight0 = [[DirectionalLight alloc] init];
        directionalLight1 = [[DirectionalLight alloc] init];
        directionalLight2 = [[DirectionalLight alloc] init];
        
        self.fogEnabled = NO;
        self.fogColor = [Vector3 zero];
        self.fogStart = 0;
        self.fogEnd = 1;
        
        self.projection = [Matrix identity];
        self.view = [Matrix identity];
        self.world = [Matrix identity];
    }
    return self;
}

@synthesize alpha;
@synthesize ambientColor;
@synthesize diffuseColor;
@synthesize emissiveColor;
@synthesize specularColor;
@synthesize specularPower;
@synthesize vertexColorEnabled;

@synthesize textureEnabled;
@synthesize texture;

@synthesize lightingEnabled;
@synthesize ambientLightColor;
@synthesize directionalLight0;
@synthesize directionalLight1;
@synthesize directionalLight2;    

@synthesize fogEnabled;
@synthesize fogColor;
@synthesize fogStart;
@synthesize fogEnd;

@synthesize projection;
@synthesize view;
@synthesize world;

- (void) dealloc
{
	[ambientColor release];
	[diffuseColor release];
	[emissiveColor release];
	[specularColor release];
	[texture release];
	[ambientLightColor release];
    [directionalLight0 release];
    [directionalLight1 release];
    [directionalLight2 release];
	[fogColor release];
	[world release];
	[view release];
	[projection release];
    [super dealloc];
}

@end


@interface BasicEffectPass()

- (void) activateLight:(DirectionalLight*) light name:(uint)name;

@end

@implementation BasicEffectPass

- (id) initWithBasicEffect:(BasicEffect *)theBasicEffect graphicsDevice:(GraphicsDevice*)theGraphicsDevice {
    if (self = [super initWithName:@"BasicEffectPass" graphicsDevice:theGraphicsDevice]) {
        basicEffect = theBasicEffect;
    }
    return self;
}

- (void) apply {    
    // Set material.
    Vector4Struct data;
    Vector4Set(&data, basicEffect.ambientColor.x, basicEffect.ambientColor.y, basicEffect.ambientColor.z, basicEffect.alpha);
    glMaterialfv(GL_FRONT_AND_BACK, GL_AMBIENT, (float*)&data);
    
    Vector4Set(&data, basicEffect.diffuseColor.x, basicEffect.diffuseColor.y, basicEffect.diffuseColor.z, basicEffect.alpha);
    glMaterialfv(GL_FRONT_AND_BACK, GL_DIFFUSE, (float*)&data);
    
    Vector4Set(&data, basicEffect.specularColor.x, basicEffect.specularColor.y, basicEffect.specularColor.z, 1);
    glMaterialfv(GL_FRONT_AND_BACK, GL_SPECULAR, (float*)&data);
    glMaterialf(GL_FRONT_AND_BACK, GL_SHININESS, basicEffect.specularPower);
    
    Vector4Set(&data, basicEffect.emissiveColor.x, basicEffect.emissiveColor.y, basicEffect.emissiveColor.z, 1);
    glMaterialfv(GL_FRONT_AND_BACK, GL_EMISSION, (float*)&data);
    
    if (basicEffect.vertexColorEnabled) {
        glEnable(GL_COLOR_MATERIAL);
    } else {
        glDisable(GL_COLOR_MATERIAL);
    }
    
    // Set texturing.
    if (basicEffect.textureEnabled) {
		[graphicsDevice.textures setItem:basicEffect.texture atIndex:0];	
		glActiveTexture(GL_TEXTURE0);
        glEnable(GL_TEXTURE_2D);
    } else {
        glDisable(GL_TEXTURE_2D);
    }
    
    // Set the projection matrix.
    glMatrixMode(GL_PROJECTION);
    glLoadMatrixf((float*)basicEffect.projection.data);
    
    // Set the model-view matrix.
    glMatrixMode(GL_MODELVIEW);
    // Multiply in reverse order, because our matrices assume vector transformation b = a * M,
    // while openGL will tranform b = M * a. So v_projectionspace = M_modelview * v_modelspace,
    // and our model-view matrix therefore should be view * world.
    glLoadMatrixf((float*)basicEffect.view.data);
    
    // Set lighting now that we're in view coordinates.
    if (basicEffect.lightingEnabled) {
        glEnable(GL_LIGHTING);
    } else {
        glDisable(GL_LIGHTING);
    }
    Vector4Set(&data, basicEffect.ambientLightColor.x, basicEffect.ambientLightColor.y, basicEffect.ambientLightColor.z, 1);
    glLightModelfv(GL_LIGHT_MODEL_AMBIENT, (float*)&data);
    [self activateLight:basicEffect.directionalLight0 name:GL_LIGHT0];
    [self activateLight:basicEffect.directionalLight1 name:GL_LIGHT1];
    [self activateLight:basicEffect.directionalLight2 name:GL_LIGHT2];
    
    // Finally add the world component of the model-view matrix.
    glMultMatrixf((float*)basicEffect.world.data);  
}

- (void) activateLight:(DirectionalLight *)light name:(uint)lightName {
    if (light.enabled) {
        glEnable(lightName);
    } else {
        glDisable(lightName);
        return;
    }
    
    Vector4Struct data;
    Vector4Set(&data, light.ambientColor.x, light.ambientColor.y, light.ambientColor.z, 1);    
    glLightfv(lightName, GL_AMBIENT, (float*)&data);
    Vector4Set(&data, light.diffuseColor.x, light.diffuseColor.y, light.diffuseColor.z, 1);    
    glLightfv(lightName, GL_DIFFUSE, (float*)&data);
    Vector4Set(&data, light.specularColor.x, light.specularColor.y, light.specularColor.z, 1);
    glLightfv(lightName, GL_SPECULAR, (float*)&data);    
    Vector4Set(&data, light.direction.x, light.direction.y, light.direction.z, 0);
    glLightfv(lightName, GL_POSITION, (float*)&data);    
}



@end