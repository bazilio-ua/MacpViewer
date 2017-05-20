//
//  ImageItem.m
//  MacpViewer
//
//  Created by Basil Nikityuk on 5/20/17.
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "ImageItem.h"

#import <Quartz/Quartz.h>

@implementation ImageItem

@synthesize filePath = _filePath;

#pragma mark -
#pragma mark Class methods

+ (id)imageWithFilePath:(NSString *)filePath {
    return [[self alloc] initWithFilePath:filePath];
}

#pragma mark -
#pragma mark Initialization and Deallocation

- (void)dealloc {
    [self.filePath release];
    
    [super dealloc];
}

- (id)initWithFilePath:(NSString *)filePath {
    self = [super init];
    if (self) {
        self.filePath = filePath;
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setFilePath:(NSString *)filePath {
    if (_filePath != filePath) {
        [_filePath release];
        
        _filePath = [filePath retain];
    }
}

#pragma mark -
#pragma mark IKImageBrowserItem

- (NSString *)imageUID {
    return self.filePath;
}

- (NSString *)imageRepresentationType {
    return IKImageBrowserPathRepresentationType;
}

- (id)imageRepresentation {
    return self.filePath;
}

@end
