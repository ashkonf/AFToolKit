//
//  AFImagePicker.m
//  AFToolKit
//
//  Created by Ashkon Farhangi on 12/30/14.
//  Copyright (c) 2014 Ashkon Farhangi. All rights reserved.
//

#import "AFImagePicker.h"

#import "UIViewController+AFActionSheet.h"
#import "UIViewController+AFAlertView.h"
#import "AFUtilities.h"

#define CAMERA_INDEX 0
#define PHOTO_LIBRARY_INDEX 1
#define SAVED_PHOTOS_ALBUM_INDEX 2

/// would be nice if found way to make this functionatliy into VC category instead of standalone object that requires instantation

@interface AFImagePicker() <UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIPopoverControllerDelegate, UIActionSheetDelegate>

@property (nonatomic, readwrite) UIViewController *rootViewController;

@property (nonatomic) UIPopoverController *popoverController;

@property (nonatomic) CGRect rect;
@property (nonatomic) UIBarButtonItem *barButtonItem;

@end

@implementation AFImagePicker

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController
{
    self = [super init];
    if (self) {
        self.rootViewController = rootViewController;
    }
    return self;
}

- (void)pickImage
{
    if ([AFUtilities onIpad]) {
        [NSException raise:@"AF: Attempting to show image picker without popover." format:@""];
    }
    [self _showActionSheet];
}

- (void)pickImageFromRect:(CGRect)rect
{
    self.rect = rect;
    [self _showActionSheet];
}

- (void)pickImageFromBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    self.barButtonItem = barButtonItem;
    [self _showActionSheet];
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)imagePickerController didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    UIGraphicsBeginImageContextWithOptions(image.size, NO, image.scale);
    [image drawInRect:(CGRect) {0, 0, image.size} ];
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    [self _dismissImagePickerController:imagePickerController];

    if ([self.delegate respondsToSelector:@selector(imagePicker:didPickImage:)]) {
        [self.delegate imagePicker:self didPickImage:image];
    }
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)imagePickerController
{
    [self _dismissImagePickerController:imagePickerController];
    [self _notifyDelegateOfCancellation];
}

#pragma mark - UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex != actionSheet.cancelButtonIndex && buttonIndex != actionSheet.destructiveButtonIndex) {
        if (buttonIndex == CAMERA_INDEX) {
            [self _showPickerOfType:UIImagePickerControllerSourceTypeCamera];

        } else if (buttonIndex == PHOTO_LIBRARY_INDEX) {
            [self _showPickerOfType:UIImagePickerControllerSourceTypePhotoLibrary];

        } else if (buttonIndex == SAVED_PHOTOS_ALBUM_INDEX) {
            [self _showPickerOfType:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
        }
    }
}

#pragma mark - UIPopoverDelegate

- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController
{
    [self _notifyDelegateOfCancellation];
}

#pragma mark - Helper Methods

- (void)_showActionSheet
{
    [self.rootViewController af_showActionSheetWithTitle:nil cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@[@"Take Picture", @"Choose Picture from Library", @"Choose Picture from Album"] delegate:self];
}

- (void)_showPickerOfType:(UIImagePickerControllerSourceType)type
{
    if ([UIImagePickerController isSourceTypeAvailable:type]) {
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
        imagePickerController.delegate = self;
		imagePickerController.sourceType = type;

        if (!CGRectEqualToRect(self.rect, CGRectZero) || self.barButtonItem) {
            self.popoverController = [[UIPopoverController alloc] initWithContentViewController:imagePickerController];
            self.popoverController.delegate = self;

            if (self.barButtonItem) {
                [self.popoverController presentPopoverFromBarButtonItem:self.barButtonItem permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
            } else {
                [self.popoverController presentPopoverFromRect:self.rect inView:self.rootViewController.view  permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
            }

        } else {
            [self.rootViewController presentViewController:imagePickerController animated:YES completion:nil];
        }

	} else {
        NSString *errorMessage = [self _imagePickerNameFromType:type];
        errorMessage = [errorMessage stringByAppendingString:@" is not available."];
		[self.rootViewController af_showErrorWithMessage:errorMessage];
	}
}

- (void)_presentImagePicker:(UIImagePickerController *)imagePicker fromBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    if ([AFUtilities onIpad]) {
        UIPopoverController *popoverController = [[UIPopoverController alloc] initWithContentViewController:imagePicker];
        popoverController.delegate = self; /// get rid of if don't need
        [popoverController presentPopoverFromBarButtonItem:barButtonItem permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    } else {
        [self.rootViewController presentViewController:imagePicker animated:YES completion:nil];
    }
}

- (NSString *)_imagePickerNameFromType:(UIImagePickerControllerSourceType)type
{
    NSString *name = nil;

    if (type == UIImagePickerControllerSourceTypeCamera) {
        name = @"Camera";

    } else if (type == UIImagePickerControllerSourceTypePhotoLibrary) {
        name = @"Photo library";

    } else if (type == UIImagePickerControllerSourceTypeSavedPhotosAlbum) {
        name = @"Saved photos";
    }

    return name;
}

- (void)_dismissImagePickerController:(UIImagePickerController *)imagePickerController
{
    self.rect = CGRectZero;
    self.barButtonItem = nil;

    if ([imagePickerController.presentingViewController isKindOfClass:[UIPopoverController class]]) {
        [(UIPopoverController *)imagePickerController.presentingViewController dismissPopoverAnimated:YES];
    } else {
        [imagePickerController.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)_notifyDelegateOfCancellation
{
    if ([self.delegate respondsToSelector:@selector(imagePickerPickedNoImage:)]) {
        [self.delegate imagePickerPickedNoImage:self];
    }
}

@end
