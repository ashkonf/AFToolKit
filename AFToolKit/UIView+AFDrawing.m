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

- (void)af_addBorderWithColor:(UIColor *)color width:(CGFloat)width
{
    self.layer.borderColor = color.CGColor;
    self.layer.borderWidth = width;
}
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
}

- (void)af_makeOvular
{
    [self af_makeOvularWithBorderColor:nil];
}

- (void)af_makeOvularWithBorderColor:(UIColor *)borderColor
{
    [self af_makeOvularWithBorderColor:borderColor borderWidth:DEFAULT_BORDER_WIDTH];
}

- (void)af_makeOvularWithBorderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth
{
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

@end
