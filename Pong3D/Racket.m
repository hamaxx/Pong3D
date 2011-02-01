//
//  SceneObject1.m
//  Pong3D
//
//  Created by Matej Jan on 20.10.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "Racket.h"
#import "JSON.h"
#import "Retronator.Xni.Framework.Content.h"
#import "Namespace.Pong3D.h"

@implementation Racket
@synthesize side;

CGFloat screenW = 10.0f;
CGFloat screenH = 15.0f;
CGFloat racketW = 2.5f;
CGFloat racketH = 2.5f;

CGFloat avgRackSpeed = 11.0f;
CGFloat rackDiv = 5.0f;

/*
- (void) loadContent:(GraphicsDevice *)content {
	NSLog(@"load racket sprite");
	sprites = [[NSMutableArray alloc] init];
	
	SBJsonParser *parser = [[SBJsonParser alloc] init];
	NSString *filePath = [[NSBundle mainBundle] pathForResource:@"positions" ofType:@"txt"]; 
	NSError *error;
	NSString *js = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
	NSMutableDictionary *pos = [[parser objectWithString: js] objectForKey:@"racket"];
	[parser release];
		
	Texture2D *racketTexture = nil;// [content load:@"rackets"];

	NSArray *origin = [[pos objectForKey:@"origin"] objectForKey:side == 0 ? @"home" : @"opponent"];
	CGFloat ox = [[[origin objectAtIndex:0] objectAtIndex:0] floatValue];
	CGFloat oy = [[[origin objectAtIndex:0] objectAtIndex:1] intValue];	
	
	NSLog(@"origin %d %d", ox, oy);
	
	for (NSArray *r in [pos objectForKey:@"pos"]) {
		Sprite *s = [[Sprite alloc] init];
	
		[s setTexture: racketTexture];

		CGFloat x = [[r objectAtIndex:0] floatValue];
		CGFloat y = [[r objectAtIndex:1] floatValue];;
		CGFloat w = [[r objectAtIndex:2] floatValue];
		CGFloat h = [[r objectAtIndex:3] floatValue];
		CGFloat px = [[r objectAtIndex:4] floatValue];
		CGFloat py = [[r objectAtIndex:5] floatValue];
				
		[s setSourceRectangle:[Rectangle rectangleWithX:ox + x y:oy + y width:w height:h]];
		[s setOrigin:[Vector2 vectorWithX:0 y:0]];
		[s setRelative:[Vector2 vectorWithX:px y:py]];
		
		NSLog(@"obj %f %f %f %f", x, y, w, h);
		NSLog(@"org %f %f", s.origin.x, s.origin.y);
		
		[sprites addObject:[s autorelease]];
		
	}
}*/

- (VertexPositionColorArray *) racketColor:(Color *) c {
	VertexPositionColorArray * vertexArray = [[VertexPositionColorArray alloc] initWithInitialCapacity:2];
	
	VertexPositionColorStruct vertex;
	
	int z = 0;
	
	vertex.color = c.packedValue;
	
	vertex.position = *[Vector3 vectorWithX:-racketW y:racketH z:z].data;
	[vertexArray addVertex:&vertex];
	
	vertex.position = *[Vector3 vectorWithX:-racketW y:-racketH z:z].data;
	[vertexArray addVertex:&vertex];
	
	vertex.position = *[Vector3 vectorWithX:racketW y:-racketH z:z].data;
	[vertexArray addVertex:&vertex];
	
	
	vertex.position = *[Vector3 vectorWithX:-racketW y:racketH z:z].data;
	[vertexArray addVertex:&vertex];
	
	vertex.position = *[Vector3 vectorWithX:racketW y:-racketH z:z].data;
	[vertexArray addVertex:&vertex];
	
	vertex.position = *[Vector3 vectorWithX:racketW y:racketH z:z].data;
	[vertexArray addVertex:&vertex];
	
	[vertexArray addVertex:&vertex];
	
	return vertexArray;
}

- (void) loadContent:(GraphicsDevice *) gd :(ContentManager *)cm {
	rackets = [[NSMutableArray alloc] init];
	for (int i = 0; i < 10; i++) {
		CGFloat r = 0 + ((float)i / 20);
		CGFloat g = 0.5 + ((float)i / 20);
		CGFloat b = 1;
		CGFloat a = 0.2 + ((float)i / 20);
		Color *c = [Color colorWithPercentageRed:r green:g blue:b alpha:a];
		
		[rackets addObject:[self racketColor:c]];
	}
	animate = 0;
}

- (Vector3 *) collide: (Vector3 *) theSpeed :(Vector3 *) thePosition : (Vector3 *)theAccel :(NSInteger) radius {
	if (fabsf(thePosition.z - position.z) > radius) {
		return nil;
	}
	
	if (side == 1) {
		computerAccX = (((float)(rand() % 1000000) / 1000000.0f - 0.5f) / 3.0f) * screenW * rackDiv;
		computerAccY = (((float)(rand() % 1000000) / 1000000.0f - 0.5f) / 3.0f) * screenH * rackDiv;
	}
	
	if (fabsf(thePosition.x - position.x) - radius - racketW > 0 || fabsf(thePosition.y - position.y) - radius - racketH > 0)  {
		[ball stop: self];
		return [Vector3 zero];
	}
	
	[Sounds play:RACKET_SOUND];
	
	if (fabsf(thePosition.x - position.x) < racketW && fabsf(thePosition.y - position.y) < racketH) {
		theSpeed.z = (fabsf(theSpeed.z) > 1 ? 1 : fabsf(theSpeed.z)) * (thePosition.z < -25 ? 1 : -1);
		animate = [rackets count];
		return speed;
	}
	
	//theSpeed.x *= 0.9;
	//theSpeed.y *= 0.9;
	
	if (fabsf(thePosition.y - position.y) < racketH / 2) {
		CGFloat d = (fabsf(thePosition.x - position.x) - racketW / 2) / radius;
		if (fabsf(d) < 0.5) d = d < 0 ? -0.5 : 0.5;
		
		CGFloat newSpeed = (fabsf(theSpeed.z) + fabsf(theSpeed.x)) / 2;
		
		theSpeed.z = newSpeed * (thePosition.z < -25 ? 1 : -1) * d;
		theSpeed.x = newSpeed * (thePosition.x > position.x ? 1 : -1) / d;
		
		animate = [rackets count];
		return [Vector3 zero];
		
	} else if (fabsf(thePosition.x - position.x) < racketW / 2){
		CGFloat d = (fabsf(thePosition.y - position.y) - racketH / 2) / radius;
		if (fabsf(d) < 0.5) d = d < 0 ? -0.5 : 0.5;
		
		CGFloat newSpeed = (fabsf(theSpeed.z) + fabsf(theSpeed.y)) / 2;
		
		theSpeed.z = newSpeed * (thePosition.z < -25 ? 1 : -1) * d;
		theSpeed.y = newSpeed * (thePosition.y > position.y ? 1 : -1) / d;
		
		animate = [rackets count];
		return [Vector3 zero];
	} else {
		CGFloat dx = (fabsf(thePosition.x - position.x) - racketW / 2) / radius;
		CGFloat dy = (fabsf(thePosition.y - position.y) - racketH / 2) / radius;
		if (fabsf(dx) < 0.5) dx = dx < 0 ? -0.5 : 0.5;
		if (fabsf(dy) < 0.5) dy = dy < 0 ? -0.5 : 0.5;
		
		CGFloat newSpeed = (fabsf(theSpeed.z) + fabsf(theSpeed.x) + fabsf(theSpeed.y)) / 3;
		
		NSLog(@"dx %f, dy %f, ns %f", dx, dy, newSpeed);
		
		theSpeed.z = newSpeed * (thePosition.z < -25 ? 1 : -1) * sqrt(dx * dy);
		theSpeed.x = newSpeed * (thePosition.x > position.x ? 1 : -1) / dx;
		theSpeed.y = newSpeed * (thePosition.y > position.y ? 1 : -1) / dy;
		
		animate = [rackets count];
		return [Vector3 zero];
	}
		
	NSLog(@"end stop");	
	
	[ball stop: self];
	return [Vector3 zero];
}

- (void) followTouch {
	TouchCollection *touches = [TouchPanel getState];
	if ([touches count] > 0) {
		
		TouchLocation *touch = [touches objectAtIndex:0];
		
		CGSize size = [[UIScreen mainScreen] bounds].size;
		
		CGFloat tx = (touch.position.x / size.width - 0.5) * 2 * screenW;
		CGFloat ty = (touch.position.y / size.height - 0.5) * -2 * screenH;
				
		speed.x = -1 * (position.x - tx) / 10;
		speed.y = -1 * (position.y - ty) / 10;
		
		touchState = YES;

	} else {
		if (touchState == YES && ball.served == NO) {
			if (fabsf(0.0f - position.x) < racketW && fabsf(0.0f - position.y) < racketH) {
				[ball serve:speed];
				animate = [rackets count];
			}
		}
		
		if (touchState == YES && ball.failed == YES) {
			[ball restartPosition];
		}
		
		speed.x = 0;
		speed.y = 0;
		
		touchState = NO;
	}
	
	[position add:speed];
	
	if (ABS(position.x) > screenW - racketW) position.x = (position.x < 0 ? -1 : 1) * (screenW - racketW);
	if (ABS(position.y)  > screenH - racketH) position.y = (position.y < 0 ? -1 : 1) * (screenH - racketH);
	
}

- (void) followBall {
	Vector3 *ballPosition = ball.position;
	
	if (ball.newBall != nil) {
		if (ball.newBall.speed.z < 0 && ball.speed.z > 0) {
			ballPosition = ball.newBall.position;
		} else if (ball.newBall.speed.z < 0 && ball.speed.z < 0) {
			if (ball.newBall.position.z < ball.position.z) {
				ballPosition = ball.newBall.position;
			}
		}
	}
	
	computerSpeed += ((float)(rand() % 1000000) / 1000000.0f - 0.5f);
	if (computerSpeed > avgRackSpeed + rackDiv) computerSpeed = avgRackSpeed + rackDiv;
	if (computerSpeed < avgRackSpeed - rackDiv) computerSpeed = avgRackSpeed - rackDiv;
	
	CGFloat accX = 0;
	CGFloat accY = 0;
	if (ball.served && !ball.failed) {
		accX = computerAccX / (fabsf(ball.position.z) + 1);
		accY = computerAccY / (fabsf(ball.position.z) + 1);
	}

	speed.x = -1 * (position.x - ballPosition.x + accX) * computerSpeed / 100.0f;
	speed.y = -1 * (position.y - ballPosition.y + accY) * computerSpeed / 100.0f;
	
	[position add:speed];
	
	if (ABS(position.x) > screenW - racketW) position.x = (position.x < 0 ? -1 : 1) * (screenW - racketW);
	if (ABS(position.y)  > screenH - racketH) position.y = (position.y < 0 ? -1 : 1) * (screenH - racketH);
}

- (void) draw:(BasicEffect *)effect :(GraphicsDevice *)graphicsDevice: (SpriteBatch *)spriteBatch {
	if (![Menu shown]) {
		if (side == 0) {
			[self followTouch];
		} else {
			[self followBall];
		}
	}

	//NSLog(@"%@", position);
	effect.world = [Matrix createTranslation:position];
	
	[[effect.currentTechnique.passes objectAtIndex:0] apply];
	
	if (animate >= 1) animate -= 0.7;
	[graphicsDevice drawUserPrimitivesOfType:PrimitiveTypeTriangleStrip
								  vertexData:[rackets objectAtIndex:floorf(animate)] vertexOffset:0 primitiveCount:5];
	
	effect.world = [Matrix identity];
	
}

- (id) init {
	self = [super init];
	if (self != nil) {
		side = 0;
		position = [[Vector3 alloc] init];
		speed = [[Vector3 alloc] init];
		sprites = nil;
		touchState = NO;
		computerSpeed = 5;
	}
	return self;
}

- (id) initWithBall: (Ball *) b :(NSInteger) s {
	self = [self init];
	if (self != nil) {
		side = s;
		ball = [b retain];
	}
	return self;
}


@synthesize position;

- (void) dealloc
{
	[position release];
	[sprites release];
	[ball release];
	[super dealloc];
}

@end
