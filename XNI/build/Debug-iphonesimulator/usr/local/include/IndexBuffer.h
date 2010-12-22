//
//  IndexBuffer.h
//  XNI
//
//  Created by Matej Jan on 21.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GraphicsResource.h"

@interface IndexBuffer : GraphicsResource {
	uint bufferID;
}

@property (nonatomic, readonly) uint bufferId;

@end
