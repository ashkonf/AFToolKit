//
//  UIView+AFDrawing.h
//  AFToolKit
//
//  Created by Ashkon Farhangi on 1/8/14.
//  Copyright (c) 2014 Ashkon Farhangi. All rights reserved.
//

@interface UIView (AFDrawing)

// Borders
- (void)af_addBorderWithColor:(UIColor *)color width:(CGFloat)width;
- (void)af_addTopBorderWithColor:(UIColor *)color width:(CGFloat)width;
- (void)af_addBottomBorderWithColor:(UIColor *)color width:(CGFloat)width;
- (void)af_addLeftBorderWithColor:(UIColor *)color width:(CGFloat)width;
- (void)af_addRightBorderWithColor:(UIColor *)color width:(CGFloat)width;

// Rounded Corners
- (void)af_makeRoundedRectWithBorderColor:(UIColor *)borderColor;
- (void)af_makeRoundedRectWithBorderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth;
- (void)af_makeRoundedRectWithBorderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth cornerRadius:(CGFloat)cornerRadius;

// Ovular Views
- (void)af_makeOvular;
- (void)af_makeOvularWithBorderColor:(UIColor *)borderColor;
- (void)af_makeOvularWithBorderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth;

// Reseting
- (void)af_resetEdges;

@end
