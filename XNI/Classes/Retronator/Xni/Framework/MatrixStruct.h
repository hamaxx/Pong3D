typedef struct {
	float m11;
    float m12;
    float m13;
    float m14;
    float m21;
    float m22;
    float m23;
    float m24;
    float m31;
    float m32;
    float m33;
    float m34;
    float m41;
    float m42;
    float m43;
    float m44;
} MatrixStruct;

static inline MatrixStruct MatrixMake(float m11, float m12, float m13, float m14, float m21, float m22, float m23, float m24, 
									float m31, float m32, float m33, float m34, float m41, float m42, float m43, float m44) {
    MatrixStruct matrix;
    matrix.m11 = m11;
    matrix.m12 = m12;
    matrix.m13 = m13;
    matrix.m14 = m14;
    matrix.m21 = m21;
    matrix.m22 = m22;
    matrix.m23 = m23;
    matrix.m24 = m24;
    matrix.m31 = m31;
    matrix.m32 = m32;
    matrix.m33 = m33;
    matrix.m34 = m34;
    matrix.m41 = m41;
    matrix.m42 = m42;
    matrix.m43 = m43;
    matrix.m44 = m44;
    return matrix;
}

static inline float MatrixDeterminant(MatrixStruct *value) {
    float det1 = value->m11 * value->m22 - value->m12 * value->m21;
    float det2 = value->m11 * value->m23 - value->m13 * value->m21;
    float det3 = value->m11 * value->m24 - value->m14 * value->m21;
    float det4 = value->m12 * value->m23 - value->m13 * value->m22;
    float det5 = value->m12 * value->m24 - value->m14 * value->m22;
    float det6 = value->m13 * value->m24 - value->m14 * value->m23;
    float det7 = value->m31 * value->m42 - value->m32 * value->m41;
    float det8 = value->m31 * value->m43 - value->m33 * value->m41;
    float det9 = value->m31 * value->m44 - value->m34 * value->m41;
    float det10 = value->m32 * value->m43 - value->m33 * value->m42;
    float det11 = value->m32 * value->m44 - value->m34 * value->m42;
    float det12 = value->m33 * value->m44 - value->m34 * value->m43;
    return det1*det12 - det2*det11 + det3*det10 + det4*det9 - det5*det8 + det6*det7;
}

static inline void MatrixNegate(MatrixStruct *value) {
	value->m11 = -value->m11;
	value->m12 = -value->m12;
	value->m13 = -value->m13;
	value->m14 = -value->m14;
	value->m21 = -value->m21;
	value->m22 = -value->m22;
	value->m23 = -value->m23;
	value->m24 = -value->m24;
	value->m31 = -value->m31;
	value->m32 = -value->m32;
	value->m33 = -value->m33;
	value->m34 = -value->m34;
	value->m41 = -value->m41;
	value->m42 = -value->m42;
	value->m43 = -value->m43;
	value->m44 = -value->m44;
}

static inline void MatrixTranspose(MatrixStruct *value) {
    MatrixStruct matrix = *value;
    value->m11 = matrix.m11;
    value->m12 = matrix.m21;
    value->m13 = matrix.m31;
    value->m14 = matrix.m41;
    value->m21 = matrix.m12;
    value->m22 = matrix.m22;
    value->m23 = matrix.m32;
    value->m24 = matrix.m42;
    value->m31 = matrix.m13;
    value->m32 = matrix.m23;
    value->m33 = matrix.m33;
    value->m34 = matrix.m43;
    value->m41 = matrix.m14;
    value->m42 = matrix.m24;
    value->m43 = matrix.m34;
    value->m44 = matrix.m44;
}

static inline void MatrixInvert(MatrixStruct *value) {
    MatrixStruct matrix = *value;
    float det1 = matrix.m11 * matrix.m22 - matrix.m12 * matrix.m21;
    float det2 = matrix.m11 * matrix.m23 - matrix.m13 * matrix.m21;
    float det3 = matrix.m11 * matrix.m24 - matrix.m14 * matrix.m21;
    float det4 = matrix.m12 * matrix.m23 - matrix.m13 * matrix.m22;
    float det5 = matrix.m12 * matrix.m24 - matrix.m14 * matrix.m22;
    float det6 = matrix.m13 * matrix.m24 - matrix.m14 * matrix.m23;
    float det7 = matrix.m31 * matrix.m42 - matrix.m32 * matrix.m41;
    float det8 = matrix.m31 * matrix.m43 - matrix.m33 * matrix.m41;
    float det9 = matrix.m31 * matrix.m44 - matrix.m34 * matrix.m41;
    float det10 = matrix.m32 * matrix.m43 - matrix.m33 * matrix.m42;
    float det11 = matrix.m32 * matrix.m44 - matrix.m34 * matrix.m42;
    float det12 = matrix.m33 * matrix.m44 - matrix.m34 * matrix.m43;
    
    float detMatrix = (float)(det1*det12 - det2*det11 + det3*det10 + det4*det9 - det5*det8 + det6*det7);
    float invDetMatrix = 1.0f / detMatrix;
    
    value->m11 = (matrix.m22*det12 - matrix.m23*det11 + matrix.m24*det10) * invDetMatrix;
    value->m12 = (-matrix.m12*det12 + matrix.m13*det11 - matrix.m14*det10) * invDetMatrix;
    value->m13 = (matrix.m42*det6 - matrix.m43*det5 + matrix.m44*det4) * invDetMatrix;
    value->m14 = (-matrix.m32*det6 + matrix.m33*det5 - matrix.m34*det4) * invDetMatrix;
    value->m21 = (-matrix.m21*det12 + matrix.m23*det9 - matrix.m24*det8) * invDetMatrix;
    value->m22 = (matrix.m11*det12 - matrix.m13*det9 + matrix.m14*det8) * invDetMatrix;
    value->m23 = (-matrix.m41*det6 + matrix.m43*det3 - matrix.m44*det2) * invDetMatrix;
    value->m24 = (matrix.m31*det6 - matrix.m33*det3 + matrix.m34*det2) * invDetMatrix;
    value->m31 = (matrix.m21*det11 - matrix.m22*det9 + matrix.m24*det7) * invDetMatrix;
    value->m32 = (-matrix.m11*det11 + matrix.m12*det9 - matrix.m14*det7) * invDetMatrix;
    value->m33 = (matrix.m41*det5 - matrix.m42*det3 + matrix.m44*det1) * invDetMatrix;
    value->m34 = (-matrix.m31*det5 + matrix.m32*det3 - matrix.m34*det1) * invDetMatrix;
    value->m41 = (-matrix.m21*det10 + matrix.m22*det8 - matrix.m23*det7) * invDetMatrix;
    value->m42 = (matrix.m11*det10 - matrix.m12*det8 + matrix.m13*det7) * invDetMatrix;
    value->m43 = (-matrix.m41*det4 + matrix.m42*det2 - matrix.m43*det1) * invDetMatrix;
    value->m44 = (matrix.m31*det4 - matrix.m32*det2 + matrix.m33*det1) * invDetMatrix;
}

static inline void MatrixAdd(MatrixStruct *value1, MatrixStruct *value2, MatrixStruct *result) {
	result->m11 = value1->m11 + value2->m11;
	result->m12 = value1->m12 + value2->m12;
	result->m13 = value1->m13 + value2->m13;
	result->m14 = value1->m14 + value2->m14;
	result->m21 = value1->m21 + value2->m21;
	result->m22 = value1->m22 + value2->m22;
	result->m23 = value1->m23 + value2->m23;
	result->m24 = value1->m24 + value2->m24;
	result->m31 = value1->m31 + value2->m31;
	result->m32 = value1->m32 + value2->m32;
	result->m33 = value1->m33 + value2->m33;
	result->m34 = value1->m34 + value2->m34;
	result->m41 = value1->m41 + value2->m41;
	result->m42 = value1->m42 + value2->m42;
	result->m43 = value1->m43 + value2->m43;
	result->m44 = value1->m44 + value2->m44;
}

static inline void MatrixSubtract(MatrixStruct *value1, MatrixStruct *value2, MatrixStruct *result) {
	result->m11 = value1->m11 - value2->m11;
	result->m12 = value1->m12 - value2->m12;
	result->m13 = value1->m13 - value2->m13;
	result->m14 = value1->m14 - value2->m14;
	result->m21 = value1->m21 - value2->m21;
	result->m22 = value1->m22 - value2->m22;
	result->m23 = value1->m23 - value2->m23;
	result->m24 = value1->m24 - value2->m24;
	result->m31 = value1->m31 - value2->m31;
	result->m32 = value1->m32 - value2->m32;
	result->m33 = value1->m33 - value2->m33;
	result->m34 = value1->m34 - value2->m34;
	result->m41 = value1->m41 - value2->m41;
	result->m42 = value1->m42 - value2->m42;
	result->m43 = value1->m43 - value2->m43;
	result->m44 = value1->m44 - value2->m44;
}

static inline void MatrixMultiplyScalar(MatrixStruct *value1, float scaleFactor, MatrixStruct *result) {
	result->m11 = value1->m11 * scaleFactor;
	result->m12 = value1->m12 * scaleFactor;
	result->m13 = value1->m13 * scaleFactor;
	result->m14 = value1->m14 * scaleFactor;
	result->m21 = value1->m21 * scaleFactor;
	result->m22 = value1->m22 * scaleFactor;
	result->m23 = value1->m23 * scaleFactor;
	result->m24 = value1->m24 * scaleFactor;
	result->m31 = value1->m31 * scaleFactor;
	result->m32 = value1->m32 * scaleFactor;
	result->m33 = value1->m33 * scaleFactor;
	result->m34 = value1->m34 * scaleFactor;
	result->m41 = value1->m41 * scaleFactor;
	result->m42 = value1->m42 * scaleFactor;
	result->m43 = value1->m43 * scaleFactor;
	result->m44 = value1->m44 * scaleFactor;
}

static inline void MatrixMultiply(MatrixStruct *value1, MatrixStruct *value2, MatrixStruct *result) {
    float m11 = value1->m11 * value2->m11 + value1->m12 * value2->m21 + value1->m13 * value2->m31 + value1->m14 * value2->m41;
    float m12 = value1->m11 * value2->m12 + value1->m12 * value2->m22 + value1->m13 * value2->m32 + value1->m14 * value2->m42;
    float m13 = value1->m11 * value2->m13 + value1->m12 * value2->m23 + value1->m13 * value2->m33 + value1->m14 * value2->m43;
    float m14 = value1->m11 * value2->m14 + value1->m12 * value2->m24 + value1->m13 * value2->m34 + value1->m14 * value2->m44;
    float m21 = value1->m21 * value2->m11 + value1->m22 * value2->m21 + value1->m23 * value2->m31 + value1->m24 * value2->m41;
    float m22 = value1->m21 * value2->m12 + value1->m22 * value2->m22 + value1->m23 * value2->m32 + value1->m24 * value2->m42;
    float m23 = value1->m21 * value2->m13 + value1->m22 * value2->m23 + value1->m23 * value2->m33 + value1->m24 * value2->m43;
    float m24 = value1->m21 * value2->m14 + value1->m22 * value2->m24 + value1->m23 * value2->m34 + value1->m24 * value2->m44;
    float m31 = value1->m31 * value2->m11 + value1->m32 * value2->m21 + value1->m33 * value2->m31 + value1->m34 * value2->m41;
    float m32 = value1->m31 * value2->m12 + value1->m32 * value2->m22 + value1->m33 * value2->m32 + value1->m34 * value2->m42;
    float m33 = value1->m31 * value2->m13 + value1->m32 * value2->m23 + value1->m33 * value2->m33 + value1->m34 * value2->m43;
    float m34 = value1->m31 * value2->m14 + value1->m32 * value2->m24 + value1->m33 * value2->m34 + value1->m34 * value2->m44;
    float m41 = value1->m41 * value2->m11 + value1->m42 * value2->m21 + value1->m43 * value2->m31 + value1->m44 * value2->m41;
    float m42 = value1->m41 * value2->m12 + value1->m42 * value2->m22 + value1->m43 * value2->m32 + value1->m44 * value2->m42;
    float m43 = value1->m41 * value2->m13 + value1->m42 * value2->m23 + value1->m43 * value2->m33 + value1->m44 * value2->m43;
    float m44 = value1->m41 * value2->m14 + value1->m42 * value2->m24 + value1->m43 * value2->m34 + value1->m44 * value2->m44;     
    result->m11 = m11;
    result->m12 = m12;
    result->m13 = m13;
    result->m14 = m14;
    result->m21 = m21;
    result->m22 = m22;
    result->m23 = m23;
    result->m24 = m24;
    result->m31 = m31;
    result->m32 = m32;
    result->m33 = m33;
    result->m34 = m34;
    result->m41 = m41;
    result->m42 = m42;
    result->m43 = m43;
    result->m44 = m44;
}

static inline void MatrixDivideScalar(MatrixStruct *value1, float divider, MatrixStruct *result) {
	result->m11 = value1->m11 / divider;
	result->m12 = value1->m12 / divider;
	result->m13 = value1->m13 / divider;
	result->m14 = value1->m14 / divider;
	result->m21 = value1->m21 / divider;
	result->m22 = value1->m22 / divider;
	result->m23 = value1->m23 / divider;
	result->m24 = value1->m24 / divider;
	result->m31 = value1->m31 / divider;
	result->m32 = value1->m32 / divider;
	result->m33 = value1->m33 / divider;
	result->m34 = value1->m34 / divider;
	result->m41 = value1->m41 / divider;
	result->m42 = value1->m42 / divider;
	result->m43 = value1->m43 / divider;
	result->m44 = value1->m44 / divider;
}

static inline void MatrixDivide(MatrixStruct *value1, MatrixStruct *value2, MatrixStruct *result) {
	result->m11 = value1->m11 / value2->m11;
	result->m12 = value1->m12 / value2->m12;
	result->m13 = value1->m13 / value2->m13;
	result->m14 = value1->m14 / value2->m14;
	result->m21 = value1->m21 / value2->m21;
	result->m22 = value1->m22 / value2->m22;
	result->m23 = value1->m23 / value2->m23;
	result->m24 = value1->m24 / value2->m24;
	result->m31 = value1->m31 / value2->m31;
	result->m32 = value1->m32 / value2->m32;
	result->m33 = value1->m33 / value2->m33;
	result->m34 = value1->m34 / value2->m34;
	result->m41 = value1->m41 / value2->m41;
	result->m42 = value1->m42 / value2->m42;
	result->m43 = value1->m43 / value2->m43;
	result->m44 = value1->m44 / value2->m44;
}