//
//  Rectangle.h
//  XNI
//
//  Created by Matej Jan on 22.7.10.
//  Copyright 2010 Retronator, Razum. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "Retronator.Xni.Framework.classes.h"

@interface Rectangle : NSObject <NSCopying> {
	RectangleStruct data;
}

- (id) initWithX:(int)x y:(int)y width:(int)width height:(int)height;
- (id) initWithRectangleStruct:(RectangleStruct*) rectangleStruct;
- (id) initWithRectangle:(Rectangle*) rectangle;

+ (Rectangle*) rectangleWithX:(int)x y:(int)y width:(int)width height:(int)height;
+ (Rectangle*) rectangleWithStruct:(RectangleStruct*) rectangleStruct;
+ (Rectangle*) rectangleWithRectangle:(Rectangle*) rectangle;
+ (Rectangle*) rectangleWithCGRect:(CGRect) cgRect;

@property (nonatomic) int x;
@property (nonatomic) int y;
@property (nonatomic) int width;
@property (nonatomic) int height;
@property (nonatomic, readonly) RectangleStruct *data;

- (Rectangle*) set:(Rectangle*)value;

- (BOOL) containsX:(int)x y:(int)y;
- (BOOL) containsPoint:(XniPoint*)point;

- (BOOL) equals:(Rectangle*)rectangle;

+ (Rectangle*) empty;

@end
