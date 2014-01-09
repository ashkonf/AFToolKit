//
//  UIViewController+AFAlertView.h
//  AFToolKit
//
//  Created by Ashkon Farhangi on 1/8/14.
//  Copyright (c) 2014 Ashkon Farhangi. All rights reserved.
//

@interface UIViewController (AFAlertView) <UIAlertViewDelegate>

- (void)af_showErrorWithMessage:(NSString *)message; // Title is "Error"
- (void)af_showAlertWithTitle:(NSString *)title message:(NSString *)message; // Cancel button title is "Ok"
- (void)af_showAlertWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle;
- (void)af_showAlertWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSArray *)otherButtonTitles; // Delegate is self
- (void)af_showAlertWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSArray *)otherButtonTitles delegate:(id<UIAlertViewDelegate>)delegate;

@end
