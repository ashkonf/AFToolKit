//
//  AFTextView.m
//  AFToolKit
//
//  Created by Ashkon Farhangi on 1/8/14.
//  Copyright (c) 2014 Ashkon Farhangi. All rights reserved.
//

#import "AFTextView.h"

/// should replace with version from SSToolKit

@interface AFTextView () <UITextViewDelegate>

@property (strong, nonatomic) UITextView *placeholderView;

@end

@implementation AFTextView

+ (AFTextView *)textViewWithText:(NSString *)text placeholder:(NSString *)placeholder
{
    AFTextView *textView = [[AFTextView alloc] init];
    textView.text = text;
    textView.placeholder = placeholder;
    return textView;
}

- (void)setup
{
    self.delegate = self;
    self.placeholderTextColor = [UIColor lightGrayColor];
    self.textColor = [UIColor blackColor];
    self.tintColor = [UIColor blackColor];
}

#pragma mark - Setters + Getters

- (UITextView *)placeholderView
{
    if (!_placeholderView) {
        _placeholderView = [[UITextView alloc] init];
        _placeholderView.userInteractionEnabled = NO;
        [self addSubview:self.placeholderView];
    }
    return _placeholderView;
}

- (void)setText:(NSString *)text
{
    [super setText:text];
    [self updatePlaceholder];
}

- (void)setPlaceholder:(NSString *)placeholder
{
    self.placeholderView.text = placeholder;
}

- (NSString *)placeholder
{
    return self.placeholderView.text;
}

- (void)setPlaceholderTextColor:(UIColor *)placeholderTextColor
{
    self.placeholderView.textColor = placeholderTextColor;
}

- (UIColor *)placeholderTextColor
{
    return self.placeholderView.textColor;
}

- (void)setFont:(UIFont *)font
{
    [super setFont:font];
    self.placeholderView.font = font;
}

#pragma mark - UIView

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.placeholderView.frame = self.bounds;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setup];
}

#pragma mark - UITextViewDelegate

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if (textView == self) {
        [self updatePlaceholder];
    }
}

- (void)textViewDidChange:(UITextView *)textView
{
    if (textView == self) {
        [self updatePlaceholder];
    }
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    if (textView == self) {
        [self updatePlaceholder];
    }
}

- (void)textViewDidChangeSelection:(UITextView *)textView
{
    if (textView == self) {
        [self updatePlaceholder];
    }
}

#pragma mark - Helpers

- (void)updatePlaceholder
{
    if (self.text.length <= 0) {
        self.placeholderView.hidden = NO;
    } else {
        self.placeholderView.hidden = YES;
    }
}

@end
