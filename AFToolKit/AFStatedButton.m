//
//  AFStatedButton.m
//  AFToolKit
//
//  Created by Ashkon Farhangi on 3/26/14.
//  Copyright (c) 2014 Ashkon Farhangi. All rights reserved.
//

#import "AFStatedButton.h"

@implementation AFStatedButton

#pragma mark - Initialization

- (void)_setup
{
    [self addTarget:self action:@selector(_tapped) forControlEvents:UIControlEventTouchUpInside];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self _setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self _setup];
    }
    return self;
}

#pragma mark - Setters and Getters

- (void)setSelectedImage:(UIImage *)selectedImage
{
    _selectedImage = selectedImage;
    if (self.isSelected) {
        [self setBackgroundImage:selectedImage forState:UIControlStateNormal];
    }
}

- (void)setUnselectedImage:(UIImage *)unselectedImage
{
    _unselectedImage = unselectedImage;
    if (!self.isSelected) {
        [self setBackgroundImage:unselectedImage forState:UIControlStateNormal];
    }
}

#pragma mark - Targets

- (void)_tapped
{
    [self setBackgroundImage:((self.isSelected) ? self.selectedImage : self.unselectedImage) forState:UIControlStateNormal];
    self.selected = !self.selected;

    if ([self.delegate respondsToSelector:@selector(statedButtonWasSelected:)]) {
        [self.delegate statedButtonWasSelected:self];
    }
}

@end
