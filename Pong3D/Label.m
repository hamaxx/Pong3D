//
//  Label.m
//  Artificial I
//
//  Created by Matej Jan on 20.12.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "Label.h"

#import "Retronator.Xni.Framework.Graphics.h"

@interface Label ()

- (void) updateOrigin;

@end



@implementation Label

- (id) initWithFont:(SpriteFont*)theFont text:(NSString*)theText position:(Vector2*)thePosition
{
	self = [super init];
	if (self != nil) {
		font = [theFont retain];
		text = [theText retain];
		position = [thePosition retain];
		
		color = [[Color white] retain];
		origin = [[Vector2 zero] retain];
		scale = [[Vector2 one] retain];
		
		[self updateOrigin];
	}
	return self;
}

@synthesize font, text, color, position, origin, scale, rotation, layerDepth, horizontalAlign, verticalAlign;

- (void) setFont:(SpriteFont *)value {
	[value retain];
	[font release];
	font = value;
	[self updateOrigin];
}

- (void) setText:(NSString *)value {
	[value retain];
	[text release];
	text = value;
	[self updateOrigin];
}

- (void) setOrigin:(Vector2 *)value {
	[value retain];
	[origin release];
	origin = value;
	horizontalAlign = HorizontalAlignCustom;
	verticalAlign = VerticalAlignCustom;
}

- (void) setHorizontalAlign:(HorizontalAlign)value {
	horizontalAlign = value;
	[self updateOrigin];
}

- (void) setVerticalAlign:(VerticalAlign)value {
	verticalAlign = value;
	[self updateOrigin];
}

- (void) setScaleUniform:(float)value {
	scale.x = value;
	scale.y = value;
}

- (void) updateOrigin {
	Vector2 *size = [font measureString:text];
	
	switch (horizontalAlign) {
		case HorizontalAlignLeft:
			origin.x = 0;
			break;
		case HorizontalAlignCenter:
			origin.x = size.x / 2;
			break;
		case HorizontalAlignRight:
			origin.x = size.x;
			break;
	}
	
	switch (verticalAlign) {
		case VerticalAlignTop:
			origin.y = 0;
			break;
		case VerticalAlignMiddle:
			origin.y = size.y / 2;
			break;
		case VerticalAlignBottom:
			origin.y = size.y;
			break;
	}
}

- (void) dealloc
{
	[font release];
	[text release];
	[color release];
	[position release];
	[origin release];
	[scale release];
	
	[super dealloc];
}


@end
