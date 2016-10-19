//
//  TransparentWindowController.h
//  Screen Painter
//
//  Created by Laura Sirvent Collado on 5/12/14.
//  Copyright (c) 2014 QULT. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "TransparentView.h"

@interface TransparentWindowController : NSWindowController

@property(nonatomic, strong) TransparentView * view;

- (void) getControl;
- (void) ungetControl;


@end
