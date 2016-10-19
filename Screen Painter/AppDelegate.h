//
//  AppDelegate.h
//  Screen Painter
//
//  Created by Laura Sirvent Collado on 5/12/14.
//  Copyright (c) 2014 QULT. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class TransparentWindowController;

@interface AppDelegate : NSObject <NSApplicationDelegate>{
    @private
    TransparentWindowController *transparentWindowController;
}




@property (nonatomic, strong) TransparentWindowController * tvc;
- (IBAction)cleanPath:(id)sender;
- (IBAction)takeToFront:(id)sender;
- (void) changeIcon;

@end

