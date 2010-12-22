#import "MatrixStruct.h"

typedef struct {
	float x;
	float y;
	float z;
} Vector3Struct;

static inline Vector3Struct Vector3Make(float x, float y, float z)
{
	Vector3Struct vector;
	vector.x = x;
	vector.y = y;
	vector.z = z;
	return vector;
}

static inline void Vector3Set(Vector3Struct *vector, float x, float y, float z)
{
    vector->x = x;
    vector->y = y;
    vector->z = z;
}

static inline float Vector3LengthSquared(Vector3Struct *value) {
    return value->x * value->x + value->y * value->y + value->z * value->z;
}

static inline float Vector3Length(Vector3Struct *value) {
    return sqrtf(Vector3LengthSquared(value));
}

static inline void Vector3Normalize(Vector3Struct *value) {
    float length = Vector3Length(value);
    if (length == 0) {
        return;
    }
    float scalar = 1.0f / length;
    value->x *= scalar;
    value->y *= scalar;
    value->z *= scalar;
}

static inline void Vector3Negate(Vector3Struct *value) {
    value->x = -value->x;
    value->y = -value->y;
    value->z = -value->z;
}

static inline void Vector3Add(Vector3Struct *value1, Vector3Struct *value2, Vector3Struct *result) {
    Vector3Set(result, value1->x + value2->x, value1->y + value2->y, value1->z + value2->z);
}

static inline void Vector3Subtract(Vector3Struct *value1, Vector3Struct *value2, Vector3Struct *result) {
    Vector3Set(result, value1->x - value2->x, value1->y - value2->y, value1->z - value2->z);
}

static inline void Vector3Multiply(Vector3Struct *value1, float scaleFactor, Vector3Struct *result) {
    Vector3Set(result, value1->x * scaleFactor, value1->y * scaleFactor, value1->z * scaleFactor);
}

static inline void Vector3CrossProduct(Vector3Struct *value1, Vector3Struct *value2, Vector3Struct *result) {
    Vector3Set(result,
               value1->y * value2->z - value1->z * value2->y,
               value1->z * value2->x - value1->x * value2->z,
               value1->x * value2->y - value1->y * value2->x);
}

static inline float Vector3DotProduct(Vector3Struct *value1, Vector3Struct *value2) {
    return value1->x * value2->x + value1->y * value2->y + value1->z * value2->z;
}

static inline void Vector3Transform(Vector3Struct *value, MatrixStruct *matrix, Vector3Struct *result) {
    Vector3Set(result,
               (value->x * matrix->m11) + (value->y * matrix->m21) + (value->z * matrix->m31) + matrix->m41,
               (value->x * matrix->m12) + (value->y * matrix->m22) + (value->z * matrix->m32) + matrix->m42,
               (value->x * matrix->m13) + (value->y * matrix->m23) + (value->z * matrix->m33) + matrix->m43);
}

static inline void Vector3TransformNormal(Vector3Struct *value, MatrixStruct *matrix, Vector3Struct *result) {
    Vector3Set(result,
               (value->x * matrix->m11) + (value->y * matrix->m21) + (value->z * matrix->m31),
               (value->x * matrix->m12) + (value->y * matrix->m22) + (value->z * matrix->m32),
               (value->x * matrix->m13) + (value->y * matrix->m23) + (value->z * matrix->m33));
}