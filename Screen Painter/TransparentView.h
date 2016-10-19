//
//  TransparentView.h
//  Screen Painter
//
//  Created by Laura Sirvent Collado on 5/12/14.
//  Copyright (c) 2014 QULT. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface TransparentView : NSView{
    NSBezierPath *path;
    NSColor * _color;
    CGFloat _width;
}

- (void) cleanPath;
- (void) setPathColor:(NSColor *)color;
- (void) setPathWidth:(CGFloat)width;

@end
