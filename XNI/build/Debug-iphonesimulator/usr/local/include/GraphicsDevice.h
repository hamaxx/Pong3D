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
	
	// The pixel dimensions of the CAEAGLLayer
	GLint backingWidth;
	GLint backingHeight;
	
	// The OpenGL names for the buffers used to render to this view
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
- (void) drawPrimitivesOfType:(PrimitiveType)primitiveType startingAt:(int)startVertex count:(int)primitiveCount;

- (void) drawIndexedPrimitivesOfType:(PrimitiveType)primitiveType offsetVerticesBy:(int)baseVertex 
                          startingAt:(int)startIndex count:(int)primitiveCount;

- (void) drawUserPrimitivesOfType:(PrimitiveType)primitiveType vertices:(VertexArray*)vertexData
                       startingAt:(int)vertexOffset count:(int)primitiveCount;

- (void) drawUserPrimitivesOfType:(PrimitiveType)primitiveType
						 vertices:(void*)vertexData ofType:(VertexDeclaration*) vertexDeclaration
                       startingAt:(int)vertexOffset count:(int)primitiveCount;

- (void) drawUserIndexedPrimitivesOfType:(PrimitiveType)primitiveType 
								vertices:(void*)vertexData ofType:(VertexDeclaration*) vertexDeclaration 
                        offsetVerticesBy:(int)vertexOffset indices:(void*)indexData dataType:(DataType)dataType
                              startingAt:(int)indexOffset count:(int)primitiveCount;


// Low level methods
- (uint) createTexture;

//- (void) getData:(void*)data fromTexture2D:(Texture2D*)texture level:(int)level;

- (void) setData:(void*)data toTexture2D:(Texture2D*)texture SourceRectangle:(Rectangle*)rect level:(int)level;

// Profile specific
- (EAGLContext*) createContext;

@end
