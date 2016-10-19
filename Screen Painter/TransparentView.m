//
//  TransparentView.m
//  Screen Painter
//
//  Created by Laura Sirvent Collado on 5/12/14.
//  Copyright (c) 2014 QULT. All rights reserved.
//

#import "TransparentView.h"
#import "AppDelegate.h"

@implementation TransparentView


- (void)drawRect:(NSRect)rect {
   
    [[NSColor clearColor]set];
    NSRectFill(rect);
    
    [_color set];
    [path stroke];
    // Drawing code here.
}

- (void)mouseDown:(NSEvent *)theEvent
{
    NSPoint loc = [theEvent locationInWindow];
    loc.x -= [self frame].origin.x;
    loc.y -= [self frame].origin.y;
    
    if(path == nil)
        path = [NSBezierPath bezierPath];
    
    [path setLineWidth:_width];
    [path moveToPoint:loc];
    [path setLineJoinStyle:NSRoundLineJoinStyle];

}

- (void)mouseDragged:(NSEvent *)theEvent
{
    NSPoint loc = [theEvent locationInWindow];
    loc.x -= [self frame].origin.x;
    loc.y -= [self frame].origin.y;
    
    [path lineToPoint:loc];
    [self setNeedsDisplay:YES];
}

- (void)mouseUp:(NSEvent *)theEvent
{
    
}

- (void)cleanPath{
    
    path = nil;
    [self setNeedsDisplay:YES];
}

- (void) setPathColor:(NSColor *)color{
    
    _color = [NSColor colorWithCalibratedRed:color.redComponent green:color.greenComponent blue:color.blueComponent alpha:color.alphaComponent];
    [self setNeedsDisplay:YES];
}

- (void) setPathWidth:(CGFloat)width{
    
    _width = width;
    [path setLineWidth:_width];
    [self setNeedsDisplay:YES];

}

-(BOOL)acceptsFirstResponder{
    return YES;
}

- (void)keyDown:(NSEvent *)theEvent{
    
    NSUInteger flags = [theEvent modifierFlags] & NSDeviceIndependentModifierFlagsMask;
    NSLog(@"La vista recoge eventos ahora");
    NSLog(@"%lu", (unsigned long)flags);
    NSLog(@"%d", theEvent.keyCode);
    
    //if (flags == 1572864) {
    
    if (theEvent.keyCode == 6 && flags == 1310720) {
        
        [self.window setIgnoresMouseEvents:YES];
        [[NSApplication sharedApplication] deactivate];
        AppDelegate *appDelegate = (AppDelegate *)[NSApp delegate];
        [appDelegate changeIcon];
        NSLog(@"ya no pinta");
    }
    
    else if (theEvent.keyCode == 7 && flags == 1310720) {
        
        [self cleanPath];
        NSLog(@"borrando");
    }
    
}

-(void)keyUp:(NSEvent *)theEvent{
    

}

@end
