//
//  ImageBrowserView.m
//  MacpViewer
//
//  Created by Basil Nikityuk on 5/22/17.
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "ImageBrowserView.h"
#import "ImageBrowserCell.h"

@implementation ImageBrowserView

- (IKImageBrowserCell *)newCellForRepresentedItem:(id)anItem {
    ImageBrowserCell *cell = [[ImageBrowserCell alloc] init];
    
    return cell;
}

@end
