//
//  UIView+AFDrawing.m
//  AFToolKit
//
//  Created by Ashkon Farhangi on 1/8/14.
//  Copyright (c) 2014 Ashkon Farhangi. All rights reserved.
//

#import "UIView+AFDrawing.h"

#define DEFAULT_BORDER_WIDTH 1.0
#define DEFAULT_CORNER_RADIUS 4.0

@implementation UIView (AFDrawing)

#pragma mark - Borders

- (void)af_addBorderWithColor:(UIColor *)color width:(CGFloat)width
{
    self.layer.borderColor = color.CGColor;
    self.layer.borderWidth = width;
}

- (void)af_addTopBorderWithColor:(UIColor *)color width:(CGFloat)width
{
    CGRect frame = CGRectMake(0, 0, self.frame.size.width, width);
    UIViewAutoresizing autoResizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleBottomMargin;
    [self _addOneSidedBorderWithColor:color frame:frame autoResizingMask:autoResizingMask];
}

- (void)af_addBottomBorderWithColor:(UIColor *)color width:(CGFloat)width
{
    CGRect frame = CGRectMake(0, self.frame.size.height - width, self.frame.size.width, width);
    UIViewAutoresizing autoResizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    [self _addOneSidedBorderWithColor:color frame:frame autoResizingMask:autoResizingMask];
}

- (void)af_addLeftBorderWithColor:(UIColor *)color width:(CGFloat)width
{
    CGRect frame = CGRectMake(0, 0, width, self.frame.size.height);
    UIViewAutoresizing autoResizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleRightMargin;
    [self _addOneSidedBorderWithColor:color frame:frame autoResizingMask:autoResizingMask];
}

- (void)af_addRightBorderWithColor:(UIColor *)color width:(CGFloat)width
{
    CGRect frame = CGRectMake(self.frame.size.width - width, 0, width, self.frame.size.height);
    UIViewAutoresizing autoResizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleLeftMargin;
    [self _addOneSidedBorderWithColor:color frame:frame autoResizingMask:autoResizingMask];
}

- (void)_addOneSidedBorderWithColor:(UIColor *)color frame:(CGRect)frame autoResizingMask:(UIViewAutoresizing)autoResizingMask
{
    UIView *border = [[UIView alloc] init];
    border.backgroundColor = color;
    border.frame = frame;
    border.autoresizingMask = autoResizingMask;
    [self addSubview:border];
}

#pragma mark - Rounded Corners

- (void)af_makeRoundedRectWithBorderColor:(UIColor *)borderColor
{
    [self af_makeRoundedRectWithBorderColor:borderColor borderWidth:DEFAULT_BORDER_WIDTH];
}

- (void)af_makeRoundedRectWithBorderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth
{
    [self af_makeRoundedRectWithBorderColor:borderColor borderWidth:borderWidth cornerRadius:DEFAULT_CORNER_RADIUS];
}

- (void)af_makeRoundedRectWithBorderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth cornerRadius:(CGFloat)cornerRadius
{
    [self af_addBorderWithColor:borderColor width:borderWidth];
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = YES;
}

#pragma mark - Ovular Views

- (void)af_makeOvular
{
    [self af_makeOvularWithBorderColor:nil];
}

- (void)af_makeOvularWithBorderColor:(UIColor *)borderColor
{
    [self af_makeOvularWithBorderColor:borderColor borderWidth:DEFAULT_BORDER_WIDTH];
}

/// problem that this has to be called in layout subviews for it to work (whenever size changes, corner radius has to change)

- (void)af_makeOvularWithBorderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth
{
    self.layer.masksToBounds = YES;

    if (self.frame.size.width > self.frame.size.height) {
        self.layer.cornerRadius = self.frame.size.height / 2;
    } else {
        self.layer.cornerRadius = self.frame.size.width / 2;
    }

    if (borderColor) {
        self.layer.borderColor = borderColor.CGColor;
    }

    self.layer.borderWidth = borderWidth;
}

#pragma mark - Resetting Borders

- (void)af_resetEdges
{
    self.layer.cornerRadius = 0;
    self.layer.borderWidth = 0;
    self.layer.masksToBounds = NO;
}

@end
