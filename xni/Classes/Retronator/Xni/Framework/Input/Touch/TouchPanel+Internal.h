//
//  TouchPanel+Internal.h
//  XNI
//
//  Created by Matej Jan on 30.9.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TouchPanel.h"

@interface TouchPanel (Internal)

- (void) setView:(UIView *)theView;
- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;
- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;
- (void) touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event;
- (void) update;

@end
