//
//  Menu.m
//  Pong3D
//
//  Created by Jure Ham on 1/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Menu.h"
#import "Namespace.Pong3D.h"

BOOL shown = YES;
BOOL cantCont = NO;

@implementation Menu
@synthesize position;

+ (BOOL) shown {
	return shown;
}

+ (void) shown: (BOOL) sh :(BOOL) c {
	shown = sh;
	cantCont = c;
}

- (void) loadContent:(GraphicsDevice *) gd :(ContentManager *)cm {
	newGame = [cm load:@"newGame"];
	menu = [cm load:@"menu"];
	cont = [cm load:@"continue"];
	scores = [cm load:@"scores"];
	addscore = [cm load:@"addscore"];
}

- (NSString *) md5 :(NSString *) str {
	const char *cStr = [str UTF8String];
	unsigned char result[CC_MD5_DIGEST_LENGTH];
	CC_MD5( cStr, strlen(cStr), result );
	return [[NSString stringWithFormat: @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
			result[0], result[1], result[2], result[3], result[4], result[5], result[6], 
			result[7], result[8], result[9], result[10], result[11], result[12], result[13],
			result[14], result[15]] lowercaseString];
}

- (void) addScore {
	
	NSString *salt = @"thisIsSoCool!!111";
	NSString *res = [NSString stringWithFormat:@"%d", [score score]];
	NSString *id = [NSString stringWithFormat:@"%d", arc4random()];
	
	NSString *hash = [self md5:[NSString stringWithFormat:@"%@%@%@", [self md5:res], salt, [self md5:id]]];
	hash = [self md5:[NSString stringWithFormat:@"%@%@", hash, [self md5:salt]]];
	
	NSString *urlstr = [NSString stringWithFormat:@"http://pong.hamax.si/add.php?res=%@&hash=%@&id=%@", res, hash, id];
	NSURL *url = [NSURL URLWithString:urlstr];
	[[UIApplication sharedApplication] openURL:url];
}

- (void) buttons: (Vector2 *) location {
	NSInteger b1 = 160, b2 = 200, b3 = 240;
	
	if (location.x > 125 && location.x < 125 + 86 && location.y > b1 && location.y < b1 + 30) {
		[level reset];
	} else if (location.x > 125 && location.x < 125 + 86 && location.y > b2 && location.y < b2 + 30) {
		if (!cantCont) {
			[level loadSaved];
		} else {
			[self addScore];
			return;
		}
	} else if (location.x > 125 && location.x < 125 + 86 && location.y > b3 && location.y < b3 + 30) {
		NSURL *url = [NSURL URLWithString:@"http://pong.hamax.si"];
		[[UIApplication sharedApplication] openURL:url];
		return;
	} else {
		return;
	}

	
	shown = NO;
}

- (void) controll {
	TouchCollection *touches = [TouchPanel getState];
	if ([touches count] > 0) {
		press = [[[touches objectAtIndex:0] position] retain];
	} else if (press) {
		
		[self buttons: press];
		[press release], press = nil;
	} else {
		[press release], press = nil;
	}
}

- (void) draw:(BasicEffect *)effect :(GraphicsDevice *)graphicsDevice: (SpriteBatch *)spriteBatch {
	if (shown) {
		[self controll];
		
		[spriteBatch draw:menu to:[Vector2 vectorWithX:90 y:130] tintWithColor:[Color colorWithRed:255 green:255 blue:255]];
		[spriteBatch draw:newGame to:[Vector2 vectorWithX:125 y:160] tintWithColor:[Color colorWithRed:255 green:255 blue:255]];
		if (!cantCont) {
			[spriteBatch draw:cont to:[Vector2 vectorWithX:120 y:200] tintWithColor:[Color colorWithRed:255 green:255 blue:255]];
		} else {
			[spriteBatch draw:addscore to:[Vector2 vectorWithX:120 y:200] tintWithColor:[Color colorWithRed:255 green:255 blue:255]];
		}
			
		[spriteBatch draw:scores to:[Vector2 vectorWithX:120 y:240] tintWithColor:[Color colorWithRed:255 green:255 blue:255]];
		
	}
}

- (id) initWithLevel:(Level *) l :(Score *) sc {
	self = [super init];
	if (self != nil) {
		level = l;
		press = nil;
		score = sc;
	}
	return self;
}


@end
