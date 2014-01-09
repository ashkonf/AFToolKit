//
//  UITableViewCell+AFUtilities.h
//  AFToolKit
//
//  Created by Ashkon Farhangi on 8/7/13.
//  Copyright (c) 2013 Ashkon Farhangi. All rights reserved.
//

@interface UITableViewCell (AFUtilities)

+ (instancetype)af_cellForTableView:(UITableView *)tableView withStyle:(UITableViewCellStyle)style;
+ (instancetype)af_cellForTableView:(UITableView *)tableView;
+ (instancetype)af_staticCellWithStyle:(UITableViewCellStyle)style;
+ (instancetype)af_staticCell;

@end
