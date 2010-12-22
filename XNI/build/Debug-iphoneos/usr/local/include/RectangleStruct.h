typedef struct {
	int x;
	int y;
	int width;
	int height;
} RectangleStruct;

static inline RectangleStruct RectangleMake(int x, int y, int width, int height) {
	RectangleStruct rectangle;
	rectangle.x = x;
	rectangle.y = y;
	rectangle.width = width;
	rectangle.height = height;
	return rectangle;
}

static inline void RectangleSet(RectangleStruct *rectangle, int x, int y, int width, int height) {
	rectangle->x = x;
	rectangle->y = y;
	rectangle->width = width;
	rectangle->height = height;
}