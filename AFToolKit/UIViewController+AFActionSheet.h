//
//  UIViewController+AFActionSheet.h
//  AFToolKit
//
//  Created by Ashkon Farhangi on 1/8/14.
//  Copyright (c) 2014 Ashkon Farhangi. All rights reserved.
//

@interface UIViewController (AFActionSheet) <UIActionSheetDelegate>

// Delegate is always set to self

- (void)af_showActionSheetWithButtonTitles:(NSArray *)buttonTitles;
- (void)af_showActionSheetWithTitle:(NSString *)title otherButtonTitles:(NSArray *)otherButtonTitles; // Cancel button title is "Cancel"
- (void)af_showActionSheetWithTitle:(NSString *)title cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSArray *)otherButtonTitles;
- (void)af_showActionSheetWithTitle:(NSString *)title cancelButtonTitle:(NSString *)cancelButtonTitle destructiveButtonTitle:(NSString *)destructiveButtonTitle otherButtonTitles:(NSArray *)otherButtonTitles; // Delegate is self
- (void)af_showActionSheetWithTitle:(NSString *)title cancelButtonTitle:(NSString *)cancelButtonTitle destructiveButtonTitle:(NSString *)destructiveButtonTitle otherButtonTitles:(NSArray *)otherButtonTitles delegate:(id<UIActionSheetDelegate>)delegate;

@end
