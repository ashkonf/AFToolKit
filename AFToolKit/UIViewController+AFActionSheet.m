//
//  UIViewController+AFActionSheet.m
//  AFToolKit
//
//  Created by Ashkon Farhangi on 1/8/14.
//  Copyright (c) 2014 Ashkon Farhangi. All rights reserved.
//

#import "UIViewController+AFActionSheet.h"

#import "AFUtilities.h"

@implementation UIViewController (AFActionSheet)

/// should these simplifications go into an action shet category instead of a Tab Bar Controller category?
/// or should instead go into a VC category?

- (void)af_showActionSheetWithButtonTitles:(NSArray *)buttonTitles
{
    [self af_showActionSheetWithTitle:nil otherButtonTitles:buttonTitles];
}

- (void)af_showActionSheetWithTitle:(NSString *)title otherButtonTitles:(NSArray *)otherButtonTitles
{
    [self af_showActionSheetWithTitle:title cancelButtonTitle:@"Cancel" otherButtonTitles:otherButtonTitles];
}

- (void)af_showActionSheetWithTitle:(NSString *)title cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSArray *)otherButtonTitles
{
    [self af_showActionSheetWithTitle:title cancelButtonTitle:cancelButtonTitle destructiveButtonTitle:nil otherButtonTitles:otherButtonTitles];
}

- (void)af_showActionSheetWithTitle:(NSString *)title cancelButtonTitle:(NSString *)cancelButtonTitle destructiveButtonTitle:(NSString *)destructiveButtonTitle otherButtonTitles:(NSArray *)otherButtonTitles
{
    [self af_showActionSheetWithTitle:title cancelButtonTitle:cancelButtonTitle destructiveButtonTitle:destructiveButtonTitle otherButtonTitles:otherButtonTitles delegate:self];
}

- (void)af_showActionSheetWithTitle:(NSString *)title cancelButtonTitle:(NSString *)cancelButtonTitle destructiveButtonTitle:(NSString *)destructiveButtonTitle otherButtonTitles:(NSArray *)otherButtonTitles delegate:(id<UIActionSheetDelegate>)delegate
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:title delegate:delegate cancelButtonTitle:nil destructiveButtonTitle:destructiveButtonTitle otherButtonTitles:nil];
    // don't make destructive button title nil becuase it actually should go first

    if (otherButtonTitles) {
        for (NSString *otherButtonTitle in otherButtonTitles) {
            // If otherButtonTitles contains an element not of class NSString a runtime error will occur
            [actionSheet addButtonWithTitle:otherButtonTitle];
        }
    }

    if (cancelButtonTitle) {
        actionSheet.cancelButtonIndex = [actionSheet addButtonWithTitle:cancelButtonTitle];
    }

    if ([AFUtilities onIpad]) {
        [actionSheet showInView:self.view];
    } else {
        if (self.tabBarController) {
            [actionSheet showFromTabBar:self.tabBarController.tabBar];
        } else {
            [actionSheet showFromRect:self.view.frame inView:self.view animated:YES];
        }
    }
}

@end
