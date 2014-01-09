//
//  UIImage+AFToolKitResources.m
//  AFToolKit
//
//  Created by Ashkon Farhangi on 1/8/14.
//  Copyright (c) 2014 Ashkon Farhangi. All rights reserved.
//

#import "UIImage+AFToolKitResources.h"

#import "AFToolKitResources.h"
#import "AFToolKitResources.h"

@implementation UIImage (AFToolKitResources)

+ (UIImage*)af_toolKitResourcesImageNamed:(NSString*)imageName
{
    UIImage *image = [UIImage imageNamed:imageName];

    if (!image) {
        image = [UIImage imageWithContentsOfFile:[[[NSBundle af_toolKitBundle] resourcePath] stringByAppendingPathComponent:imageName]];
        //NSLog(@"%@",image);
        //NSLog(@"%@",[NSBundle af_toolKitBundle]);
    }

    return image;
}

/// should have default image category that returns images so don't have to call them by name all over the place

@end
