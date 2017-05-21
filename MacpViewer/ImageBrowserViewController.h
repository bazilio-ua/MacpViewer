//
//  ImageBrowserViewController.h
//  MacpViewer
//
//  Created by Basil Nikityuk on 5/20/17.
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <Quartz/Quartz.h>

@interface ImageBrowserViewController : NSWindowController <NSWindowDelegate>
@property (nonatomic, assign) IBOutlet IKImageBrowserView *browserView;

@end
