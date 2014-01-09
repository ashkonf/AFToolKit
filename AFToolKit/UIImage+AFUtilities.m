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

@end
