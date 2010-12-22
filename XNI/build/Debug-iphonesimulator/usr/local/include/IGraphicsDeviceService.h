#import "System.h"

#import "Retronator.Xni.Framework.Graphics.classes.h"

@protocol IGraphicsDeviceService

@property (nonatomic, readonly) GraphicsDevice *graphicsDevice;

@property (nonatomic, readonly) Event *deviceCreated;
@property (nonatomic, readonly) Event *deviceDisposing;
@property (nonatomic, readonly) Event *deviceResetting;
@property (nonatomic, readonly) Event *deviceReset;

@end