//
//  main.m
//  XniTemplate
//
//  Created by Matej Jan on 20.10.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Retronator.Xni.Framework.h"

int main(int argc, char *argv[]) {
    [GameHost load];
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    int retVal = UIApplicationMain(argc, argv, @"GameHost", @"Pong3D");
    [pool release];
    return retVal;
}
