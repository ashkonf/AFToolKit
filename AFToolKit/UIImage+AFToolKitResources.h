//
//  UIImage+AFToolKitResources.h
//  AFToolKit
//
//  Created by Ashkon Farhangi on 1/8/14.
//  Copyright (c) 2014 Ashkon Farhangi. All rights reserved.
//

@interface UIImage (AFToolKitResources)

/**
 * If client of AFToolKit has image of same name, that image will be used
 * instead. The image from AFToolKitResources will  be overridden, so to
 * speak.
 */
+ (UIImage*)af_toolKitResourcesImageNamed:(NSString*)imageName;

@end
