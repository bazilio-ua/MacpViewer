//
//  ImageBrowserView.m
//  MacpViewer
//
//  Created by Basil Nikityuk on 5/22/17.
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "ImageBrowserView.h"
#import "ImageBrowserCell.h"

static CGColorRef CGColorCreateFromNSColor (CGColorSpaceRef colorSpace, NSColor *color) {
    NSColor *deviceColor = [color colorUsingColorSpaceName:NSDeviceRGBColorSpace];
    CGFloat components[4];
    
    [deviceColor getRed:&components[0] green:&components[1] blue:&components[2] alpha:&components[3]];
    
    return CGColorCreate(colorSpace, components);
}

@implementation ImageBrowserView

- (IKImageBrowserCell *)newCellForRepresentedItem:(id)anItem {
    ImageBrowserCell *cell = [[ImageBrowserCell alloc] init];
    
    return cell;
    
//    IKImageBrowserCell *cell = [super newCellForRepresentedItem:anItem];
//    
//    CALayer *layer = [cell layerForType:IKImageBrowserCellForegroundLayer];
//    layer.borderWidth = 1.0;
//    
//    NSColor *bgColor = [NSColor orangeColor];
//    
//    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
//    CGColorRef cgColor = CGColorCreateFromNSColor(colorSpace, bgColor);
//    CGColorSpaceRelease(colorSpace);
//    
//    layer.backgroundColor = cgColor;
//    
//    CGColorRelease(cgColor);
//    
//    return cell;
}

@end
