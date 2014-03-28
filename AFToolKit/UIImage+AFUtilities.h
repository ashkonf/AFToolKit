//
//  UIImage+AFUtilities.h
//  AFToolKit
//
//  Created by Ashkon Farhangi on 1/8/14.
//  Copyright (c) 2014 Ashkon Farhangi. All rights reserved.
//

@interface UIImage (AFUtilities)

+ (UIImage *)af_imageNamed:(NSString *)imageName bundleName:(NSString *)bundleName;
+ (UIImage *)af_imageWithColor:(UIColor *)color;

@end
