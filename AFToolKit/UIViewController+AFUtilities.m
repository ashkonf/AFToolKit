//
//  UIViewController+AFUtilities.m
//  AFToolKit
//
//  Created by Ashkon Farhangi on 1/8/14.
//  Copyright (c) 2014 Ashkon Farhangi. All rights reserved.
//

#import "UIViewController+AFUtilities.h"

@implementation UIViewController (AFUtilities)

+ (UINavigationController *)af_viewInNavigationController
{
    UIViewController *viewController = [[self alloc] init];
    return [[UINavigationController alloc] initWithRootViewController:viewController];
}

@end
