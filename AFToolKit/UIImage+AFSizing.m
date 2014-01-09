//
//  UIImage+AFSizing.m
//  AFToolKit
//
//  Created by Ashkon Farhangi on 1/8/14.
//  Copyright (c) 2014 Ashkon Farhangi. All rights reserved.
//

#import "UIImage+AFSizing.h"

@implementation UIImage (AFSizing)

- (UIImage *)af_imageCroppedToRect:(CGRect)rect
{
    // Taken from the folling article:
    // http://iosdevelopertips.com/graphics/how-to-crop-an-image.html
    // Create bitmap image from original image data, using rectangle to specify desired crop area
    CGImageRef imageRef = CGImageCreateWithImageInRect([self CGImage], rect);
    UIImage *croppedImage = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    return croppedImage;
}

- (UIImage *)af_imageCroppedToAspectRatio:(CGFloat)aspectRatio
{
    UIImage *croppedImage = nil;

    if (aspectRatio > 0) {
        CGRect croppedRect;
        CGFloat currentAspectRatio = self.size.width / self.size.height;
        if (aspectRatio < currentAspectRatio) {
            CGFloat width = self.size.height * aspectRatio;
            croppedRect = CGRectMake((self.size.width - width) / 2, 0, width, self.size.height);
        } else {
            CGFloat height = self.size.width / aspectRatio;
            croppedRect = CGRectMake(0, (self.size.height - height) / 2, self.size.width, height);
        }
        croppedImage = [self af_imageCroppedToRect:croppedRect];
    }

    return croppedImage;
}

- (UIImage *)af_imageCroppedToSquare
{
    return [self af_imageCroppedToAspectRatio:1];
}

- (UIImage *)af_imageScaledByFactor:(CGFloat)factor
{
    return [UIImage imageWithCGImage:self.CGImage scale:factor orientation:self.imageOrientation];
}

@end
