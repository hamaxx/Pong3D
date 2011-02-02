//
//  XImporterReader.h
//  XNI
//
//  Created by Matej Jan on 28.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Retronator.Xni.Framework.classes.h"
#import "Retronator.Xni.Framework.Content.Pipeline.classes.h"
#import "Retronator.Xni.Framework.Content.Pipeline.Graphics.classes.h"

@interface XImporterReader : NSObject
{
	NSString *input;
	int inputPosition;
	NodeContent *root;
	NSMutableArray *contentStack;
	NSMutableDictionary *namedData;
}

- (id) initWithInput:(NSString*)theInput;

@property (nonatomic, readonly) NodeContent *root;
@property (nonatomic, readonly) NSMutableDictionary *namedData;
@property (nonatomic, readonly) BOOL isValid;

- (ContentItem*) currentContent;
- (void) pushContent:(ContentItem*)content;
- (void) popContent;

- (unichar) currentCharacter;
- (void) skip;
- (void) skipMany:(int)count;
- (void) skipToCharacter:(unichar)character;
- (void) skipWhitespace; 
- (void) skipToWhitespace; 
- (void) skipNextNonWhitespace;
- (BOOL) isAtOpeningParanthesis;
- (BOOL) isAtClosingParanthesis;
- (void) skipToOpeningParanthesis; 
- (void) skipToClosingParanthesis; 
- (void) skipToClosingParanthesisForCurrentLevel; 
- (NSString*) readWord;
- (NSString*) readQuotedWord;
- (float) readFloat;
- (float) readInt;

@end
