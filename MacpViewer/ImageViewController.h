//
//  ImageViewController.h
//  MacpViewer
//
//  Created by Basil Nikityuk on 5/20/17.
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <Quartz/Quartz.h>

@interface ImageViewController : NSWindowController
@property (nonatomic, assign) IBOutlet IKImageBrowserView *imageBrowserView;

@end
