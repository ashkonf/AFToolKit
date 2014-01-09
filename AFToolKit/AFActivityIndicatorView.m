//
//  AFActivityIndicatorView.m
//  AFToolKit
//
//  Created by Ashkon Farhangi on 1/8/14.
//  Copyright (c) 2014 Ashkon Farhangi. All rights reserved.
//

#import "AFActivityIndicatorView.h"

#define UI_ACTIVITY_INDICATOR_VIEW_DEFAULT_SIZE CGSizeMake(20, 20)

@implementation AFActivityIndicatorView

@synthesize size = _size;

#pragma mark - Setters and Getters

- (void)setSize:(CGSize)size
{
    CGFloat widthTransform = size.width / self.size.width;
    CGFloat heightTransform = size.height / self.size.height;
    self.transform = CGAffineTransformMakeScale(widthTransform, heightTransform);
    _size = size;
}

- (CGSize)size
{
    if (CGSizeEqualToSize(_size, CGSizeZero)) {
        _size = UI_ACTIVITY_INDICATOR_VIEW_DEFAULT_SIZE;
    }
    return _size;
}

@end
