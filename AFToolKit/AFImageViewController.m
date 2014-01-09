//
//  AFImageViewController.m
//  AFToolKit
//
//  Created by Ashkon Farhangi on 1/7/14.
//  Copyright (c) 2014 Ashkon Farhangi. All rights reserved.
//

#import "AFImageViewController.h"

#import "UIViewController+AFNavigation.h"

@interface AFImageViewController ()

@property (nonatomic) UIButton *background;
@property (nonatomic) UIButton *imageView;

@end

@implementation AFImageViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self.view addSubview:self.background];
        [self.view addSubview:self.imageView];
    }
    return self;
}

#pragma mark - UIViewController

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];

    self.background.frame = [self _backgroundFrame];
    self.imageView.frame = [self _imageViewFrame];
}

#pragma mark - Layout

- (CGRect)_backgroundFrame
{
    return self.view.bounds;
}

- (CGRect)_imageViewFrame
{
    if (self.image) {
        CGFloat imageRatio = _image.size.width / _image.size.height;
        CGFloat viewRatio = self.view.frame.size.width / self.view.frame.size.height;
        if (imageRatio > viewRatio) {
            // image is wider in ratio than is view (ie width will be constraint)
            CGFloat width = self.view.frame.size.width;
            CGFloat height = width * _image.size.height / _image.size.width;
            CGFloat xCoord = 0;
            CGFloat yCoord = (self.view.frame.size.height - height) / 2;
            return CGRectMake(xCoord, yCoord, width, height);
        } else {
            CGFloat height = self.view.frame.size.height;
            CGFloat width = height * _image.size.width / _image.size.height;
            CGFloat xCoord = (self.view.frame.size.width - width) / 2;
            CGFloat yCoord = 0;
            return CGRectMake(xCoord, yCoord, width, height);
        }
    }
    return CGRectZero;
}

#pragma mark - Setters and Getters

- (UIButton *)background
{
    if (!_background) {
        _background = [UIButton buttonWithType:UIButtonTypeCustom];
        _background.backgroundColor = [UIColor blackColor];
        [_background addTarget:self action:@selector(af_dismiss) forControlEvents:UIControlEventTouchUpInside];
    }
    return _background;
}

- (UIButton *)imageView
{
    if (!_imageView) {
        _imageView = [UIButton buttonWithType:UIButtonTypeCustom];
        _imageView.adjustsImageWhenHighlighted = NO;
        [_imageView addTarget:self action:@selector(af_dismiss) forControlEvents:UIControlEventTouchUpInside];
    }
    return _imageView;
}

- (void)setImage:(UIImage *)image
{
    _image = image;
    [self.imageView setBackgroundImage:image forState:UIControlStateNormal];
    [self viewDidLayoutSubviews]; /// hacky
}

@end
