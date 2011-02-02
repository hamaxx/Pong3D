typedef struct {
	int x;
	int y;
} PointStruct;

static inline PointStruct PointMake(int x, int y) {
	PointStruct point;
	point.x = x;
	point.y = y;
	return point;
}

static inline void PointSet(PointStruct *point, int x, int y) {
	point->x = x;
	point->y = y;
}