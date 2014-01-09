//
//  AFToast.m
//  AFToolKit
//
//  Created by Ashkon Farhangi on 1/8/14.
//  Copyright (c) 2014 Ashkon Farhangi. All rights reserved.
//

#import "AFToast.h"

#import "AFToolKitResources.h"

#define DIMENSION 130 /// should this be made publicly alterable? also different for ipad?
#define FADE_IN_ANIMATION_DURATION 0.5
#define FADE_OUT_ANIMATION_DURATION 0.3
#define BACKGROUND_OPACITY 0.3

static NSMutableArray *__toasts__;

@interface AFToast()

@property (nonatomic) UIImageView *backgroundView;

@end

@implementation AFToast

- (void)present
{
    // This prevents more than one toast from ever being present
    [[self _toasts] makeObjectsPerformSelector:@selector(dismissWithCompletion:) withObject:nil];
    [[self _toasts] addObject:self];

    /// deal with screen rotations?
    /// do expansion from single point animation too? (could augment with spring shit)
    self.frame = [self _frame];
    [[[UIApplication sharedApplication] keyWindow] addSubview:self];

    // Fade in
    self.alpha = 0.0;
    [UIView animateWithDuration:FADE_IN_ANIMATION_DURATION animations:^{
        self.alpha = 1.0;
    }];

}

- (void)dismissWithCompletion:(void (^)())completion
{
    [[self _toasts] removeObject:self];

    [UIView animateWithDuration:FADE_OUT_ANIMATION_DURATION animations:^{
        // First fade out
        self.alpha = 0.0;

    } completion:^ (BOOL finished) {
        // Then remove from superview to kill last strong pointer to self and thereby destroy self
        [self removeFromSuperview];

        if (completion) {
            completion();
        }
    }];
}

#pragma mark - Toasts Array

- (NSMutableArray *)_toasts
{
    return [[self class] _toasts];
}

+ (NSMutableArray *)_toasts
{
    @synchronized (__toasts__) {
        if (!__toasts__) {
            __toasts__ = [[NSMutableArray alloc] init];
        }
    }
    return __toasts__;
}

#pragma mark - Helper Methods

- (void)_setup
{
    [self addSubview:self.backgroundView];
}

#pragma mark - UIView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self _setup];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];

    self.backgroundView.frame = self.bounds;
}

#pragma mark - Layout

- (CGRect)_frame
{
    CGFloat width = DIMENSION;
    CGFloat height = DIMENSION;
    CGFloat xCoord = ([[UIApplication sharedApplication] keyWindow].frame.size.width - width) / 2;
    CGFloat yCoord = ([[UIApplication sharedApplication] keyWindow].frame.size.height - height) / 2;
    return CGRectMake(xCoord, yCoord, width, height);
}

#pragma mark - Getters and Setters

- (UIImageView *)backgroundView
{
    if (!_backgroundView) {
        _backgroundView = [[UIImageView alloc] init];
        _backgroundView.image = [UIImage af_toolKitResourcesImageNamed:@"ToastBackground"];///[UIImage imageNamed:@"ToastBackground"];
        _backgroundView.alpha = BACKGROUND_OPACITY;
    }
    return _backgroundView;
}

@end
