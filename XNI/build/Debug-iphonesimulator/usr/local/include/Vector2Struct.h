#import "MatrixStruct.h"

typedef struct {
	float x;
	float y;
} Vector2Struct;

static inline Vector2Struct Vector2Make(float x, float y)
{
	Vector2Struct vector;
	vector.x = x;
	vector.y = y;
	return vector;
}

static inline void Vector2Set(Vector2Struct *vector, float x, float y)
{
    vector->x = x;
    vector->y = y;
}

static inline float Vector2LengthSquared(Vector2Struct *value) {
    return value->x * value->x + value->y * value->y;
}

static inline float Vector2Length(Vector2Struct *value) {
    return sqrtf(Vector2LengthSquared(value));
}

static inline void Vector2Normalize(Vector2Struct *value) {
    float scalar = 1.0f / Vector2Length(value);
    value->x *= scalar;
    value->y *= scalar;
}

static inline void Vector2Negate(Vector2Struct *value) {
    value->x = -value->x;
    value->y = -value->y;
}

static inline void Vector2Add(Vector2Struct *value1, Vector2Struct *value2, Vector2Struct *result) {
    Vector2Set(result, value1->x + value2->x, value1->y + value2->y);
}

static inline void Vector2Subtract(Vector2Struct *value1, Vector2Struct *value2, Vector2Struct *result) {
    Vector2Set(result, value1->x - value2->x, value1->y - value2->y);
}

static inline void Vector2Multiply(Vector2Struct *value1, float scaleFactor, Vector2Struct *result) {
    Vector2Set(result, value1->x * scaleFactor, value1->y * scaleFactor);
}

static inline float Vector2DotProduct(Vector2Struct *value1, Vector2Struct *value2) {
    return value1->x * value2->x + value1->y * value2->y;
}

static inline void Vector2Transform(Vector2Struct *value, MatrixStruct *matrix, Vector2Struct *result) {
    Vector2Set(result,
               (value->x * matrix->m11) + (value->y * matrix->m21) + matrix->m41,
               (value->x * matrix->m12) + (value->y * matrix->m22) + matrix->m42);
}

static inline void Vector2TransformNormal(Vector2Struct *value, MatrixStruct *matrix, Vector2Struct *result) {
    Vector2Set(result,
               (value->x * matrix->m11) + (value->y * matrix->m21),
               (value->x * matrix->m12) + (value->y * matrix->m22));
}