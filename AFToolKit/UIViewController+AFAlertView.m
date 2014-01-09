//
//  UIViewController+AFAlertView.m
//  AFToolKit
//
//  Created by Ashkon Farhangi on 1/8/14.
//  Copyright (c) 2014 Ashkon Farhangi. All rights reserved.
//

#import "UIViewController+AFAlertView.h"

@implementation UIViewController (AFAlertView)

/// should these simplifications go into an alert view category instead of a VC category?

- (void)af_showErrorWithMessage:(NSString *)message
{
    [self af_showAlertWithTitle:@"Error" message:message];
}

- (void)af_showAlertWithTitle:(NSString *)title message:(NSString *)message
{
    [self af_showAlertWithTitle:title message:message cancelButtonTitle:@"Ok"];
}

- (void)af_showAlertWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle
{
    [self af_showAlertWithTitle:title message:message cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil];
}

- (void)af_showAlertWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSArray *)otherButtonTitles
{
    [self af_showAlertWithTitle:title message:message cancelButtonTitle:cancelButtonTitle otherButtonTitles:otherButtonTitles delegate:self];
}

- (void)af_showAlertWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSArray *)otherButtonTitles delegate:(id<UIAlertViewDelegate>)delegate
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:delegate cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil];
    if (otherButtonTitles) {
        for (NSString *otherButtonTitle in otherButtonTitles) {
            // If otherButtonTitles contains an element not of class NSString a runtime error will occur
            [alertView addButtonWithTitle:otherButtonTitle];
        }
    }
    [alertView show];
}

@end
