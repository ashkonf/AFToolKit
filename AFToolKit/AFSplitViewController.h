//
//  AFSplitViewController.h
//  AFToolKit
//
//  Created by Ashkon Farhangi on 8/31/13.
//  Copyright (c) 2013 Ashkon Farhangi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AFSplitViewController : UISplitViewController

@property (nonatomic) UIViewController *masterViewController;
@property (nonatomic) UIViewController *detailViewController;
- (void)setDetailViewController:(UIViewController *)detailViewController animated:(BOOL)animated;
@property (nonatomic) UIBarButtonItem *detailLeftBarButtonItem;

@end
