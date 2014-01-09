//
//  AFTableViewCell.h
//  AFToolKit
//
//  Created by Ashkon Farhangi on 1/8/14.
//  Copyright (c) 2014 Ashkon Farhangi. All rights reserved.
//

@protocol AFTableViewCellDelegate;

@interface AFTableViewCell : UITableViewCell

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier;
- (CGFloat)heightInTableView:(UITableView *)tableView;

@property (nonatomic) id<AFTableViewCellDelegate> delegate;

@end

@protocol AFTableViewCellDelegate <NSObject>

- (void)tableViewCell:(AFTableViewCell *)tableViewCell updatedToContentHeight:(CGFloat)contentHeight;

@end
