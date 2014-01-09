//
//  AFSplitViewController.m
//  AFPlatform
//
//  Created by Ashkon Farhangi on 8/31/13.
//  Copyright (c) 2013 Ashkon Farhangi. All rights reserved.
//

#import "AFSplitViewController.h"

#import "AFViewController.h"

@interface AFSplitViewController ()

@end

@implementation AFSplitViewController

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark - Helpers

- (UIViewController *)_dummyNavigationController
{
    AFViewController *dummy = [[AFViewController alloc] init];
    dummy.view.backgroundColor = [UIColor blackColor];
    // maybe add other customizations
    return [[UINavigationController alloc] initWithRootViewController:dummy];
}

#pragma mark - Setters and Getters

- (void)setMasterViewController:(UIViewController *)masterVC
{
    NSMutableArray *viewControllers = [[NSMutableArray alloc] init];
    [viewControllers addObject:masterVC];
    if (!self.viewControllers || self.viewControllers.count < 2 || !self.viewControllers[1]) {
        [viewControllers addObject:[self _dummyNavigationController]];
    } else {
        [viewControllers addObject:self.viewControllers[1]];
    }
    self.viewControllers = viewControllers;
}

- (UIViewController *)masterViewController
{
    if (self.viewControllers && self.viewControllers.count > 0) {
        return self.viewControllers[0];
    }
    return nil;
}

- (void)setDetailViewController:(UIViewController *)detailViewController
{
    NSMutableArray *viewControllers = [[NSMutableArray alloc] init];
    if (!self.viewControllers || self.viewControllers.count < 1 || !self.viewControllers[0]) {
        [viewControllers addObject:[self _dummyNavigationController]];
    } else {
        [viewControllers addObject:self.viewControllers[0]];
    }
    [viewControllers addObject:detailViewController];
    self.viewControllers = viewControllers;
}

- (void)setDetailViewController:(UIViewController *)detailViewController animated:(BOOL)animated
{
    self.detailViewController = detailViewController;

    // could probably do a better animation
    if (animated) {
        detailViewController.view.alpha = 0;
        [UIView animateWithDuration:0.3 animations:^{
            detailViewController.view.alpha = 1;
        }];
    }
}

- (UIViewController *)detailViewController
{
    if (self.viewControllers && self.viewControllers.count > 1) {
        return self.viewControllers[1];
    }
    return nil;
}

- (void)setDetailLeftBarButtonItem:(UIBarButtonItem *)detailLeftBarButtonItem
{
    UIViewController *detailViewController = self.detailViewController;
    if (detailViewController && detailViewController.navigationItem) {
        //detailViewController.navigationItem.leftBarButtonItem = detailLeftBarButtonItem;
    }
}

- (UIBarButtonItem *)detailLeftBarButtonItem
{
    UIViewController *detailViewController = self.detailViewController;
    if (detailViewController && detailViewController.navigationItem) {
        return detailViewController.navigationItem.leftBarButtonItem;
    }
    return nil;
}

#pragma mark - UISplitViewControllerDelegate

- (void)splitViewController:(UISplitViewController*)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem*)barButtonItem forPopoverController:(UIPopoverController*)pc
{
    // should make it an option to add this button (let client supply title)
    /*[barButtonItem setTitle:@""];
    barButtonItem.style = UIBarButtonItemStyleBordered;
    self.detailLeftBarButtonItem = barButtonItem;*/
    // why doesn't this work?
}


- (void)splitViewController:(UISplitViewController*)svc willShowViewController:(UIViewController *)aViewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    self.detailViewController.navigationItem.leftBarButtonItem = nil;
}

@end
