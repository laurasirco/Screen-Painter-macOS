//
//  TransparentWindowController.m
//  Screen Painter
//
//  Created by Laura Sirvent Collado on 5/12/14.
//  Copyright (c) 2014 QULT. All rights reserved.
//

#import "TransparentWindowController.h"

@interface TransparentWindowController ()

@end

@implementation TransparentWindowController

-(id) initWithWindow:(NSWindow *)window{
    
    self = [super initWithWindow:window];
    if(self){

    }
    return self;
    
}

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    [self.window setOpaque: NO];
    [self.window setHasShadow:NO];
    [self.window setBackgroundColor:[NSColor clearColor]];
    [self.window setStyleMask:NSBorderlessWindowMask];
        
    
    //Resize to screen size
    NSRect screenRect;
    NSArray *screenArray = [NSScreen screens];
    NSScreen *screen = [screenArray objectAtIndex:0];
    screenRect = [screen visibleFrame];
    
    [self.window setFrame:screenRect display: YES animate: NO];
    
    //Set to floating
    [self.window setLevel:NSFloatingWindowLevel];
    
    self.view = (TransparentView *)self.window.contentView;
    
}

- (void) getControl{
    
    [self.window setIgnoresMouseEvents:NO];
}

- (void) ungetControl{
    
    [self.window setIgnoresMouseEvents:YES];
}

- (void)windowDidResignMain:(NSNotification *)notification
{
    // It's always nicer if the user has a choice
    /*if ([[NSUserDefaults standardUserDefaults] boolForKey:@"DefaultAlwaysOnTop"] == YES) {
        [[self window] setLevel:NSFloatingWindowLevel];
    } else {
        [[self window] setLevel:NSNormalWindowLevel];
    }*/
}

- (void)windowDidBecomeMain:(NSNotification *)notification
{
    //[[self window] setLevel:NSNormalWindowLevel];
}

@end
