//
//  AFViewController.m
//  AFToolKit
//
//  Created by Ashkon Farhangi on 5/20/13.
//  Copyright (c) 2013 Ashkon Farhangi. All rights reserved.
//

#import "AFViewController.h"

// whole class need dynmaic framing (ie using viewdidlayoutsubviews and decomposed frame methods)

@interface AFViewController ()

@property (nonatomic, readwrite) BOOL keyboardVisible;
@property (nonatomic, readwrite) CGRect keyboardFrame;

@property (nonatomic) UIImageView *background;

@end

@implementation AFViewController

- (UIRectEdge)edgesForLayout
{
    return UIRectEdgeNone;
}

- (void)keyboardWillAnimate:(NSNotification *)notification
{
    self.keyboardFrame = [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
}

#pragma mark - NSObject

- (id)init
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    }
    return self;
}

#pragma mark - Miscelaneous

- (void)setBackgroundImage:(UIImage *)image animated:(BOOL)animated
{
    if (animated) {
        UIImageView *tempBackground = [[UIImageView alloc] init];
        tempBackground.image = _background.image;
        tempBackground.frame = CGRectMake(0, 0, _background.frame.size.width, _background.frame.size.height);
        [self.background addSubview:tempBackground];
        self.background.image = image;
        [UIView animateWithDuration:0.3 animations:^{
            tempBackground.alpha = 0;
        } completion:^(BOOL finished) {
            [tempBackground removeFromSuperview];
        }];
    } else {
        self.background.image = image;
    }
}

#pragma mark - Navigation Bar

- (void)setTitle:(NSString *)title
{
    [super setTitle:title];
    
    self.navigationItem.title = title;
}

#pragma mark - UIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) {
        self.edgesForExtendedLayout = [self edgesForLayout];
    }

    [self.view addSubview:self.background];
}

- (BOOL)disablesAutomaticKeyboardDismissal
{
    return NO;
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];

    self.background.frame = [self _backgroundFrame];
}

#pragma mark - Layout

- (CGRect)_backgroundFrame
{
    return self.view.bounds;
}

#pragma mark - Setters and Getters

- (UIImageView *)background
{
    if (!_background) {
        _background = [[UIImageView alloc] init];
    }
    return _background;
}

#pragma mark - Notification Targets

- (void)_keyboardWillShow:(NSNotification *)notification
{
    self.keyboardVisible = YES;
    [self keyboardWillAnimate:notification];
}

- (void)_keyboardWillHide:(NSNotification *)notification
{
    self.keyboardVisible = NO;
    [self keyboardWillAnimate:notification];
}

@end
