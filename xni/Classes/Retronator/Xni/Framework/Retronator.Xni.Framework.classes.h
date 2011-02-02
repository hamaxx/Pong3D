#import "FrameworkEnums.h"
@class Protocols;

// Data structures
#import "PointStruct.h"
#import "RectangleStruct.h"
@class XniPoint, Rectangle, Color;

// Game
@protocol IGraphicsDeviceManager;
@class Game, GameTime, GameServiceContainer, GraphicsDeviceManager;

// Game host
@class GameHost, GameWindow;

// Game components
@protocol IGameComponent, IUpdatable, IDrawable;
@class GameComponent, DrawableGameComponent, GameComponentCollection, GameComponentCollectionEventArgs;

// Linear algebra
#import "Vector2Struct.h"
#import "Vector3Struct.h"
#import "Vector4Struct.h"
#import "MatrixStruct.h"
@class Vector2, Vector3, Vector4, Quaternion, Matrix;