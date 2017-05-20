//
//  ImageItem.h
//  MacpViewer
//
//  Created by Basil Nikityuk on 5/20/17.
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageItem : NSObject
@property (nonatomic, copy) NSString *filePath;

+ (id)imageWithFilePath:(NSString *)filePath;
- (id)initWithFilePath:(NSString *)filePath;

@end
