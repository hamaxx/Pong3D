#import "Retronator.Xni.Framework.classes.h"

@protocol IUpdatable

@property (nonatomic) BOOL enabled;
@property (nonatomic) int updateOrder;

@property (nonatomic, readonly) Event *enabledChanged;
@property (nonatomic, readonly) Event *updateOrderChanged;

- (void) updateWithGameTime:(GameTime*)gameTime;

@end