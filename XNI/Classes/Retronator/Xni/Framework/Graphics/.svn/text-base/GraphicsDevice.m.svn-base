//
//  GraphicsDevice.m
//  XNI
//
//  Created by Matej Jan on 27.7.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "GraphicsDevice.h"
#import "GraphicsDevice+Internal.h"
#import <OpenGLES/ES1/gl.h>

#import "Retronator.Xni.Framework.h"
#import "Retronator.Xni.Framework.Graphics.h"

#import "XniSamplerEventArgs.h"
#import "TextureCollection+Internal.h"
#import "SamplerStateCollection+Internal.h"
#import "IndexBuffer+Internal.h"
#import "VertexBuffer+Internal.h"

@interface GraphicsDevice()

+ (void) getFormat:(GLenum*)format AndType:(GLenum*)type ForSurfaceFormat:(SurfaceFormat)surfaceFormat;
- (void) setData:(void*)data size:(int)sizeInBytes toBufferId:(uint)buffer resourceType:(ResourceType)resourceType bufferUsage:(BufferUsage)bufferUsage; 

@end

@implementation GraphicsDevice

- (id) initWithGame:(Game*)theGame
{
	if (self = [super init])
	{
        game = theGame;
        multisampling = NO;
		
        // Create an OpenGL ES context
		context = [self createContext];
        
        if (!context || ![EAGLContext setCurrentContext:context]) {
            [self release];
            return nil;
        }
		
		if (multisampling) {
			// Create resolve framebuffer object.
			glGenFramebuffers(1, &resolveFramebuffer);
			glBindFramebuffer(GL_FRAMEBUFFER, resolveFramebuffer);
			
			// Create resolve color buffer.
			glGenRenderbuffers(1, &resolveRenderbuffer);
			glBindRenderbuffer(GL_RENDERBUFFER, resolveRenderbuffer);
			glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_RENDERBUFFER, resolveRenderbuffer);
		}
		
		// Create default framebuffer object.
		glGenFramebuffers(1, &defaultFramebuffer);
		glBindFramebuffer(GL_FRAMEBUFFER, defaultFramebuffer);
		
		// Create the color buffer.
		glGenRenderbuffers(1, &colorRenderbuffer);
		glBindRenderbuffer(GL_RENDERBUFFER, colorRenderbuffer);
		glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_RENDERBUFFER, colorRenderbuffer);
		
		// Create the depth buffer.
		glGenRenderbuffers(1, &depthRenderbuffer);
		glBindRenderbuffer(GL_RENDERBUFFER, depthRenderbuffer);
		glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_DEPTH_ATTACHMENT, GL_RENDERBUFFER, depthRenderbuffer);
		
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
		self.rasterizerState = [RasterizerState cullCounterClockwise];
		self.referenceStencil = 0;
		[samplerStates setItem:[SamplerState linearClamp] atIndex:0];
		
		// Create events.
        deviceResetting = [[Event alloc] init];
        deviceReset = [[Event alloc] init];
		
		vertices = [[NSMutableArray alloc] init];
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
		
		// Apply fill mode.
		
		// Apply cull mode.
		if (value.cullMode == CullModeNone) {
			glDisable(GL_CULL_FACE);
		} else {
			glEnable(GL_CULL_FACE);
			glFrontFace(value.cullMode);
		}
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
    
	if (multisampling) {
		// Allocate resolve buffer backing based on the current layer size.
		glBindFramebuffer(GL_FRAMEBUFFER, resolveFramebuffer);
		glBindRenderbuffer(GL_RENDERBUFFER, resolveRenderbuffer);
		[context renderbufferStorage:GL_RENDERBUFFER fromDrawable:layer];
		glGetRenderbufferParameteriv(GL_RENDERBUFFER, GL_RENDERBUFFER_WIDTH, &backingWidth);
		glGetRenderbufferParameteriv(GL_RENDERBUFFER, GL_RENDERBUFFER_HEIGHT, &backingHeight);
		
		if (glCheckFramebufferStatus(GL_FRAMEBUFFER) != GL_FRAMEBUFFER_COMPLETE){
			NSLog(@"Failed to make complete framebuffer object %x.", glCheckFramebufferStatus(GL_FRAMEBUFFER));
		} else {
			NSLog(@"Created a resolve buffer with dimensions: %ix%i.", backingWidth, backingHeight);
		}
		
		// Allocate multisampling buffers based on resolve buffer.
		
		// Create default framebuffer object.
		glBindFramebuffer(GL_FRAMEBUFFER, defaultFramebuffer);
		
		// Create the color buffer.
		glBindRenderbuffer(GL_RENDERBUFFER, colorRenderbuffer);
		glRenderbufferStorageMultisampleAPPLE(GL_RENDERBUFFER, 4, GL_RGBA8_OES, backingWidth, backingHeight);	
		
		// Create the depth buffer.
		glBindRenderbuffer(GL_RENDERBUFFER, depthRenderbuffer);
		glRenderbufferStorageMultisampleAPPLE(GL_RENDERBUFFER, 4, GL_DEPTH_COMPONENT16, backingWidth, backingHeight);
		
		if (glCheckFramebufferStatus(GL_FRAMEBUFFER) != GL_FRAMEBUFFER_COMPLETE){
			NSLog(@"Failed to make complete framebuffer object %x.", glCheckFramebufferStatus(GL_FRAMEBUFFER));
		} else {
			NSLog(@"Created a multisample render target with dimensions: %ix%i.", backingWidth, backingHeight);
		}
	} else {
		// Allocate render buffer backing based on the current layer size.
		glBindRenderbuffer(GL_RENDERBUFFER, colorRenderbuffer);
		[context renderbufferStorage:GL_RENDERBUFFER fromDrawable:layer];
		glGetRenderbufferParameteriv(GL_RENDERBUFFER, GL_RENDERBUFFER_WIDTH, &backingWidth);
		glGetRenderbufferParameteriv(GL_RENDERBUFFER, GL_RENDERBUFFER_HEIGHT, &backingHeight);
		
		glBindRenderbuffer(GL_RENDERBUFFER, depthRenderbuffer);
		glRenderbufferStorage(GL_RENDERBUFFER, GL_DEPTH_COMPONENT16, backingWidth, backingHeight);

		if (glCheckFramebufferStatus(GL_FRAMEBUFFER) != GL_FRAMEBUFFER_COMPLETE){
			NSLog(@"Failed to make complete framebuffer object %x.", glCheckFramebufferStatus(GL_FRAMEBUFFER));
		} else {
			NSLog(@"Created a device with dimensions: %ix%i.", backingWidth, backingHeight);
		}		
	}
	
	// Set viewport.
	glViewport(0, 0, backingWidth, backingHeight);
	self.viewport.x = 0;
	self.viewport.y = 0;
	self.viewport.width = backingWidth;
	self.viewport.height = backingHeight;
	
	// Set state defaults.
	glEnable(GL_BLEND);
	
	[deviceReset raiseWithSender:self];
}

- (void) present {
	if (multisampling) {
		// Resolve the rendering into the resolve buffer.
		glBindFramebuffer(GL_DRAW_FRAMEBUFFER_APPLE, resolveFramebuffer);
		glBindFramebuffer(GL_READ_FRAMEBUFFER_APPLE, defaultFramebuffer);
		glResolveMultisampleFramebufferAPPLE();
		
		const GLenum discards[]  = {GL_COLOR_ATTACHMENT0,GL_DEPTH_ATTACHMENT};
		glDiscardFramebufferEXT(GL_READ_FRAMEBUFFER_APPLE,2,discards);

	    glBindRenderbuffer(GL_RENDERBUFFER, resolveRenderbuffer);
		[context presentRenderbuffer:GL_RENDERBUFFER];		

		glBindFramebuffer(GL_FRAMEBUFFER, defaultFramebuffer);
	} else {
	    glBindRenderbuffer(GL_RENDERBUFFER, colorRenderbuffer);
		[context presentRenderbuffer:GL_RENDERBUFFER];			
	}
}

// Render buffers

- (void) clearWithColor:(Color *)color {
    [self clearWithOptions:ClearOptionsTarget | ClearOptionsDepthBuffer color:color depth:1 stencil:0];
}

- (void) clearWithOptions:(ClearOptions)options color:(Color *)color depth:(float)depth stencil:(int)stencil {
	glDepthMask(GL_TRUE);	
	if (color) {
		glClearColor(color.r / 255.0, color.g / 255.0, color.b / 255.0, color.a / 255.0);
    }
	glClearDepthf(depth);
    glClearStencil(stencil);
	glClear(options);  
	glDepthMask(depthStencilState.depthBufferWriteEnable);
}

// Vertex buffers
- (NSArray*) getVertexBuffers {
	return [NSArray arrayWithArray:vertices];
}

- (void) setVertexBuffer:(VertexBuffer*)vertexBuffer {
	VertexBufferBinding *binding = [[VertexBufferBinding alloc] initWithVertexBuffer:vertexBuffer];
	if ([vertices count]>0) {
		[vertices replaceObjectAtIndex:0 withObject:binding];
	} else {
		[vertices addObject:binding];
	}
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

- (uint) createBuffer {
	GLuint bufferId;
    glGenBuffers(1, &bufferId);
    return bufferId;
}

- (void) setData:(void*)data toIndexBuffer:(IndexBuffer*)buffer {
	int sizeInBytes = buffer.indexElementSize * buffer.indexCount;
	[self setData:data size:sizeInBytes toBufferId:buffer.bufferID resourceType:ResourceTypeIndexBuffer bufferUsage:buffer.bufferUsage];
}

- (void) setData:(void*)data toVertexBuffer:(VertexBuffer*)buffer {
	int sizeInBytes = buffer.vertexDeclaration.vertexStride * buffer.vertexCount;
	[self setData:data size:sizeInBytes toBufferId:buffer.bufferID resourceType:ResourceTypeVertexBuffer bufferUsage:buffer.bufferUsage];
}

- (void) setData:(void *)data 
			size:(int)sizeInBytes 
	  toBufferId:(uint)buffer
	resourceType:(ResourceType)resourceType 
	 bufferUsage:(BufferUsage)bufferUsage
{
    glBindBuffer(resourceType, buffer);
    glBufferData(resourceType, sizeInBytes, data, bufferUsage);
    glBindBuffer(resourceType, 0);
}


// Profile specific

- (EAGLContext*) createContext { return nil; }

- (void) drawPrimitivesOfType:(PrimitiveType)primitiveType 
				  startVertex:(int)startVertex 
			   primitiveCount:(int)primitiveCount {}

- (void) drawIndexedPrimitivesOfType:(PrimitiveType)primitiveType 
						  baseVertex:(int)baseVertex 
					  minVertexIndex:(int)minVertexIndex
						 numVertices:(int)numVertices
						  startIndex:(int)startIndex
					  primitiveCount:(int)primitiveCount {}

- (void) drawUserPrimitivesOfType:(PrimitiveType)primitiveType
					   vertexData:(VertexArray*)vertexData
					 vertexOffset:(int)vertexOffset 
				   primitiveCount:(int)primitiveCount {}

- (void) drawUserPrimitivesOfType:(PrimitiveType)primitiveType
					   vertexData:(void*)vertexData 
					 vertexOffset:(int)vertexOffset 
				   primitiveCount:(int)primitiveCount
				vertexDeclaration:(VertexDeclaration*) vertexDeclaration {}

- (void) drawUserIndexedPrimitivesOfType:(PrimitiveType)primitiveType 
							  vertexData:(VertexArray*)vertexData
							vertexOffset:(int)vertexOffset
							 numVertices:(int)numVertices
							   indexData:(IndexArray*)indexData
							 indexOffset:(int)indexOffset
						  primitiveCount:(int)primitiveCount {}

- (void) drawUserIndexedPrimitivesOfType:(PrimitiveType)primitiveType 
							  vertexData:(void*)vertexData
							vertexOffset:(int)vertexOffset
							 numVertices:(int)numVertices
						  shortIndexData:(void*)indexData
							 indexOffset:(int)indexOffset
						  primitiveCount:(int)primitiveCount
					   vertexDeclaration:(VertexDeclaration*) vertexDeclaration {}
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
	[vertices release];
	[super dealloc];
}



@end
