#import "Retronator.Xni.Framework.classes.h"

@protocol IDrawable

@property (nonatomic) BOOL visible;
@property (nonatomic) int drawOrder;

@property (nonatomic, readonly) Event *visibleChanged;
@property (nonatomic, readonly) Event *drawOrderChanged;

- (void) drawWithGameTime:(GameTime*)gameTime;

@end