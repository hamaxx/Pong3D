#import "Retronator.Xni.Framework.classes.h"

typedef struct {
    Vector3Struct position;
    uint color;
} VertexPositionColorStruct;

typedef struct {
    Vector3Struct position;
    Vector2Struct texture;
} VertexPositionTextureStruct;

typedef struct {
    Vector3Struct position;
    Vector3Struct normal;
    Vector2Struct texture;
} VertexPositionNormalTextureStruct;

typedef struct {
    Vector3Struct position;
    uint color;
    float size;
} VertexPositionColorSizeStruct;

typedef struct {
    Vector3Struct position;
    uint color;
    Vector2Struct texture;
} VertexPositionColorTextureStruct;