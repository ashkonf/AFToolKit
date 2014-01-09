//
//  UIView+AFDrawing.h
//  AFToolKit
//
//  Created by Ashkon Farhangi on 1/8/14.
//  Copyright (c) 2014 Ashkon Farhangi. All rights reserved.
//

@interface UIView (AFDrawing)

// Border
- (void)af_addBorderWithColor:(UIColor *)color width:(CGFloat)width;

// Rounded Rect
- (void)af_makeRoundedRectWithBorderColor:(UIColor *)borderColor;
- (void)af_makeRoundedRectWithBorderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth;
- (void)af_makeRoundedRectWithBorderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth cornerRadius:(CGFloat)cornerRadius;

// Oval Views
- (void)af_makeOvular;
- (void)af_makeOvularWithBorderColor:(UIColor *)borderColor;
- (void)af_makeOvularWithBorderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth;

@end
