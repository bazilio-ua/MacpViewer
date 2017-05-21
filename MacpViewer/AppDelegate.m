//
//  AppDelegate.m
//  MacpViewer
//
//  Created by Basil Nikityuk on 5/20/17.
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "ImageBrowserViewController.h"

@interface AppDelegate ()
@property (nonatomic, retain) ImageBrowserViewController *controller;

@end

@implementation AppDelegate

@synthesize window = _window;
@synthesize controller = _controller;

- (void)dealloc {
    [self.controller release];
    
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)notification {
    // Insert code here to initialize your application
    ImageBrowserViewController *controller = [[ImageBrowserViewController alloc] initWithWindow:self.window];
    self.controller = controller;
//    [controller window];
    [controller showWindow:self];
    [self.window setDelegate:controller];
    
//    [self.window cascadeTopLeftFromPoint:NSMakePoint(320, 240)];
}

@end
