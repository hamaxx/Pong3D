//
//  Color.h
//  XNI
//
//  Created by Matej Jan on 27.7.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Retronator.Xni.Framework.classes.h"

@interface Color : NSObject {
	uint packedValue;
}

- (id) initWithRed:(int)red green:(int)green blue:(int)blue alpha:(int)alpha;
- (id) initWithRed:(int)red green:(int)green blue:(int)blue;
- (id) initWithPercentageRed:(float)red green:(float)green blue:(float)blue alpha:(float)alpha;
- (id) initWithPercentageRed:(float)red green:(float)green blue:(float)blue;
- (id) initWithColor:(Color*)color;

+ (Color*) colorWithRed:(int)red green:(int)green blue:(int)blue alpha:(int)alpha;
+ (Color*) colorWithRed:(int)red green:(int)green blue:(int)blue;
+ (Color*) colorWithPercentageRed:(float)red green:(float)green blue:(float)blue alpha:(float)alpha;
+ (Color*) colorWithPercentageRed:(float)red green:(float)green blue:(float)blue;
+ (Color*) colorWithColor:(Color*)color;

@property (nonatomic) Byte r;
@property (nonatomic) Byte g;
@property (nonatomic) Byte b;
@property (nonatomic) Byte a;
@property (nonatomic) uint packedValue;

+ (Color*) multiply:(Color*)color withScalar:(float)value;

- (void) multiply:(float)value;
- (Vector3*) toVector3;
- (Vector4*) toVector4;

// Constants
+ (Color*) aliceBlue;
+ (Color*) antiqueWhite;
+ (Color*) aqua;
+ (Color*) aquamarine;
+ (Color*) azure;
+ (Color*) beige;
+ (Color*) bisque;
+ (Color*) black;
+ (Color*) blanchedAlmond;
+ (Color*) blue;
+ (Color*) blueViolet;
+ (Color*) brown;
+ (Color*) burlyWood;
+ (Color*) cadetBlue;
+ (Color*) chartreuse;
+ (Color*) chocolate;
+ (Color*) coral;
+ (Color*) cornflowerBlue;
+ (Color*) cornsilk;
+ (Color*) crimson;
+ (Color*) cyan;
+ (Color*) darkBlue;
+ (Color*) darkCyan;
+ (Color*) darkGoldenrod;
+ (Color*) darkGray;
+ (Color*) darkGreen;
+ (Color*) darkKhaki;
+ (Color*) darkMagenta;
+ (Color*) darkOliveGreen;
+ (Color*) darkOrange;
+ (Color*) darkOrchid;
+ (Color*) darkRed;
+ (Color*) darkSalmon;
+ (Color*) darkSeaGreen;
+ (Color*) darkSlateBlue;
+ (Color*) darkSlateGray;
+ (Color*) darkTurquoise;
+ (Color*) darkViolet;
+ (Color*) deepPink;
+ (Color*) deepSkyBlue;
+ (Color*) dimGray;
+ (Color*) dodgerBlue;
+ (Color*) firebrick;
+ (Color*) floralWhite;
+ (Color*) forestGreen;
+ (Color*) fuchsia;
+ (Color*) gainsboro;
+ (Color*) ghostWhite;
+ (Color*) gold;
+ (Color*) goldenrod;
+ (Color*) gray;
+ (Color*) green;
+ (Color*) greenYellow;
+ (Color*) honeydew;
+ (Color*) hotPink;
+ (Color*) indianRed;
+ (Color*) indigo;
+ (Color*) ivory;
+ (Color*) khaki;
+ (Color*) lavender;
+ (Color*) lavenderBlush;
+ (Color*) lawnGreen;
+ (Color*) lemonChiffon;
+ (Color*) lightBlue;
+ (Color*) lightCoral;
+ (Color*) lightCyan;
+ (Color*) lightGoldenrodYellow;
+ (Color*) lightGray;
+ (Color*) lightGreen;
+ (Color*) lightPink;
+ (Color*) lightSalmon;
+ (Color*) lightSeaGreen;
+ (Color*) lightSkyBlue;
+ (Color*) lightSlateGray;
+ (Color*) lightSteelBlue;
+ (Color*) lightYellow;
+ (Color*) lime;
+ (Color*) limeGreen;
+ (Color*) linen;
+ (Color*) magenta;
+ (Color*) maroon;
+ (Color*) mediumAquamarine;
+ (Color*) mediumBlue;
+ (Color*) mediumOrchid;
+ (Color*) mediumPurple;
+ (Color*) mediumSeaGreen;
+ (Color*) mediumSlateBlue;
+ (Color*) mediumSpringGreen;
+ (Color*) mediumTurquoise;
+ (Color*) mediumVioletRed;
+ (Color*) midnightBlue;
+ (Color*) mintCream;
+ (Color*) mistyRose;
+ (Color*) moccasin;
+ (Color*) navajoWhite;
+ (Color*) navy;
+ (Color*) oldLace;
+ (Color*) olive;
+ (Color*) oliveDrab;
+ (Color*) orange;
+ (Color*) orangeRed;
+ (Color*) orchid;
+ (Color*) paleGoldenrod;
+ (Color*) paleGreen;
+ (Color*) paleTurquoise;
+ (Color*) paleVioletRed;
+ (Color*) papayaWhip;
+ (Color*) peachPuff;
+ (Color*) peru;
+ (Color*) pink;
+ (Color*) plum;
+ (Color*) powderBlue;
+ (Color*) purple;
+ (Color*) red;
+ (Color*) rosyBrown;
+ (Color*) royalBlue;
+ (Color*) saddleBrown;
+ (Color*) salmon;
+ (Color*) sandyBrown;
+ (Color*) seaGreen;
+ (Color*) seaShell;
+ (Color*) sienna;
+ (Color*) silver;
+ (Color*) skyBlue;
+ (Color*) slateBlue;
+ (Color*) slateGray;
+ (Color*) snow;
+ (Color*) springGreen;
+ (Color*) steelBlue;
+ (Color*) tan;
+ (Color*) teal;
+ (Color*) thistle;
+ (Color*) tomato;
+ (Color*) transparent;
+ (Color*) turquoise;
+ (Color*) violet;
+ (Color*) wheat;
+ (Color*) white;
+ (Color*) whiteSmoke;
+ (Color*) yellow;
+ (Color*) yellowGreen;

@end
