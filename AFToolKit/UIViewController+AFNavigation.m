//
//  UIViewController+AFNavigation.m
//  AFToolKit
//
//  Created by Ashkon Farhangi on 1/8/14.
//  Copyright (c) 2014 Ashkon Farhangi. All rights reserved.
//

#import "UIViewController+AFNavigation.h"

@implementation UIViewController (AFNavigation)

- (void)af_addCloseButton
{
    UIBarButtonItem *closeButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemStop target:self action:@selector(af_dismiss)];
    [self.navigationItem setLeftBarButtonItem:closeButtonItem];
}

- (void)af_pushViewController:(UIViewController *)viewController
{
    if (self.navigationController) {
        [self.navigationController pushViewController:viewController animated:YES];
    } else {
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:viewController];
        nav.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        [self presentViewController:nav animated:YES completion:nil];
        [viewController af_addCloseButton];
    }
}

- (void)af_pop
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)af_dismiss
{
    [self af_dismissAnimated:YES withCompletion:nil];
}

- (void)af_dismissAnimated:(BOOL)animated withCompletion:(void (^)())completion
{
    [self.presentingViewController dismissViewControllerAnimated:animated completion:completion];
}

@end
