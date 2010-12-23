//
//  NamedValueDictionary.h
//  XNI
//
//  Created by Matej Jan on 29.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

// #define NamedValueDictionary NamedValueDictionaryName
// #define T DataType

@interface NamedValueDictionary : NSObject {
	NSMutableDictionary *dictionary;
}

@property (nonatomic, readonly) int count;

- (T) itemForKey:(NSString*)key;
- (void) set:(T)value forKey:(NSString*)key;

- (void) add:(T)value forKey:(NSString*)key;
- (void) remove:(NSString*)key;

- (void) clear;

- (BOOL) containsKey:(NSString*)key;

@end

// #undef NamedValueDictionary
// #undef T