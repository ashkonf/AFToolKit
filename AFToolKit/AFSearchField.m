//
//  AFSearchField.m
//  AFToolKit
//
//  Created by Ashkon Farhangi on 1/8/14.
//  Copyright (c) 2014 Ashkon Farhangi. All rights reserved.
//

#import "AFSearchField.h"

@implementation AFSearchField

- (void)setup
{
    // Add the magnifying glass icon to the left side of the text field
    UILabel *magGlassIcon = [[UILabel alloc] init];
    magGlassIcon.text = @" 🔍";
    [magGlassIcon sizeToFit];
    magGlassIcon.backgroundColor = [UIColor clearColor];
    self.leftView = magGlassIcon;
    self.leftViewMode = UITextFieldViewModeAlways;
}

#pragma mark - UIView

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setup];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

@end
