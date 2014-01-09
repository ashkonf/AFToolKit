//
//  AFActivityToast.m
//  AFToolKit
//
//  Created by Ashkon Farhangi on 1/8/14.
//  Copyright (c) 2014 Ashkon Farhangi. All rights reserved.
//

#import "AFActivityToast.h"

#import "AFActivityIndicatorView.h"
#import "AFToolKitResources.h"

#define ACTIVITY_INDICATOR_DIMENSION (self.frame.size.width / 2.5)
#define CHECK_MARK_DIMENSION (self.frame.size.width / 2)

@interface AFActivityToast()

@property (nonatomic) AFActivityIndicatorView *activityIndicator;
@property (nonatomic) UIImageView *checkMark;

@end

@implementation AFActivityToast

/// should show a check mark when done (should animate in, not appear all of a sudden)
/// could also show some other shit in case of failure

#pragma mark - UIView

- (void)layoutSubviews
{
    [super layoutSubviews];

    self.activityIndicator.frame = [self _activityIndicatorFrame];
    self.checkMark.frame = [self _checkMarkFrame];
}

#pragma mark - Layout

- (CGRect)_activityIndicatorFrame
{
    return self.bounds;
}

- (CGRect)_checkMarkFrame
{
    CGFloat width = CHECK_MARK_DIMENSION;
    CGFloat height = CHECK_MARK_DIMENSION;
    CGFloat xCoord = (self.frame.size.width - width) / 2;
    CGFloat yCoord = (self.frame.size.height - height) / 2;
    return CGRectMake(xCoord, yCoord, width, height);
}

#pragma mark - Dismissal

- (void)dismissSuccessWithCompletion:(void (^)())completion
{
    self.checkMark.alpha = 0;
    [self addSubview:self.checkMark];
    [UIView animateWithDuration:0.3 animations:^{
        self.activityIndicator.alpha = 0;
        self.checkMark.alpha = 1;
    } completion:^ (BOOL finished) {
        [self performSelector:@selector(dismissWithCompletion:) withObject:completion afterDelay:0.3];
    }];
}

- (void)dismissFailureWithCompletion:(void (^)())completion
{
    /// show some sort of indication of failure? (like an X)
    [self dismissWithCompletion:completion];
}

#pragma mark - AFToast

- (void)present
{
    [super present];

    [self addSubview:self.activityIndicator];
    [self.activityIndicator startAnimating];
}

#pragma mark - Setters and Getters

- (AFActivityIndicatorView *)activityIndicator
{
    if (!_activityIndicator) {
        _activityIndicator = [[AFActivityIndicatorView alloc] init];
        _activityIndicator.color = [UIColor blackColor];
        _activityIndicator.size = CGSizeMake(ACTIVITY_INDICATOR_DIMENSION, ACTIVITY_INDICATOR_DIMENSION);
    }
    return _activityIndicator;
}

- (UIImageView *)checkMark
{
    if (!_checkMark) {
        _checkMark = [[UIImageView alloc] init];
        _checkMark.image = [UIImage af_toolKitResourcesImageNamed:@"CheckMark"];///[UIImage imageNamed:@"CheckMark"];
    }
    return _checkMark;
}

@end
