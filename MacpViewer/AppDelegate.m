//
//  AppDelegate.m
//  MacpViewer
//
//  Created by Basil Nikityuk on 5/20/17.
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "ImageViewController.h"

@implementation AppDelegate

@synthesize window = _window;

- (void)dealloc {
    [super dealloc];
}
	
- (void)applicationDidFinishLaunching:(NSNotification *)notification {
    // Insert code here to initialize your application
    ImageViewController *windowController = [[ImageViewController alloc] initWithWindow:self.window];
    
    [windowController showWindow:self];
    
    [self.window cascadeTopLeftFromPoint:NSMakePoint(320, 240)];
}

@end
