//
//  UIViewController+AFNavigation.h
//  AFToolKit
//
//  Created by Ashkon Farhangi on 1/8/14.
//  Copyright (c) 2014 Ashkon Farhangi. All rights reserved.
//

@interface UIViewController (AFNavigation)

- (void)af_addCloseButton;
- (void)af_pushViewController:(UIViewController *)viewController;
- (void)af_pop;
- (void)af_dismiss;
- (void)af_dismissAnimated:(BOOL)animated withCompletion:(void (^)())completion;

@end
