//
//  Color.m
//  XNI
//
//  Created by Matej Jan on 27.7.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "Color.h"

#import "Retronator.Xni.Framework.h"

#define CLAMP_TO_BYTE(X) (X < 0 ? 0 : (X > 255 ? 255 : X))

@implementation Color

// CONSTRUCTORS

- (id) initWithRed:(int)red green:(int)green blue:(int)blue alpha:(int)alpha {
    if (self = [super init]) {
        red = CLAMP_TO_BYTE(red);
        green = CLAMP_TO_BYTE(green) << 8;
        blue = CLAMP_TO_BYTE(blue) << 16;
        alpha = CLAMP_TO_BYTE(alpha) << 24;
		packedValue = red | green | blue | alpha;
    }
    return self;
}

- (id) initWithRed:(int)red green:(int)green blue:(int)blue {
    return [self initWithRed:red green:green blue:blue alpha:255];
}

- (id) initWithPercentageRed:(float)red green:(float)green blue:(float)blue alpha:(float)alpha {
    return [self initWithRed:255 * red green:255 * green blue:255 * blue alpha:255 * alpha];
}

- (id) initWithPercentageRed:(float)red green:(float)green blue:(float)blue {
    return [self initWithPercentageRed:red green:green blue:blue alpha:1];
}

- (id) initWithColor:(Color*)color {
    return [self initWithRed:color.r green:color.g blue:color.b alpha:color.a];
}

+ (Color*) colorWithRed:(int)red green:(int)green blue:(int)blue alpha:(int)alpha {
    return [[[Color alloc] initWithRed:red green:green blue:blue alpha:alpha] autorelease];
}

+ (Color*) colorWithRed:(int)red green:(int)green blue:(int)blue {
    return [[[Color alloc] initWithRed:red green:green blue:blue] autorelease];
}

+ (Color*) colorWithPercentageRed:(float)red green:(float)green blue:(float)blue alpha:(float)alpha {
    return [[[Color alloc] initWithPercentageRed:red green:green blue:blue alpha:alpha] autorelease];
}

+ (Color*) colorWithPercentageRed:(float)red green:(float)green blue:(float)blue {
    return [[[Color alloc] initWithPercentageRed:red green:green blue:blue] autorelease];
}

+ (Color*) colorWithColor:(Color *)color {
    return [[[Color alloc] initWithColor:color] autorelease];
}

// PROPERTIES

- (Byte) r {return (Byte)packedValue;}
- (void) setR:(Byte)value {packedValue = packedValue & 0xffffff00 | value;}

- (Byte) g {return (Byte)(packedValue >> 8);}
- (void) setG:(Byte)value {packedValue = packedValue & 0xffff00ff | ((uint)value << 8);}

- (Byte) b {return (Byte)(packedValue >> 16);}
- (void) setB:(Byte)value {packedValue = packedValue & 0xff00ffff | ((uint)value << 16);}

- (Byte) a {return (Byte)(packedValue >> 24);}
- (void) setA:(Byte)value {packedValue = packedValue & 0x00ffffff | ((uint)value << 24);}

@synthesize packedValue;

// METHODS

+ (Color*) multiply:(Color*)color withScalar:(float)value {
	return [Color colorWithRed:color.r * value green:color.g * value blue:color.b * value alpha:color.a * value];
}

- (Color*) multiply:(float)value {
	self.r *= value;
	self.g *= value;
	self.b *= value;
	self.a *= value;
	return self;
}

- (Vector3 *) toVector3 {
    return [Vector3 vectorWithX:self.r/255.0f y:self.g/255.0f z:self.b/255.0f];
}

- (Vector4 *) toVector4 {
    return [Vector4 vectorWithX:self.r/255.0f y:self.g/255.0f z:self.b/255.0f w:self.a/255.0f];
}

- (Color*) set:(Color*)value {
	packedValue = value.packedValue;
	return self;
}

- (id) copyWithZone:(NSZone *)zone {
	return [[Color allocWithZone:zone] initWithColor:self];
}

- (BOOL) equals:(Color*)color {
	if (!color) return NO;
	return color.packedValue == self.packedValue;
}

- (BOOL) isEqual:(id)object {
    if ([object isKindOfClass:[Color class]]) {
        return [self equals:object];
    }
    return NO;
}

- (NSUInteger) hash {
    return packedValue;
}

- (NSString *) description {
    return [NSString stringWithFormat:@"Color(%i, %i, %i, %i)", self.r, self.g, self.b, self.a];
}

// Constants
+ (Color*) aliceBlue {return [Color colorWithRed:240 green:248 blue:255 alpha:255];}
+ (Color*) antiqueWhite {return [Color colorWithRed:250 green:235 blue:215 alpha:255];}
+ (Color*) aqua {return [Color colorWithRed:0 green:255 blue:255 alpha:255];}
+ (Color*) aquamarine {return [Color colorWithRed:127 green:255 blue:212 alpha:255];}
+ (Color*) azure {return [Color colorWithRed:240 green:255 blue:255 alpha:255];}
+ (Color*) beige {return [Color colorWithRed:245 green:245 blue:220 alpha:255];}
+ (Color*) bisque {return [Color colorWithRed:255 green:228 blue:196 alpha:255];}
+ (Color*) black {return [Color colorWithRed:0 green:0 blue:0 alpha:255];}
+ (Color*) blanchedAlmond {return [Color colorWithRed:255 green:235 blue:205 alpha:255];}
+ (Color*) blue {return [Color colorWithRed:0 green:0 blue:255 alpha:255];}
+ (Color*) blueViolet {return [Color colorWithRed:138 green:43 blue:226 alpha:255];}
+ (Color*) brown {return [Color colorWithRed:165 green:42 blue:42 alpha:255];}
+ (Color*) burlyWood {return [Color colorWithRed:222 green:184 blue:135 alpha:255];}
+ (Color*) cadetBlue {return [Color colorWithRed:95 green:158 blue:160 alpha:255];}
+ (Color*) chartreuse {return [Color colorWithRed:127 green:255 blue:0 alpha:255];}
+ (Color*) chocolate {return [Color colorWithRed:210 green:105 blue:30 alpha:255];}
+ (Color*) coral {return [Color colorWithRed:255 green:127 blue:80 alpha:255];}
+ (Color*) cornflowerBlue {return [Color colorWithRed:100 green:149 blue:237 alpha:255];}
+ (Color*) cornsilk {return [Color colorWithRed:255 green:248 blue:220 alpha:255];}
+ (Color*) crimson {return [Color colorWithRed:220 green:20 blue:60 alpha:255];}
+ (Color*) cyan {return [Color colorWithRed:0 green:255 blue:255 alpha:255];}
+ (Color*) darkBlue {return [Color colorWithRed:0 green:0 blue:139 alpha:255];}
+ (Color*) darkCyan {return [Color colorWithRed:0 green:139 blue:139 alpha:255];}
+ (Color*) darkGoldenrod {return [Color colorWithRed:184 green:134 blue:11 alpha:255];}
+ (Color*) darkGray {return [Color colorWithRed:169 green:169 blue:169 alpha:255];}
+ (Color*) darkGreen {return [Color colorWithRed:0 green:100 blue:0 alpha:255];}
+ (Color*) darkKhaki {return [Color colorWithRed:189 green:183 blue:107 alpha:255];}
+ (Color*) darkMagenta {return [Color colorWithRed:139 green:0 blue:139 alpha:255];}
+ (Color*) darkOliveGreen {return [Color colorWithRed:85 green:107 blue:47 alpha:255];}
+ (Color*) darkOrange {return [Color colorWithRed:255 green:140 blue:0 alpha:255];}
+ (Color*) darkOrchid {return [Color colorWithRed:153 green:50 blue:204 alpha:255];}
+ (Color*) darkRed {return [Color colorWithRed:139 green:0 blue:0 alpha:255];}
+ (Color*) darkSalmon {return [Color colorWithRed:233 green:150 blue:122 alpha:255];}
+ (Color*) darkSeaGreen {return [Color colorWithRed:143 green:188 blue:139 alpha:255];}
+ (Color*) darkSlateBlue {return [Color colorWithRed:72 green:61 blue:139 alpha:255];}
+ (Color*) darkSlateGray {return [Color colorWithRed:47 green:79 blue:79 alpha:255];}
+ (Color*) darkTurquoise {return [Color colorWithRed:0 green:206 blue:209 alpha:255];}
+ (Color*) darkViolet {return [Color colorWithRed:148 green:0 blue:211 alpha:255];}
+ (Color*) deepPink {return [Color colorWithRed:255 green:20 blue:147 alpha:255];}
+ (Color*) deepSkyBlue {return [Color colorWithRed:0 green:191 blue:255 alpha:255];}
+ (Color*) dimGray {return [Color colorWithRed:105 green:105 blue:105 alpha:255];}
+ (Color*) dodgerBlue {return [Color colorWithRed:30 green:144 blue:255 alpha:255];}
+ (Color*) firebrick {return [Color colorWithRed:178 green:34 blue:34 alpha:255];}
+ (Color*) floralWhite {return [Color colorWithRed:255 green:250 blue:240 alpha:255];}
+ (Color*) forestGreen {return [Color colorWithRed:34 green:139 blue:34 alpha:255];}
+ (Color*) fuchsia {return [Color colorWithRed:255 green:0 blue:255 alpha:255];}
+ (Color*) gainsboro {return [Color colorWithRed:220 green:220 blue:220 alpha:255];}
+ (Color*) ghostWhite {return [Color colorWithRed:248 green:248 blue:255 alpha:255];}
+ (Color*) gold {return [Color colorWithRed:255 green:215 blue:0 alpha:255];}
+ (Color*) goldenrod {return [Color colorWithRed:218 green:165 blue:32 alpha:255];}
+ (Color*) gray {return [Color colorWithRed:128 green:128 blue:128 alpha:255];}
+ (Color*) green {return [Color colorWithRed:0 green:128 blue:0 alpha:255];}
+ (Color*) greenYellow {return [Color colorWithRed:173 green:255 blue:47 alpha:255];}
+ (Color*) honeydew {return [Color colorWithRed:240 green:255 blue:240 alpha:255];}
+ (Color*) hotPink {return [Color colorWithRed:255 green:105 blue:180 alpha:255];}
+ (Color*) indianRed {return [Color colorWithRed:205 green:92 blue:92 alpha:255];}
+ (Color*) indigo {return [Color colorWithRed:75 green:0 blue:130 alpha:255];}
+ (Color*) ivory {return [Color colorWithRed:255 green:255 blue:240 alpha:255];}
+ (Color*) khaki {return [Color colorWithRed:240 green:230 blue:140 alpha:255];}
+ (Color*) lavender {return [Color colorWithRed:230 green:230 blue:250 alpha:255];}
+ (Color*) lavenderBlush {return [Color colorWithRed:255 green:240 blue:245 alpha:255];}
+ (Color*) lawnGreen {return [Color colorWithRed:124 green:252 blue:0 alpha:255];}
+ (Color*) lemonChiffon {return [Color colorWithRed:255 green:250 blue:205 alpha:255];}
+ (Color*) lightBlue {return [Color colorWithRed:173 green:216 blue:230 alpha:255];}
+ (Color*) lightCoral {return [Color colorWithRed:240 green:128 blue:128 alpha:255];}
+ (Color*) lightCyan {return [Color colorWithRed:224 green:255 blue:255 alpha:255];}
+ (Color*) lightGoldenrodYellow {return [Color colorWithRed:250 green:250 blue:210 alpha:255];}
+ (Color*) lightGray {return [Color colorWithRed:211 green:211 blue:211 alpha:255];}
+ (Color*) lightGreen {return [Color colorWithRed:144 green:238 blue:144 alpha:255];}
+ (Color*) lightPink {return [Color colorWithRed:255 green:182 blue:193 alpha:255];}
+ (Color*) lightSalmon {return [Color colorWithRed:255 green:160 blue:122 alpha:255];}
+ (Color*) lightSeaGreen {return [Color colorWithRed:32 green:178 blue:170 alpha:255];}
+ (Color*) lightSkyBlue {return [Color colorWithRed:135 green:206 blue:250 alpha:255];}
+ (Color*) lightSlateGray {return [Color colorWithRed:119 green:136 blue:153 alpha:255];}
+ (Color*) lightSteelBlue {return [Color colorWithRed:176 green:196 blue:222 alpha:255];}
+ (Color*) lightYellow {return [Color colorWithRed:255 green:255 blue:224 alpha:255];}
+ (Color*) lime {return [Color colorWithRed:0 green:255 blue:0 alpha:255];}
+ (Color*) limeGreen {return [Color colorWithRed:50 green:205 blue:50 alpha:255];}
+ (Color*) linen {return [Color colorWithRed:250 green:240 blue:230 alpha:255];}
+ (Color*) magenta {return [Color colorWithRed:255 green:0 blue:255 alpha:255];}
+ (Color*) maroon {return [Color colorWithRed:128 green:0 blue:0 alpha:255];}
+ (Color*) mediumAquamarine {return [Color colorWithRed:102 green:205 blue:170 alpha:255];}
+ (Color*) mediumBlue {return [Color colorWithRed:0 green:0 blue:205 alpha:255];}
+ (Color*) mediumOrchid {return [Color colorWithRed:186 green:85 blue:211 alpha:255];}
+ (Color*) mediumPurple {return [Color colorWithRed:147 green:112 blue:219 alpha:255];}
+ (Color*) mediumSeaGreen {return [Color colorWithRed:60 green:179 blue:113 alpha:255];}
+ (Color*) mediumSlateBlue {return [Color colorWithRed:123 green:104 blue:238 alpha:255];}
+ (Color*) mediumSpringGreen {return [Color colorWithRed:0 green:250 blue:154 alpha:255];}
+ (Color*) mediumTurquoise {return [Color colorWithRed:72 green:209 blue:204 alpha:255];}
+ (Color*) mediumVioletRed {return [Color colorWithRed:199 green:21 blue:133 alpha:255];}
+ (Color*) midnightBlue {return [Color colorWithRed:25 green:25 blue:112 alpha:255];}
+ (Color*) mintCream {return [Color colorWithRed:245 green:255 blue:250 alpha:255];}
+ (Color*) mistyRose {return [Color colorWithRed:255 green:228 blue:225 alpha:255];}
+ (Color*) moccasin {return [Color colorWithRed:255 green:228 blue:181 alpha:255];}
+ (Color*) navajoWhite {return [Color colorWithRed:255 green:222 blue:173 alpha:255];}
+ (Color*) navy {return [Color colorWithRed:0 green:0 blue:128 alpha:255];}
+ (Color*) oldLace {return [Color colorWithRed:253 green:245 blue:230 alpha:255];}
+ (Color*) olive {return [Color colorWithRed:128 green:128 blue:0 alpha:255];}
+ (Color*) oliveDrab {return [Color colorWithRed:107 green:142 blue:35 alpha:255];}
+ (Color*) orange {return [Color colorWithRed:255 green:165 blue:0 alpha:255];}
+ (Color*) orangeRed {return [Color colorWithRed:255 green:69 blue:0 alpha:255];}
+ (Color*) orchid {return [Color colorWithRed:218 green:112 blue:214 alpha:255];}
+ (Color*) paleGoldenrod {return [Color colorWithRed:238 green:232 blue:170 alpha:255];}
+ (Color*) paleGreen {return [Color colorWithRed:152 green:251 blue:152 alpha:255];}
+ (Color*) paleTurquoise {return [Color colorWithRed:175 green:238 blue:238 alpha:255];}
+ (Color*) paleVioletRed {return [Color colorWithRed:219 green:112 blue:147 alpha:255];}
+ (Color*) papayaWhip {return [Color colorWithRed:255 green:239 blue:213 alpha:255];}
+ (Color*) peachPuff {return [Color colorWithRed:255 green:218 blue:185 alpha:255];}
+ (Color*) peru {return [Color colorWithRed:205 green:133 blue:63 alpha:255];}
+ (Color*) pink {return [Color colorWithRed:255 green:192 blue:203 alpha:255];}
+ (Color*) plum {return [Color colorWithRed:221 green:160 blue:221 alpha:255];}
+ (Color*) powderBlue {return [Color colorWithRed:176 green:224 blue:230 alpha:255];}
+ (Color*) purple {return [Color colorWithRed:128 green:0 blue:128 alpha:255];}
+ (Color*) red {return [Color colorWithRed:255 green:0 blue:0 alpha:255];}
+ (Color*) rosyBrown {return [Color colorWithRed:188 green:143 blue:143 alpha:255];}
+ (Color*) royalBlue {return [Color colorWithRed:65 green:105 blue:225 alpha:255];}
+ (Color*) saddleBrown {return [Color colorWithRed:139 green:69 blue:19 alpha:255];}
+ (Color*) salmon {return [Color colorWithRed:250 green:128 blue:114 alpha:255];}
+ (Color*) sandyBrown {return [Color colorWithRed:244 green:164 blue:96 alpha:255];}
+ (Color*) seaGreen {return [Color colorWithRed:46 green:139 blue:87 alpha:255];}
+ (Color*) seaShell {return [Color colorWithRed:255 green:245 blue:238 alpha:255];}
+ (Color*) sienna {return [Color colorWithRed:160 green:82 blue:45 alpha:255];}
+ (Color*) silver {return [Color colorWithRed:192 green:192 blue:192 alpha:255];}
+ (Color*) skyBlue {return [Color colorWithRed:135 green:206 blue:235 alpha:255];}
+ (Color*) slateBlue {return [Color colorWithRed:106 green:90 blue:205 alpha:255];}
+ (Color*) slateGray {return [Color colorWithRed:112 green:128 blue:144 alpha:255];}
+ (Color*) snow {return [Color colorWithRed:255 green:250 blue:250 alpha:255];}
+ (Color*) springGreen {return [Color colorWithRed:0 green:255 blue:127 alpha:255];}
+ (Color*) steelBlue {return [Color colorWithRed:70 green:130 blue:180 alpha:255];}
+ (Color*) tan {return [Color colorWithRed:210 green:180 blue:140 alpha:255];}
+ (Color*) teal {return [Color colorWithRed:0 green:128 blue:128 alpha:255];}
+ (Color*) thistle {return [Color colorWithRed:216 green:191 blue:216 alpha:255];}
+ (Color*) tomato {return [Color colorWithRed:255 green:99 blue:71 alpha:255];}
+ (Color*) transparent {return [Color colorWithRed:0 green:0 blue:0 alpha:0];}
+ (Color*) turquoise {return [Color colorWithRed:64 green:224 blue:208 alpha:255];}
+ (Color*) violet {return [Color colorWithRed:238 green:130 blue:238 alpha:255];}
+ (Color*) wheat {return [Color colorWithRed:245 green:222 blue:179 alpha:255];}
+ (Color*) white {return [Color colorWithRed:255 green:255 blue:255 alpha:255];}
+ (Color*) whiteSmoke {return [Color colorWithRed:245 green:245 blue:245 alpha:255];}
+ (Color*) yellow {return [Color colorWithRed:255 green:255 blue:0 alpha:255];}
+ (Color*) yellowGreen {return [Color colorWithRed:154 green:205 blue:50 alpha:255];}

@end
