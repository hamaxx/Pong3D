//
//  ModelMesh.m
//  XNI
//
//  Created by Matej Jan on 22.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "ModelMesh.h"
#import "ModelMesh+Internal.h"

#import "Retronator.Xni.Framework.Graphics.h"

@implementation ModelMesh

- (id) initWithName:(NSString *)theName parentBone:(ModelBone*)theParentBone modelMeshParts:(NSArray *)theModelMeshParts tag:(id)theTag
{
	self = [super init];
	if (self != nil) {
		name = [[NSString alloc] initWithString:theName];
		parentBone = [theParentBone retain];
		meshParts = [[ModelMeshPartCollection alloc] initWithItems:theModelMeshParts];
		self.tag = theTag;
		
		NSMutableArray *partEffects = [NSMutableArray arrayWithCapacity:meshParts.count];
		for (ModelMeshPart *part in meshParts) {
			[partEffects addObject:part.effect];			
		}
		effects = [[ModelEffectCollection alloc] initWithItems:partEffects];
	}
	return self;
}

@synthesize name, parentBone, meshParts, effects, tag;

- (void) draw {
	
	
	for (ModelMeshPart *part in meshParts) {
		GraphicsDevice *graphicsDevice = part.effect.graphicsDevice;
		
		[graphicsDevice setVertexBuffer:part.vertexBuffer];
		graphicsDevice.indices = part.indexBuffer;
		
		for (EffectPass *pass in part.effect.currentTechnique.passes) {
			[pass apply];
			
			[graphicsDevice drawIndexedPrimitivesOfType:PrimitiveTypeTriangleList 
											 baseVertex:part.vertexOffset
										 minVertexIndex:0 
											numVertices:part.numVertices 
											 startIndex:part.startIndex 
										 primitiveCount:part.primitiveCount];
		}
	}
}

- (void) dealloc
{
	[name release];
	[parentBone release];
	[meshParts release];
	[effects release];
	[tag release];
	[super dealloc];
}

@end
