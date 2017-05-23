//
//  ImageBrowserCell.m
//  MacpViewer
//
//  Created by Basil Nikityuk on 5/22/17.
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "ImageBrowserCell.h"

static CGColorRef CGColorCreateFromNSColor (CGColorSpaceRef colorSpace, NSColor *color) {
    NSColor *deviceColor = [color colorUsingColorSpaceName:NSDeviceRGBColorSpace];
    CGFloat components[4];
    
    [deviceColor getRed:&components[0] green:&components[1] blue:&components[2] alpha:&components[3]];
    
    return CGColorCreate(colorSpace, components);
}

@implementation ImageBrowserCell

- (CALayer *)layerForType:(NSString *)type {
    CALayer *layer = nil;
    
//    NSRect titleFrame = [self titleFrame];
//    NSRect subtitleFrame = [self subtitleFrame];
    
    NSRect cellFrame = [self frame];
    NSRect imageFrame = [self imageFrame];
    NSRect relativeImageFrame = NSMakeRect(imageFrame.origin.x - cellFrame.origin.x, 
                                           imageFrame.origin.y - cellFrame.origin.y, 
                                           imageFrame.size.width, 
                                           imageFrame.size.height);

//    NSLog(@"\n\n\n ************");
//    
//    NSLog(@"%@", self);
//
//    
//    NSLog(@"%@", type);
//
//    NSLog(@"cellFrame %@", NSStringFromRect(cellFrame));
//    NSLog(@"imageFrame %@", NSStringFromRect(imageFrame));
//
//    NSLog(@"relativeImageFrame %@", NSStringFromRect(relativeImageFrame));
//
//    NSLog(@"titleFrame %@", NSStringFromRect(titleFrame));
//    NSLog(@"subtitleFrame %@", NSStringFromRect(subtitleFrame));
    
    if (type == IKImageBrowserCellForegroundLayer) {
        if ([self cellState] != IKImageStateReady) {
            return layer;
        }
        
        layer = [CALayer layer];
        layer.frame = CGRectMake(0, 0, cellFrame.size.width, cellFrame.size.height);
        layer.borderWidth = 1.0;
        

        

        if ([self isSelected]) {

            NSColor *bgColor = [NSColor orangeColor];
            
            CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
            CGColorRef cgColor = CGColorCreateFromNSColor(colorSpace, bgColor);
            CGColorSpaceRelease(colorSpace);
            
            layer.backgroundColor = cgColor;
            
            CGColorRelease(cgColor);
            
            layer.opacity = 0.5;
            
            
            
            NSImage *closeImage = [NSImage imageNamed:@"close-icon.png"];
            NSRect closeRect = NSMakeRect(0, 0, closeImage.size.width, closeImage.size.height);
            
            CALayer *deleteLayer = [CALayer layer];
            [deleteLayer setContents:(id)[closeImage CGImageForProposedRect:&closeRect context:NULL hints:NULL]];
//            deleteLayer.frame = CGRectMake(cellFrame.size.width - 8, 
//                                           (cellFrame.origin.y + cellFrame.size.height) - 8, 
//                                           16, 
//                                           16);
            deleteLayer.frame = CGRectMake(relativeImageFrame.size.width - 8, 
                                           (relativeImageFrame.origin.y + relativeImageFrame.size.height) - 8, 
                                           16, 
                                           16);
            
            [layer addSublayer:deleteLayer];
        }
    }
    
    return layer;
}

@end
