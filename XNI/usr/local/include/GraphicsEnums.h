#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES2/gl.h>

typedef enum {
	BlendZero = GL_ZERO,
	BlendOne = GL_ONE,
	BlendSourceColor = GL_SRC_COLOR,
	BlendInverseSourceColor = GL_ONE_MINUS_SRC_COLOR,
	BlendSourceAlpha = GL_SRC_ALPHA,
	BlendInverseSourceAlpha = GL_ONE_MINUS_SRC_ALPHA,
	BlendDestinationAlpha = GL_DST_ALPHA,
	BlendInverseDestinationAlpha = GL_ONE_MINUS_DST_ALPHA,
	BlendDestinationColor = GL_DST_COLOR,
	BlendInverseDestinationColor = GL_ONE_MINUS_DST_COLOR,
	BlendSourceAlphaSaturation = GL_SRC_ALPHA_SATURATE,
	BlendBlendFactor,
	BlendInverseBlendFactor
} Blend;

typedef enum {
	BlendFunctionAdd,
	BlendFunctionMax,
	BlendFunctionMin,
	BlendFunctionReverseSubstract,
	BlendFunctionSubtract
} BlendFunction;

typedef enum {
	BufferUsageNone = GL_DYNAMIC_DRAW,
	BufferUsageWriteOnly = GL_STATIC_DRAW
} BufferUsage;

typedef enum {
    ClearOptionsDepthBuffer = GL_DEPTH_BUFFER_BIT,
    ClearOptionsStencil = GL_STENCIL_BUFFER_BIT,
    ClearOptionsTarget = GL_COLOR_BUFFER_BIT
} ClearOptions;

typedef enum {
	ColorWriteChannelsAll,
	ColorWriteChannelsAlpha,
	ColorWriteChannelsBlue,
	ColorWriteChannelsGreen,
	ColorWriteChannelsNone,
	ColorWriteChannelsRed
} ColorWriteChannels;

typedef enum {
    CompareFunctionAlways = GL_ALWAYS,
    CompareFunctionEqual = GL_EQUAL,
    CompareFunctionGreater = GL_GREATER,
    CompareFunctionGreaterEqual = GL_GEQUAL,
    CompareFunctionLess = GL_LESS,
    CompareFunctionLessEqual = GL_LEQUAL,
    CompareFunctionNever = GL_NEVER,
    CompareFunctionNotEqual = GL_NOTEQUAL
} CompareFunction;

typedef enum {
	CubeMapFaceNegativeX,
	CubeMapFaceNegativeY,
	CubeMapFaceNegativeZ,
	CubeMapFacePositiveX,
	CubeMapFacePositiveY,
	CubeMapFacePositiveZ
} CubeMapFace;

typedef enum {
	// The opengl values correspond to which face is front facing, which is opposite of culled
	CullModeNone,
	CullModeCullClockwiseFace = GL_CCW,
	CullModeCullCounterClockwiseFace = GL_CW
} CullMode;

typedef enum {
    DataTypeUnsignedByte = GL_UNSIGNED_BYTE,
    DataTypeByte = GL_BYTE,
    DataTypeUnsignedShort = GL_UNSIGNED_SHORT,
    DataTypeShort = GL_SHORT,
    DataTypeFixed = GL_FIXED,
    DataTypeFloat = GL_FLOAT
} DataType;

typedef enum {
    DepthFormatNone,
    DepthFormatDepth16,
    DepthFormatDepth24,
    DepthFormatDepth24Stencil8	
} DepthFormat;

typedef enum {
	FillModeSolid,
	FillModeWireFrame
} FillMode;

typedef enum {
	GraphicsDeviceStatusLost,
	GraphicsDeviceStatusNormal,
	GraphicsDeviceStatusNotReset
} GraphicsDeviceStatus;

typedef enum {
	GraphicsProfileReach,
	GraphicsProfileHiDef
} GraphicsProfile;

typedef enum {
	IndexElementSizeSixteenBits = 2,
	//IndexElementSizeThrityTwoBits = 4,
} IndexElementSize;

typedef enum {
	PresentIntervalDefault,
	PresentIntervalOne,
	PresentIntervalTwo,
	PresentIntervalImmediate
} PresentInterval;

typedef enum {
    PrimitiveTypeLineList = GL_LINES,
    PrimitiveTypeLineStrip = GL_LINE_STRIP,
    PrimitiveTypeTriangleList = GL_TRIANGLES,
    PrimitiveTypeTriangleStrip = GL_TRIANGLE_STRIP,
} PrimitiveType;

typedef enum {
	RenderTargetUsageDiscardContents,
	RenderTargetUsagePlatformContents,
	RenderTargetUsagePreserveContents
} RenderTargetUsage;

typedef enum {
    ResourceTypeTexture2D = GL_TEXTURE_2D,
    ResourceTypeIndexBuffer = GL_ELEMENT_ARRAY_BUFFER,
    ResourceTypeVertexBuffer = GL_ARRAY_BUFFER
} ResourceType;

typedef enum {
	SetDataOptionsDiscard,
	SetDataOptionsNone,
	SetDataOptionsNoOverwrite
} SetDataOptions;

typedef enum {
	SpriteEffectsFlipHorizontally = 2,
	SpriteEffectsFlipVertically = 1,
	SpriteEffectsNone = 0
} SpriteEffects;

typedef enum {
	SpriteSortModeBackToFront,
	SpriteSortModeDeffered,
	SpriteSortModeFrontToBack,
	SpriteSortModeImmediate,
	SpriteSortModeTexture
} SpriteSortMode;

typedef enum {
	StencilOperationDecrement,
	StencilOperationDecrementSaturation,
	StencilOperationIncrement,
	StencilOperationIncrementSaturation,
	StencilOperationInvert,
	StencilOperationKeep,
	StencilOperationReplace,
	StencilOperationZero
} StencilOperation;

typedef enum {
    SurfaceFormatColor,
    SurfaceFormatRgb565,
    SurfaceFormatRgba5551,
    SurfaceFormatRgba4444,
    //SurfaceFormatDxt1,
    //SurfaceFormatDxt3,
    //SurfaceFormatDxt5,
    //SurfaceFormatNormalizedByte2,
    //SurfaceFormatNormalizedByte4,
    //SurfaceFormatRgba1010102,
    //SurfaceFormatRg32,
    //SurfaceFormatRgba64,
    SurfaceFormatAlpha8,
    //SurfaceFormatSingle,
    //SurfaceFormatVector2,
    //SurfaceFormatVector4,
    //SurfaceFormatHalfSingle,
    //SurfaceFormatHalfVector2,
    //SurfaceFormatHalfVector4,
    //SurfaceFormatHdrBlendable	
} SurfaceFormat;

typedef enum {
	TextureAddressModeClamp = GL_CLAMP_TO_EDGE,
	TextureAddressModeMirror = GL_MIRRORED_REPEAT,
	TextureAddressModeWrap = GL_REPEAT
} TextureAddressMode;

typedef enum {
	TextureFilterLinear,
	TextureFilterPoint,
	TextureFilterAnisotropic,
	TextureFilterLinearMipPoint,
	TextureFilterPointMipLinear,
	TextureFilterMinLinearMagPointMipLinear,
	TextureFilterMinLinearMagPointMipPoint,
	TextureFilterMinPointMagLinearMipLinear,
	TextureFilterMinPointMagLinearMipPoint
} TextureFilter;

typedef enum {
    VertexElementFormatSingle,
    VertexElementFormatVector2,
    VertexElementFormatVector3,
    VertexElementFormatVector4,
    VertexElementFormatHalfVector2,
    VertexElementFormatHalfVector4,
    VertexElementFormatColor,
    VertexElementFormatNormalizedShort2,
    VertexElementFormatNormalizedShort4,
    VertexElementFormatShort2,
    VertexElementFormatShort4,
    VertexElementFormatByte4
} VertexElementFormat;

typedef enum {
    VertexElementUsagePosition = GL_VERTEX_ARRAY,
    VertexElementUsageNormal = GL_NORMAL_ARRAY,
    VertexElementUsageColor = GL_COLOR_ARRAY,
    VertexElementUsageTextureCoordinate = GL_TEXTURE_COORD_ARRAY,
    VertexElementUsagePointSize = GL_POINT_SIZE_ARRAY_OES,
	VertexElementUsageBinormal,
	VertexElementUsageBlendIndices,
	VertexElementUsageBlendWeight,
	VertexElementUsageDepth,
	VertexElementUsageFog,
	VertexElementUsageSample,
	VertexElementUsageTangent,
	VertexElementUsageTessellateFactor
} VertexElementUsage;
