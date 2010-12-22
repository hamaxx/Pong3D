//
//  NamedValueDictionary.m.h
//  XNI
//
//  Created by Matej Jan on 29.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

// #define NamedValueDictionary NamedValueDictionaryName
// #define T DataType

@implementation NamedValueDictionary

- (id) init
{
	self = [super init];
	if (self != nil) {
		dictionary = [[NSMutableDictionary alloc] init];
	}
	return self;
}

- (int) count {
	return [dictionary count];
}

- (T) itemForKey:(NSString*)key {
	return [dictionary objectForKey:key];
}

- (void) set:(T)value forKey:(NSString*)key {
	if (value) {
		[dictionary setObject:value forKey:key];
	} else {
		[dictionary removeObjectForKey:key];
	}
}

- (void) add:(T)value forKey:(NSString*)key {
	[dictionary setObject:value forKey:key];
}

- (void) remove:(NSString*)key {
	[dictionary removeObjectForKey:key];
}

- (void) clear {
	[dictionary removeAllObjects];
}

- (BOOL) containsKey:(NSString*)key {
	return [dictionary objectForKey:key] != nil;
}

- (void) dealloc
{
	[dictionary release];
	[super dealloc];
}

@end

// #undef NamedValueDictionary
// #undef T