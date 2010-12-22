//
//  ModelBone+Internal.h
//  XNI
//
//  Created by Matej Jan on 29.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ModelBone (Internal)

- (id) initWithChildren:(NSArray*)theChildren 
				  index:(int)theIndex
				   name:(NSString*)theName 
			  transform:(Matrix*)theTransform;

- (void) setParent:(ModelBone*)theParent;

@end
