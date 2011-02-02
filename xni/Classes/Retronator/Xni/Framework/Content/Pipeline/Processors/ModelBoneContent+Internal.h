//
//  ModelBoneContent+Internal.h
//  XNI
//
//  Created by Matej Jan on 29.11.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ModelBoneContent (Internal)

- (id) initWithChildren:(NSArray*)theChildren 
				  index:(int)theIndex
				   name:(NSString*)theName 
			  transform:(Matrix*)theTransform;

- (void) setParent:(ModelBoneContent*)theParent;

@end
