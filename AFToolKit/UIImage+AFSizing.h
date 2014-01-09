//
//  UIImage+AFSizing.h
//  AFToolKit
//
//  Created by Ashkon Farhangi on 1/8/14.
//  Copyright (c) 2014 Ashkon Farhangi. All rights reserved.
//

@interface UIImage (AFSizing)

- (UIImage *)af_imageCroppedToRect:(CGRect)rect;
- (UIImage *)af_imageCroppedToAspectRatio:(CGFloat)aspectRatio; // aspect ratio = width / height
- (UIImage *)af_imageCroppedToSquare;
- (UIImage *)af_imageScaledByFactor:(CGFloat)factor; // factor must be greater than 0.0

@end
