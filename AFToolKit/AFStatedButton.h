//
//  AFStatedButton.h
//  AFToolKit
//
//  Created by Ashkon Farhangi on 3/26/14.
//  Copyright (c) 2014 Ashkon Farhangi. All rights reserved.
//

#import "AFButton.h"

@class AFStatedButton;

@protocol AFStatedButtonDelegate <NSObject>

- (void)statedButtonWasSelected:(AFStatedButton *)statedButton;

@end

@interface AFStatedButton : AFButton

@property (nonatomic, getter = isSelected) BOOL selected;
@property (nonatomic) UIImage *selectedImage;
@property (nonatomic) UIImage *unselectedImage;

@property (nonatomic, weak) id<AFStatedButtonDelegate> delegate;

@end
