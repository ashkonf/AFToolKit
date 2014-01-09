//
//  AFViewController.h
//  AFToolKit
//
//  Created by Ashkon Farhangi on 5/20/13.
//  Copyright (c) 2013 Ashkon Farhangi. All rights reserved.
//

@class AFApplicationViewController;
@class AFNavigationController;

@interface AFViewController : UIViewController

- (UIRectEdge)edgesForLayout; // Override to control the extent to which the controller's view's frame extends
- (void)keyboardWillAnimate:(NSNotification *)notification; // Override to add keyboard related responses

@property (nonatomic, readonly, getter = isKeyboardVisible) BOOL keyboardVisible;
@property (nonatomic, readonly) CGRect keyboardFrame;

- (void)setBackgroundImage:(UIImage *)image animated:(BOOL)animated;

@end
