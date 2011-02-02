//
//  ReadOnlyCollection.m
//  XNI
//
//  Created by Matej Jan on 29.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

// #define ReadOnlyCollection ReadOnlyCollectionName
// #define T DataType

@implementation ReadOnlyCollection

- (id) initWithItems:(NSArray*)items
{
	self = [super init];
	if (self != nil) {
		collection = [[NSMutableArray alloc] initWithArray:items];
#ifdef Initialization
		Initialization
#endif
	}
	return self;
}

- (int) count {
	return [collection count];
}

- (T)itemAt:(int)index {
	return [collection objectAtIndex:index];
}

- (NSUInteger) countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(id *)stackbuf count:(NSUInteger)len {
	return [collection countByEnumeratingWithState:state objects:stackbuf count:len];
}

- (void) dealloc
{
#ifdef Disposing
	Disposing
#endif	
	[collection release];
	[super dealloc];
}

@end

// #undef ReadOnlyCollection
// #undef T