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
    
    [self.imageBrowserView setAnimates:YES];
    [self.imageBrowserView setAllowsReordering:YES];
    
    [self.imageBrowserView setDraggingDestinationDelegate:self];
    
    [self.imageBrowserView setDelegate:self];
    [self.imageBrowserView setDataSource:self];
}

#pragma mark -
#pragma mark IKImageBrowserDelegate protocol

#pragma mark -
#pragma mark IKImageBrowserDataSource protocol


#pragma mark -
#pragma mark NSDraggingDestination delegate

- (NSDragOperation)draggingEntered:(id<NSDraggingInfo>)sender {
    return NSDragOperationCopy;
}

- (NSDragOperation)draggingUpdated:(id<NSDraggingInfo>)sender {
    return NSDragOperationCopy;
}

- (void)draggingEnded:(id<NSDraggingInfo>)sender {
    
}

- (BOOL)performDragOperation:(id<NSDraggingInfo>)sender {
    return YES;
}

@end
