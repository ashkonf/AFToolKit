//
//  AFImageCell.m
//  AFToolKit
//
//  Created by Ashkon Farhangi on 1/7/14.
//  Copyright (c) 2014 Ashkon Farhangi. All rights reserved.
//

#import "AFImageCell.h"

@interface AFImageCell()

@property (nonatomic) UIImageView *backgroundImageView;

@end

@implementation AFImageCell

#pragma mark - AFTableViewCell

- (CGFloat)heightInTableView:(UITableView *)tableView
{
    CGFloat height = 0;

    if (self.image) {
        height = self.frame.size.width / self.image.size.width * self.image.size.height;
    }

    return height;
}

#pragma mark - UITableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.backgroundImageView];
    }
    return self;
}

#pragma mark - Getters and Setters

- (void)setImage:(UIImage *)image
{
    self.backgroundImageView.image = image;
}

- (UIImage *)image
{
    return self.backgroundImageView.image;
}

- (UIImageView *)backgroundImageView
{
    if (!_backgroundImageView) {
        _backgroundImageView = [[UIImageView alloc] init];
        _backgroundImageView.frame = self.contentView.bounds;
        _backgroundImageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    return _backgroundImageView;
}

@end
