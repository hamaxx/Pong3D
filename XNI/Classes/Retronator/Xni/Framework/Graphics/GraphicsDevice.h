//
//  GraphicsDevice.h
//  XNI
//
//  Created by Matej Jan on 27.7.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import <OpenGLES/ES1/glext.h>
#import <OpenGLES/ES2/glext.h>

#import "System.classes.h"
#import "Retronator.Xni.Framework.classes.h"
#import "Retronator.Xni.Framework.Graphics.classes.h"

@interface GraphicsDevice : NSObject {
    Game *game;
	EAGLContext *context;
	
	// Presentation parameters
	BOOL multisampling;
	
	// The pixel dimensions of the CAEAGLLayer
	GLint backingWidth;
	GLint backingHeight;
	
	// The OpenGL names for the buffers used to render to this view
	GLuint resolveFramebuffer, resolveRenderbuffer;
	GLuint defaultFramebuffer, colorRenderbuffer, depthRenderbuffer;
	
	// Device state
	Color *blendFactor;
	BlendState *blendState;
	DepthStencilState *depthStencilState;
	GraphicsDeviceStatus graphicsDeviceStatus;
	IndexBuffer *indices;
	RasterizerState *rasterizerState;
	int referenceStencil;
	SamplerStateCollection *samplerStates;
	TextureCollection *textures;
	Viewport *viewport;
	
	// Events
	Event *deviceResetting;
    Event *deviceReset;
	
	NSMutableArray *vertices;
}

- (id) initWithGame:(Game*) theGame;

@property (nonatomic, retain) Color *blendFactor;
@property (nonatomic, retain) BlendState *blendState;
@property (nonatomic, retain) DepthStencilState *depthStencilState;
@property (nonatomic, readonly) GraphicsDeviceStatus graphicsDeviceStatus;
@property (nonatomic, readonly) GraphicsProfile graphicsProfile;
@property (nonatomic, retain) IndexBuffer *indices;
@property (nonatomic, retain) RasterizerState *rasterizerState;
@property (nonatomic) int referenceStencil;
@property (nonatomic, readonly) SamplerStateCollection *samplerStates;
@property (nonatomic, readonly) TextureCollection *textures;
@property (nonatomic, retain) Viewport *viewport;

@property (nonatomic, readonly) Event *deviceResetting;
@property (nonatomic, readonly) Event *deviceReset;

+ (int) getNumberOfVerticesForPrimitiveType:(PrimitiveType)primitiveType primitiveCount:(int)primitiveCount;

// Presentation
- (void) reset;
- (void) present;

// Render buffers
- (void) clearWithColor:(Color*)color;
- (void) clearWithOptions:(ClearOptions)options color:(Color*)color depth:(float)depth stencil:(int)stencil;

// Vertex buffers
- (NSArray*) getVertexBuffers;
- (void) setVertexBuffer:(VertexBuffer*)vertexBuffer;
- (void) setVertexBuffer:(VertexBuffer*)vertexBuffer vertexOffset:(int)vertexOffset;
- (void) setVertexBuffers:(VertexBufferBinding*)vertexBuffer, ... NS_REQUIRES_NIL_TERMINATION;

// Drawing

// From buffers
- (void) drawPrimitivesOfType:(PrimitiveType)primitiveType 
				  startVertex:(int)startVertex 
			   primitiveCount:(int)primitiveCount;

- (void) drawIndexedPrimitivesOfType:(PrimitiveType)primitiveType 
						  baseVertex:(int)baseVertex 
					  minVertexIndex:(int)minVertexIndex
						 numVertices:(int)numVertices
						  startIndex:(int)startIndex
					  primitiveCount:(int)primitiveCount;

// From arrays
- (void) drawUserPrimitivesOfType:(PrimitiveType)primitiveType
					   vertexData:(VertexArray*)vertexData
					 vertexOffset:(int)vertexOffset 
				   primitiveCount:(int)primitiveCount;

- (void) drawUserPrimitivesOfType:(PrimitiveType)primitiveType
					   vertexData:(void*)vertexData 
					 vertexOffset:(int)vertexOffset 
				   primitiveCount:(int)primitiveCount
				vertexDeclaration:(VertexDeclaration*) vertexDeclaration;

- (void) drawUserIndexedPrimitivesOfType:(PrimitiveType)primitiveType 
							  vertexData:(VertexArray*)vertexData
							vertexOffset:(int)vertexOffset
							 numVertices:(int)numVertices
							   indexData:(IndexArray*)indexData
							 indexOffset:(int)indexOffset
						  primitiveCount:(int)primitiveCount;

- (void) drawUserIndexedPrimitivesOfType:(PrimitiveType)primitiveType 
							  vertexData:(void*)vertexData
							vertexOffset:(int)vertexOffset
							 numVertices:(int)numVertices
						  shortIndexData:(void*)indexData
							 indexOffset:(int)indexOffset
						  primitiveCount:(int)primitiveCount
					   vertexDeclaration:(VertexDeclaration*) vertexDeclaration;

@end
