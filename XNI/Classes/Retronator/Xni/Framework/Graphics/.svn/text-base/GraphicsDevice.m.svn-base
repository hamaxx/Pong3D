//
//  GraphicsDevice.m
//  XNI
//
//  Created by Matej Jan on 27.7.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "GraphicsDevice.h"
#import <OpenGLES/ES1/gl.h>

#import "Retronator.Xni.Framework.h"
#import "Retronator.Xni.Framework.Graphics.h"

#import "XniSamplerEventArgs.h"
#import "TextureCollection+Internal.h"
#import "SamplerStateCollection+Internal.h"

@interface GraphicsDevice()

+ (void) getFormat:(GLenum*)format AndType:(GLenum*)type ForSurfaceFormat:(SurfaceFormat)surfaceFormat;

@end

@implementation GraphicsDevice

- (id) initWithGame:(Game*)theGame
{
	if (self = [super init])
	{
        game = theGame;
        
        // Create an OpenGL ES context
		context = [self createContext];
        
        if (!context || ![EAGLContext setCurrentContext:context]) {
            [self release];
            return nil;
        }
        
		// Create default framebuffer object.
		glGenFramebuffersOES(1, &defaultFramebuffer);
		glBindFramebufferOES(GL_FRAMEBUFFER_OES, defaultFramebuffer);
        
        // Create the color buffer.
       	glGenRenderbuffersOES(1, &colorRenderbuffer);
		glBindRenderbufferOES(GL_RENDERBUFFER_OES, colorRenderbuffer);
		glFramebufferRenderbufferOES(GL_FRAMEBUFFER_OES, GL_COLOR_ATTACHMENT0_OES, GL_RENDERBUFFER_OES, colorRenderbuffer);
        
        // Create the depth buffer.
        glGenRenderbuffersOES(1, &depthRenderbuffer);
        glBindRenderbufferOES(GL_RENDERBUFFER_OES, depthRenderbuffer);
        glFramebufferRenderbufferOES(GL_FRAMEBUFFER_OES, GL_DEPTH_ATTACHMENT_OES, GL_RENDERBUFFER_OES, depthRenderbuffer);
		
		// Create sampler states and texture collections and handle changes.
		samplerStates = [[SamplerStateCollection alloc] init];
		textures = [[TextureCollection alloc] init];
		[samplerStates.samplerStateChanged subscribeDelegate:[Delegate delegateWithTarget:self 
																				   Method:@selector(applySamplerState:eventArgs:)]];
		[textures.textureChanged subscribeDelegate:[Delegate delegateWithTarget:self 
																		 Method:@selector(applySamplerState:eventArgs:)]];
		
        // Do the initial reset.
		viewport = [[Viewport alloc] init];
        [self reset];
		
		// Initialize defaults.
		self.blendFactor = [Color white];
		self.blendState = [BlendState opaque];
		self.depthStencilState = [DepthStencilState defaultDepth];
		graphicsDeviceStatus = GraphicsDeviceStatusNormal;
		self.indices = nil;
		self.rasterizerState = [RasterizerState cullClockwise];
		self.referenceStencil = 0;
		[samplerStates setItem:[SamplerState linearClamp] atIndex:0];
		
		// Create events.
        deviceResetting = [[Event alloc] init];
        deviceReset = [[Event alloc] init];
	}
	
	return self;
}

#define FLAG_BLOCK(variable, parameter) if (variable) { glEnable(parameter); } else { glDisable(parameter);}

@synthesize blendFactor;
@synthesize blendState;
- (void) setBlendState:(BlendState*)value {
	if (value != blendState) {
		[value retain];
		[blendState release];
		blendState = value;
		
		// Apply the blend state.
		glBlendFunc(blendState.colorSourceBlend, blendState.colorDestinationBlend);
		
	}
}

@synthesize depthStencilState;
- (void) setDepthStencilState:(DepthStencilState*)value {
	if (value != depthStencilState) {
		[value retain];
		[depthStencilState release];
		depthStencilState = value;
		
		// Apply depth state.
		FLAG_BLOCK(depthStencilState.depthBufferEnable, GL_DEPTH_TEST)
		glDepthFunc(depthStencilState.depthBufferFunction);
		glDepthMask(depthStencilState.depthBufferWriteEnable);
		glDepthRangef(0, 1);
		
		// TODO: Apply stencil state.
	}
}

@synthesize graphicsDeviceStatus;
@synthesize graphicsProfile;
@synthesize indices;
@synthesize rasterizerState;
- (void) setRasterizerState:(RasterizerState*)value {
	if (value != rasterizerState) {
		[value retain];
		[rasterizerState release];
		rasterizerState = value;
	}
}

@synthesize referenceStencil;
@synthesize samplerStates;
@synthesize textures;
@synthesize viewport;

+ (int) getNumberOfVerticesForPrimitiveType:(PrimitiveType)primitiveType primitiveCount:(int)primitiveCount {
    switch (primitiveType) {
        case PrimitiveTypeLineStrip:
			return primitiveCount + 1;
        case PrimitiveTypeLineList:
            return 2 * primitiveCount;
        case PrimitiveTypeTriangleStrip:
			return primitiveCount + 2;
        case PrimitiveTypeTriangleList:
            return 3 * primitiveCount;
        default:
            [NSException raise:@"NotImplementedException" 
                        format:@"The primitive type %i is not yet implemented.", primitiveType];
            return 0;
    }
}

@synthesize deviceReset;
@synthesize deviceResetting;

// Presentation
- (void) reset {
	[deviceResetting raiseWithSender:self];
	
    CAEAGLLayer *layer = (CAEAGLLayer*)game.window.handle;
    
	// Allocate color buffer backing based on the current layer size.
    glBindRenderbufferOES(GL_RENDERBUFFER_OES, colorRenderbuffer);
    [context renderbufferStorage:GL_RENDERBUFFER_OES fromDrawable:layer];
	glGetRenderbufferParameterivOES(GL_RENDERBUFFER_OES, GL_RENDERBUFFER_WIDTH_OES, &backingWidth);
    glGetRenderbufferParameterivOES(GL_RENDERBUFFER_OES, GL_RENDERBUFFER_HEIGHT_OES, &backingHeight);
    glViewport(0, 0, backingWidth, backingHeight);
	
	self.viewport.x = 0;
	self.viewport.y = 0;
	self.viewport.width = backingWidth;
	self.viewport.height = backingHeight;
	
    glBindRenderbufferOES(GL_RENDERBUFFER_OES, depthRenderbuffer);
    glRenderbufferStorageOES(GL_RENDERBUFFER_OES, GL_DEPTH_COMPONENT16_OES, backingWidth, backingHeight);
    
    if (glCheckFramebufferStatusOES(GL_FRAMEBUFFER_OES) != GL_FRAMEBUFFER_COMPLETE_OES){
		NSLog(@"Failed to make complete framebuffer object %x.", glCheckFramebufferStatusOES(GL_FRAMEBUFFER_OES));
    } else {
        NSLog(@"Created a device with dimensions: %ix%i.", backingWidth, backingHeight);
    }
	
	// Set state defaults.
	glEnable(GL_BLEND);
	
	[deviceReset raiseWithSender:self];
}

- (void) present {
    glBindRenderbufferOES(GL_RENDERBUFFER_OES, colorRenderbuffer);
    [context presentRenderbuffer:GL_RENDERBUFFER_OES];
}

// Render buffers

- (void) clearWithColor:(Color *)color {
    glClearColor(color.r / 255.0, color.g / 255.0, color.b / 255.0, color.a / 255.0);
    glClearDepthf(1);
    glClear(ClearOptionsTarget | ClearOptionsDepthBuffer);
}

- (void) clearWithOptions:(ClearOptions)options color:(Color *)color depth:(float)depth stencil:(int)stencil {
    glClearColor(color.r / 255.0, color.g / 255.0, color.b / 255.0, color.a / 255.0);
    glClearDepthf(depth);
    glClearStencil(stencil);
    glClear(options);    
}

// Vertex buffers
- (NSArray*) getVertexBuffers {
	return [[NSArray arrayWithArray:vertices] autorelease];
}

- (void) setVertexBuffer:(VertexBuffer*)vertexBuffer {
	VertexBufferBinding *binding = [[VertexBufferBinding alloc] initWithVertexBuffer:vertexBuffer];
	[vertices insertObject:binding atIndex:0];
	[binding release];
}

- (void) setVertexBuffer:(VertexBuffer*)vertexBuffer vertexOffset:(int)vertexOffset {
	VertexBufferBinding *binding = [[VertexBufferBinding alloc] initWithVertexBuffer:vertexBuffer vertexOffset:vertexOffset];
	[vertices insertObject:binding atIndex:0];
	[binding release];
}

- (void) setVertexBuffers:(VertexBufferBinding*)vertexBuffer, ... {
    if (vertexBuffer != nil) {
		va_list args;
		va_start(args, vertexBuffer);
		VertexBufferBinding *binding = vertexBuffer;
		for (int i = 0; binding; i++) {
			[vertices insertObject:binding atIndex:i];
			binding = va_arg(args, VertexBufferBinding*);
		}
		va_end(args);
    }
}

// Low level methods
- (uint) createTexture {
    GLuint textureId;
    glGenTextures(1, &textureId);
    return textureId;    
}

- (void) setData:(void*)data toTexture2D:(Texture2D*)texture SourceRectangle:(Rectangle*)rect level:(int)level {
	GLenum format, type;
	[GraphicsDevice getFormat:&format AndType:&type ForSurfaceFormat:texture.format];
	
    glBindTexture(GL_TEXTURE_2D, texture.textureId);	
    
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR); 
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);
	
	if (rect) {
		glTexSubImage2D(GL_TEXTURE_2D, level, rect.x, rect.y, rect.width, rect.height, format, type, data);
	} else {
		glTexImage2D(GL_TEXTURE_2D, level, format, texture.width, texture.height, 0, format, type, data);
    }
	
	glBindTexture(GL_TEXTURE_2D, 0);
}


// Profile specific

- (EAGLContext*) createContext { return nil; }

- (void) drawPrimitivesOfType:(PrimitiveType)primitiveType startingAt:(int)startVertex count:(int)primitiveCount {}

- (void) drawIndexedPrimitivesOfType:(PrimitiveType)primitiveType offsetVerticesBy:(int)baseVertex 
                          startingAt:(int)startIndex count:(int)primitiveCount {}

- (void) drawUserPrimitivesOfType:(PrimitiveType)primitiveType vertices:(VertexArray*)vertexData
                       startingAt:(int)vertexOffset count:(int)primitiveCount {}

- (void) drawUserPrimitivesOfType:(PrimitiveType)primitiveType
						 vertices:(void*)vertexData ofType:(VertexDeclaration*) vertexDeclaration
                       startingAt:(int)vertexOffset count:(int)primitiveCount {}

- (void) drawUserIndexedPrimitivesOfType:(PrimitiveType)primitiveType 
								vertices:(void*)vertexData ofType:(VertexDeclaration*) vertexDeclaration 
                        offsetVerticesBy:(int)vertexOffset indices:(void*)indexData dataType:(DataType)dataType
                              startingAt:(int)indexOffset count:(int)primitiveCount {}

// Private methods

+ (void) getFormat:(GLenum*)format AndType:(GLenum*)type ForSurfaceFormat:(SurfaceFormat)surfaceFormat {
	switch (surfaceFormat) {
		case SurfaceFormatColor:
			*format = GL_RGBA;
			*type = GL_UNSIGNED_BYTE;
			break;
		case SurfaceFormatAlpha8:
			*format = GL_ALPHA;
			*type = GL_UNSIGNED_BYTE;
			break;
		case SurfaceFormatRgb565:
			*format = GL_RGB;
			*type = GL_UNSIGNED_SHORT_5_6_5;
			break;
		case SurfaceFormatRgba4444:
			*format = GL_RGBA;
			*type = GL_UNSIGNED_SHORT_4_4_4_4;
			break;
		case SurfaceFormatRgba5551:
			*format = GL_RGBA;
			*type = GL_UNSIGNED_SHORT_5_5_5_1;
			break;
		default:
			break;
	}
}

- (void) applySamplerState:(id)sender eventArgs:(XniSamplerEventArgs*)e {
	glActiveTexture(e.samplerIndex);
	
	Texture *texture = [textures itemAtIndex:e.samplerIndex];
	
	if (texture) {
		glBindTexture(GL_TEXTURE_2D, texture.textureId);
	} else {
		glBindTexture(GL_TEXTURE_2D, 0);
	}

	SamplerState *samplerState = [samplerStates itemAtIndex:e.samplerIndex];
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, samplerState.addressU);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, samplerState.addressV);
	
	uint minFilter;
	uint magFilter;
	switch (samplerState.filter) {
		case TextureFilterPoint:
			minFilter = GL_NEAREST;
			magFilter = GL_NEAREST;
			break;
		case TextureFilterLinear:
		default:
			minFilter = GL_LINEAR;
			magFilter = GL_LINEAR;
			break;
		case TextureFilterPointMipLinear:
			minFilter = GL_NEAREST_MIPMAP_LINEAR;
			magFilter = GL_NEAREST_MIPMAP_LINEAR;
			break;
		case TextureFilterLinearMipPoint:
			minFilter = GL_LINEAR_MIPMAP_NEAREST;
			magFilter = GL_LINEAR_MIPMAP_NEAREST;
			break;
		case TextureFilterMinLinearMagPointMipLinear:
			minFilter = GL_LINEAR;
			magFilter = GL_NEAREST_MIPMAP_LINEAR;
			break;
		case TextureFilterMinLinearMagPointMipPoint:
			minFilter = GL_LINEAR_MIPMAP_NEAREST;
			magFilter = GL_NEAREST;
			break;
		case TextureFilterMinPointMagLinearMipLinear:
			minFilter = GL_NEAREST_MIPMAP_LINEAR;
			magFilter = GL_LINEAR;
			break;
		case TextureFilterMinPointMagLinearMipPoint:
			minFilter = GL_NEAREST;
			magFilter = GL_LINEAR_MIPMAP_NEAREST;
			break;
		case TextureFilterAnisotropic:
			// TODO: Have no idea yet how to do anisotropic.
			minFilter = GL_LINEAR;
			magFilter = GL_LINEAR;
			break;
	}
	
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, minFilter); 
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, magFilter);
}

- (void) dealloc
{
	[blendState release];
	[depthStencilState release];
	[rasterizerState release];
	[samplerStates release];
	[textures release];
	[viewport release];
    [deviceResetting release];
    [deviceReset release];	
	[super dealloc];
}



@end
