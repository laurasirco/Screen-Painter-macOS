//
//  AppDelegate.m
//  Screen Painter
//
//  Created by Laura Sirvent Collado on 5/12/14.
//  Copyright (c) 2014 QULT. All rights reserved.
//

#import "AppDelegate.h"
#import "TransparentWindowController.h"

@interface AppDelegate ()

@property (strong, nonatomic) IBOutlet NSWindow *window;
@property (strong, nonatomic) IBOutlet NSMenu *statusMenu;
@property (strong, nonatomic) NSStatusItem *statusBar;
@property (strong, nonatomic) IBOutlet NSColorWell *pathColor;
@property (strong, nonatomic) IBOutlet NSSlider *pathWidth;
@property (strong, nonatomic) IBOutlet NSWindow *optionsWindow;

@end

@implementation AppDelegate

@synthesize statusBar = _statusBar;
@synthesize tvc;

- (void) awakeFromNib {
    self.statusBar = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    
    
    // you can also set an image
    self.statusBar.image = [NSImage imageNamed:@"icono.png"];
    self.statusBar.alternateImage = [NSImage imageNamed:@"iconoSeleccionado.png"];
    
    self.statusBar.menu = self.statusMenu;
    self.statusBar.highlightMode = YES;
    
    if (!transparentWindowController) {
        transparentWindowController = [[TransparentWindowController alloc] initWithWindowNibName:@"TransparentWindow"];
    }
    [transparentWindowController showWindow:self];
    tvc = transparentWindowController;
    //[NSApp activateIgnoringOtherApps:YES];
    //[transparentWindowController.window makeKeyAndOrderFront:self];
}


BOOL checkAccessibility()
{
    NSDictionary* opts = @{(__bridge id)kAXTrustedCheckOptionPrompt: @YES};
    return AXIsProcessTrustedWithOptions((__bridge CFDictionaryRef)opts);
}

- (void)changeIcon{
    
    self.statusBar.image = [NSImage imageNamed:@"icono.png"];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    if (checkAccessibility()) {
        NSLog(@"Accessibility Enabled");
    }
    else {
        NSLog(@"Accessibility Disabled");
    }

    [self.pathWidth setTarget:self];
    [self.pathWidth setAction:@selector(widthValueChanged:)];
    
    [self.pathColor setTarget:self];
    [self.pathColor setAction:@selector(colorValueChanged:)];
    
    NSLog(@"registering keydown mask");
    [NSEvent addGlobalMonitorForEventsMatchingMask:NSKeyDownMask
                                           handler:^(NSEvent *event){

                                               NSLog(@"%d", [event keyCode]);
                                                                                              // Mask out everything but the key flags
                                               NSUInteger flags = [event modifierFlags] & NSDeviceIndependentModifierFlagsMask;
                                               NSLog(@"El global recoge eventos");
                                               NSLog(@"%lu", (unsigned long)flags);
                                               if (flags == 1310720) {
                                                   
                                                   if([event keyCode] == 6){

                                                       self.statusBar.image = [NSImage imageNamed:@"iconoHighlight.png"];
                                                       [transparentWindowController getControl];
                                                       [[NSApplication sharedApplication] activateIgnoringOtherApps:YES];
                                                       NSLog(@"pinta");
                                                   }
                                               }
                                               
                                           }];
    
    
    [tvc.view setPathColor:[NSColor greenColor]];
    [tvc.view setPathWidth:1.0];

}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (IBAction)cleanPath:(id)sender {
    
    [tvc.view cleanPath];
}

- (IBAction)takeToFront:(id)sender {
    
    [self.optionsWindow makeKeyAndOrderFront:self];
    [NSApp activateIgnoringOtherApps:YES];
}


- (void)widthValueChanged:(id)sender {
    
    NSLog(@"width");
    [tvc.view setPathWidth:[self.pathWidth floatValue]];
}


- (void)colorValueChanged:(id)sender {
    
    NSLog(@"Color");
    [tvc.view setPathColor:self.pathColor.color];

    
}

@end
