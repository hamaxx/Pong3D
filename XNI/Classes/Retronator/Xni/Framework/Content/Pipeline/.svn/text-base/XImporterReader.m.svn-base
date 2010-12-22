//
//  XImporterReader.m
//  XNI
//
//  Created by Matej Jan on 28.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "XImporterReader.h"

#import "Retronator.Xni.Framework.h"
#import "Retronator.Xni.Framework.Content.Pipeline.Graphics.h"

@implementation XImporterReader

static NSCharacterSet *numberCharacterSet;

- (id) initWithInput:(NSString *)theInput
{
	self = [super init];
	if (self != nil) {
		input = [theInput retain];
		contentStack = [[NSMutableArray alloc] init];
		root = [[NodeContent alloc] init];
		[contentStack addObject:root];
		namedData = [[NSMutableDictionary alloc] init];
	}
	return self;
}

+ (void) initialize {
	numberCharacterSet = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789.-"] retain];
}

@synthesize root, namedData;

- (BOOL) isValid {
	return inputPosition < [input length];
}


- (ContentItem *) currentContent {
	return [contentStack lastObject];
}

- (void) pushContent:(ContentItem *)content {
	[contentStack addObject:content];
}

- (void) popContent {
	[contentStack removeLastObject];
}


- (unichar) currentCharacter {
	return [input characterAtIndex:inputPosition];
}

- (void) skip {
	inputPosition++;
}

- (void) skipMany:(int)count {
	inputPosition+=count;
}

- (void) skipToCharacter:(unichar)character {	
	while ([self isValid] && [self currentCharacter] != character) {
		inputPosition++;
	}	
}

- (void) skipWhitespace {
	while ([self isValid] && [[NSCharacterSet whitespaceAndNewlineCharacterSet] characterIsMember:[self currentCharacter]]) {
		inputPosition++;
	}
}

- (void) skipToWhitespace {
	while ([self isValid] && ![[NSCharacterSet whitespaceAndNewlineCharacterSet] characterIsMember:[self currentCharacter]]) {
		inputPosition++;
	}	
}

- (void) skipNextNonWhitespace {
	[self skipWhitespace];
	[self skip];
	[self skipWhitespace];
}

- (BOOL) isAtOpeningParanthesis {
	return [self currentCharacter] == '{';
}

- (BOOL) isAtClosingParanthesis {
	return [self currentCharacter] == '}';	
}

- (void) skipToOpeningParanthesis {
	[self skipToCharacter:'{'];
}


- (void) skipToClosingParanthesis {
	[self skipToCharacter:'}'];	
}

- (void) skipToClosingParanthesisForCurrentLevel {
	int level = 1;
	while ([self isValid]) {
		if ([self isAtOpeningParanthesis]) {
			level++;
		} else if ([self isAtClosingParanthesis]) {
			level--;
			if (level == 0) {
				return;
			}
		}
		inputPosition++;
	}
}

- (NSString *) readWord {
	NSRange range;
	range.location = inputPosition;
	[self skipToWhitespace];
	range.length = inputPosition-range.location;
	return [input substringWithRange:range];
}

- (NSString *) readQuotedWord {
	NSRange range;
	[self skipToCharacter:'"'];
	[self skip];
	range.location = inputPosition;
	[self skipToCharacter:'"'];
	range.length = inputPosition-range.location;
	[self skip];
	return [input substringWithRange:range];	
}

- (float) readFloat {
	NSRange range;
	range.location = inputPosition;
	while ([self isValid] && [numberCharacterSet characterIsMember:[self currentCharacter]]) {
		inputPosition++;
	}
	range.length = inputPosition-range.location;
	return [[input substringWithRange:range] floatValue];
}

- (float) readInt {
	NSRange range;
	range.location = inputPosition;
	while ([self isValid] && [numberCharacterSet characterIsMember:[self currentCharacter]]) {
		inputPosition++;
	}
	range.length = inputPosition-range.location;
	return [[input substringWithRange:range] intValue];
}

- (void) dealloc
{
	[root release];
	[input release];
	[contentStack release];
	[namedData release];
	[super dealloc];
}

@end
