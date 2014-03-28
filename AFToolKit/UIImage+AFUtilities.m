//
//  UIImage+AFUtilities.m
//  AFToolKit
//
//  Created by Ashkon Farhangi on 1/8/14.
//  Copyright (c) 2014 Ashkon Farhangi. All rights reserved.
//

#import "UIImage+AFUtilities.h"

@implementation UIImage (AFUtilities)

+ (UIImage *)af_imageNamed:(NSString *)imageName bundleName:(NSString *)bundleName
{
    /// style not consistent with mine, of only having a single return statement and defining return value at top
	if (!bundleName) {
		return [UIImage imageNamed:imageName];
	}

	NSString *resourcePath = [[NSBundle mainBundle] resourcePath];
	NSString *bundlePath = [resourcePath stringByAppendingPathComponent:bundleName];
	NSString *imagePath = [bundlePath stringByAppendingPathComponent:imageName];
	return [UIImage imageWithContentsOfFile:imagePath];
}

/**
 * Taken from: https://stackoverflow.com/questions/990976/how-to-create-a-colored-1x1-uiimage-on-the-iphone-dynamically
 */
+ (UIImage *)af_imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return image;
}

@end
