//
//  BasicMaterialContent.m
//  XNI
//
//  Created by Matej Jan on 22.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "BasicMaterialContent.h"

#import "Retronator.Xni.Framework.h"
#import "Retronator.Xni.Framework.Content.Pipeline.h"

@implementation BasicMaterialContent

- (NSString *) alphaKey {
	return @"BasicMaterialAlpha";
}

- (NSString *) diffuseColorKey {
	return @"BasicMaterialDiffuseColor";
}

- (NSString *) emissiveColorKey {
	return @"BasicMaterialEmissiveColor";
}

- (NSString *) specularColorKey {
	return @"BasicMaterialSpecularColor";
}

- (NSString *) specularPowerKey {
	return @"BasicMaterialSpecularPower";
}

- (NSString *) textureKey {
	return @"BasicMaterialTexture";
}

- (NSString *) vertexColorEnabledKey {
	return @"BasicMaterialVertexColorEnabled";
}


- (NSNumber *) alpha {
	return [opaqueData itemForKey:self.alphaKey];
}

- (void) setAlpha:(NSNumber *)value {
	[opaqueData set:value forKey:self.alphaKey];
}

- (Vector3 *) diffuseColor {
	return [opaqueData itemForKey:self.diffuseColorKey];
}

- (void) setDiffuseColor:(Vector3 *)value {
	[opaqueData set:value forKey:self.diffuseColorKey];
}

- (Vector3 *) emissiveColor {
	return [opaqueData itemForKey:self.emissiveColorKey];
}

- (void) setEmissiveColor:(Vector3 *)value {
	[opaqueData set:value forKey:self.emissiveColorKey];
}

- (Vector3 *) specularColor {
	return [opaqueData itemForKey:self.specularColorKey];
}

- (void) setSpecularColor:(Vector3 *)value {
	[opaqueData set:value forKey:self.specularColorKey];
}

- (NSNumber *) specularPower {
	return [opaqueData itemForKey:self.specularPowerKey];
}

- (void) setSpecularPower:(NSNumber *)value {
	[opaqueData set:value forKey:self.specularPowerKey];
}

- (ExternalReference *) texture {
	return [opaqueData itemForKey:self.textureKey];
}

- (void) setTexture:(ExternalReference *)value {
	[opaqueData set:value forKey:self.textureKey];
}

- (NSNumber *) vertexColorEnabled {
	return [opaqueData itemForKey:self.vertexColorEnabledKey];
}

- (void) setVertexColorEnabled:(NSNumber *)value {
	[opaqueData set:value forKey:self.vertexColorEnabledKey];
}

@end
