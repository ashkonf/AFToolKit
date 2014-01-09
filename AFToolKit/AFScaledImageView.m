//
//  AFScaledImageView.m
//  AFToolKit
//
//  Created by Ashkon Farhangi on 1/8/14.
//  Copyright (c) 2014 Ashkon Farhangi. All rights reserved.
//

#import "AFScaledImageView.h"

@interface AFScaledImageView()

@property (strong, nonatomic) UIImageView *imageView;

@end

@implementation AFScaledImageView

#pragma mark - Setters and Getters

- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        [self addSubview:_imageView];
    }
    return _imageView;
}

- (void)setImage:(UIImage *)image
{
    self.imageView.image = image;
    [self setNeedsLayout];
}

- (UIImage *)image
{
    return self.imageView.image;
}

#pragma mark - UIView

- (void)layoutSubviews
{
    [super layoutSubviews];

    if (self.image) {
        // This scaling ensures that the image covers the entire view while maintaining its aspect ratio

        CGFloat imageRatio = self.image.size.width / self.image.size.height;
        CGFloat viewRatio = self.bounds.size.width / self.bounds.size.height;

        if (imageRatio < viewRatio) {
            CGFloat width = self.bounds.size.width;
            CGFloat height = width / imageRatio;
            CGFloat xCoord = 0;
            CGFloat yCoord = (self.bounds.size.height - height) / 2;
            self.imageView.frame = CGRectMake(xCoord, yCoord, width, height);

        } else {
            CGFloat height = self.bounds.size.height;
            CGFloat width = height * imageRatio;
            CGFloat xCoord = (self.bounds.size.width - width) / 2;
            CGFloat yCoord = 0;
            self.imageView.frame = CGRectMake(xCoord, yCoord, width, height);
        }
    }
}

@end
