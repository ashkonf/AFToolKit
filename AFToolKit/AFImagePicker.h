//
//  AFImagePicker.h
//  AFToolKit
//
//  Created by Ashkon Farhangi on 12/30/14.
//  Copyright (c) 2014 Ashkon Farhangi. All rights reserved.
//

@protocol AFImagePickerDelegate;

@interface AFImagePicker : NSObject

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController;

- (void)pickImage; // cannot use this on iPad
- (void)pickImageFromRect:(CGRect)rect;
- (void)pickImageFromBarButtonItem:(UIBarButtonItem *)barButtonItem;

@property (nonatomic, readonly) UIViewController *rootViewController;
@property (nonatomic, weak) id<AFImagePickerDelegate> delegate;

@end

@protocol AFImagePickerDelegate <NSObject>

@optional

- (void)imagePicker:(AFImagePicker *)imagePicker didPickImage:(UIImage *)image;
- (void)imagePickerPickedNoImage:(AFImagePicker *)imagePicker; // Called when image picker controller is dismissed without an image being chosen

@end
