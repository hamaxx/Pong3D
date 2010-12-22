typedef struct {
	float x;
	float y;
	float z;
    float w;
} Vector4Struct;

static inline Vector4Struct Vector4Make(float x, float y, float z, float w)
{
	Vector4Struct vector;
	vector.x = x;
	vector.y = y;
	vector.z = z;
    vector.w = w;
	return vector;
}

static inline void Vector4Set(Vector4Struct *vector, float x, float y, float z, float w)
{
    vector->x = x;
    vector->y = y;
    vector->z = z;
    vector->w = w;
}


static inline float Vector4LengthSquared(Vector4Struct *value) {
    return value->x * value->x + value->y * value->y + value->z * value->z + value->w * value->w;
}

static inline float Vector4Length(Vector4Struct *value) {
    return sqrtf(Vector4LengthSquared(value));
}

static inline void Vector4Normalize(Vector4Struct *value) {
    float length = Vector4Length(value);
    if (length == 0) {
        return;
    }
    float scalar = 1.0f / length;
    value->x *= scalar;
    value->y *= scalar;
    value->z *= scalar;
    value->w *= scalar;
}

static inline void Vector4Negate(Vector4Struct *value) {
    value->x = -value->x;
    value->y = -value->y;
    value->z = -value->z;
    value->w = -value->w;
}

static inline void QuaternionInverse(Vector4Struct *value) {
    float m1 = 1.0F / ((value->x * value->x) + (value->y * value->y) + (value->z * value->z) + (value->w * value->w));
    Vector4Set(value, -value->x * m1, -value->y * m1, -value->z * m1, value->w * m1);
}

static inline void Vector4Add(Vector4Struct *value1, Vector4Struct *value2, Vector4Struct *result) {
    Vector4Set(result, value1->x + value2->x, value1->y + value2->y, value1->z + value2->z, value1->w + value2->w);
}

static inline void Vector4Subtract(Vector4Struct *value1, Vector4Struct *value2, Vector4Struct *result) {
    Vector4Set(result, value1->x - value2->x, value1->y - value2->y, value1->z - value2->z, value1->w - value2->w);
}

static inline void Vector4Multiply(Vector4Struct *value1, float scaleFactor, Vector4Struct *result) {
    Vector4Set(result, value1->x * scaleFactor, value1->y * scaleFactor, value1->z * scaleFactor, value1->w * scaleFactor);
}

static inline void QuaternionMultiply(Vector4Struct *value1, Vector4Struct *value2, Vector4Struct *result) {
    float f12 = (value1->y * value2->z) - (value1->z * value2->y);
    float f11 = (value1->z * value2->x) - (value1->x * value2->z);
    float f10 = (value1->x * value2->y) - (value1->y * value2->x);
    float f9 = (value1->x * value2->x) + (value1->y * value2->y) + (value1->z * value2->z);
    result->x = (value1->x * value2->w) + (value2->x * value1->w) + f12;
    result->y = (value1->y * value2->w) + (value2->y * value1->w) + f11;
    result->z = (value1->z * value2->w) + (value2->z * value1->w) + f10;
    result->w = (value1->w * value2->w) - f9;
}

static inline void Vector4Transform(Vector4Struct *value, MatrixStruct *matrix, Vector4Struct *result) {
    Vector4Set(result,
               (value->x * matrix->m11) + (value->y * matrix->m21) + (value->z * matrix->m31) + (value->w * matrix->m41),
               (value->x * matrix->m12) + (value->y * matrix->m22) + (value->z * matrix->m32) + (value->w * matrix->m42),
               (value->x * matrix->m13) + (value->y * matrix->m23) + (value->z * matrix->m33) + (value->w * matrix->m43),
			   (value->x * matrix->m14) + (value->y * matrix->m24) + (value->z * matrix->m34) + (value->w * matrix->m44));
}
