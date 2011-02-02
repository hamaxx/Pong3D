typedef enum {
	TouchLocationStateInvalid,
	TouchLocationStateMoved,
	TouchLocationStatePressed,
	TouchLocationStateReleased
} TouchLocationState;

typedef enum {
	GestureTypeNone = 0,
	GestureTypeTap = 1,
	GestureTypeDoubleTap = 2,
	GestureTypeHold = 4,
	GestureTypeHorizontalDrag = 8,
	GestureTypeVerticalDrag = 16,
	GestureTypeFreeDrag = 32,
	GestureTypePinch = 64,
	GestureTypeFlick = 128,
	GestureTypeDragComplete = 256,
	GestureTypePinchComplete = 512
} GestureType;