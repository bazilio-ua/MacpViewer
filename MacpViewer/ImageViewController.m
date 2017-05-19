//
//  ImageViewController.m
//  MacpViewer
//
//  Created by Basil Nikityuk on 5/20/17.
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "ImageViewController.h"

@implementation ImageViewController

@synthesize imageBrowserView = _imageBrowserView;

#pragma mark -
#pragma mark Initialization and Deallocation

- (void)dealloc {
    
    [super dealloc];
}

- (id)initWithWindow:(NSWindow *)window {
    self = [super initWithWindow:window];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

@end
