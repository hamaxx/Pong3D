//
//  ContentIdentity.h
//  XNI
//
//  Created by Matej Jan on 7.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ContentIdentity : NSObject {
	NSString *fragmentIdentifier;
	NSString *sourceFilename;
	NSString *sourceTool;
}

@property (nonatomic, retain) NSString *fragmentIdentifier;
@property (nonatomic, retain) NSString *sourceFilename;
@property (nonatomic, retain) NSString *sourceTool;

@end
