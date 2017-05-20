//
//  ImageViewController.m
//  MacpViewer
//
//  Created by Basil Nikityuk on 5/20/17.
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "ImageViewController.h"

#import "ImageItem.h"

@interface ImageViewController ()
@property (nonatomic, retain) NSMutableArray *images;
@property (nonatomic, retain) NSMutableArray *draggedImages;

@end

@implementation ImageViewController

@synthesize imageBrowserView = _imageBrowserView;
@synthesize draggedImages = _draggedImages;
@synthesize images = _images;

#pragma mark -
#pragma mark Initialization and Deallocation

- (void)dealloc {
    [super dealloc];
}

- (id)initWithWindow:(NSWindow *)window {
    self = [super initWithWindow:window];
    if (self) {
        // Initialization code here.
        self.images = [NSMutableArray array];
        self.draggedImages = [NSMutableArray array];
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
#pragma mark Public methods

- (void)addImageWithFilePath:(NSString *)filePath {
//    ImageItem *image = [[ImageItem alloc] init];
    ImageItem *image = [ImageItem imageWithFilePath:filePath];
    
    [self.draggedImages addObject:image];
    
    [image release];
}

- (void)refreshDataSource {
    [self.images addObjectsFromArray:self.draggedImages];
    [self.draggedImages removeAllObjects];
    
    [self.imageBrowserView reloadData];
//    [self.imageBrowserView setNeedsDisplay:YES];
}

#pragma mark -
#pragma mark IKImageBrowserDelegate

#pragma mark -
#pragma mark IKImageBrowserDataSource

- (NSUInteger)numberOfItemsInImageBrowser:(IKImageBrowserView *)browserView {
    return [self.images count];
}

- (id /*IKImageBrowserItem*/)imageBrowser:(IKImageBrowserView *)browserView itemAtIndex:(NSUInteger)index {
    return [self.images objectAtIndex:index];
}


- (void)imageBrowser:(IKImageBrowserView *)browserView removeItemsAtIndexes:(NSIndexSet *)indexes {
    [self.images removeObjectsAtIndexes:indexes];
}

- (BOOL)imageBrowser:(IKImageBrowserView *)browserView moveItemsAtIndexes:(NSIndexSet *)indexes toIndex:(NSUInteger)destinationIndex {
    NSUInteger index;
    NSMutableArray *temporaryImages = [[NSMutableArray array] autorelease];
    
    for (index = [indexes lastIndex]; index != NSNotFound; index = [indexes indexLessThanIndex:index]) {
        if (index < destinationIndex) {
            destinationIndex--;
        }
        
        id imageObject = [self.images objectAtIndex:index];
        [temporaryImages addObject:imageObject];
        [self.images removeObjectAtIndex:index];
    }
    
    NSUInteger count = [temporaryImages count];
    for (index = 0; index < count; index++) {
        [self.images insertObject:[temporaryImages objectAtIndex:index] atIndex:destinationIndex];
    }
    
    return YES;
}

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
    NSData *data = nil;
    NSString *errorString = nil;
    NSPasteboard *pasteboard = [sender draggingPasteboard];
    
    if ([[pasteboard types] containsObject:NSFilenamesPboardType]) {
        data = [pasteboard dataForType:NSFilenamesPboardType];
    }
    
    if (data) {
        NSArray *filepaths = [NSPropertyListSerialization propertyListFromData:data 
                                                              mutabilityOption:kCFPropertyListImmutable 
                                                                        format:nil 
                                                              errorDescription:&errorString];
        ;
        NSUInteger count = [filepaths count];
        for (NSUInteger iterator = 0; iterator < count; iterator++) {
            [self addImageWithFilePath:[filepaths objectAtIndex:iterator]];
        }
        
        [self refreshDataSource];
    }
    
    return YES;
}

@end
