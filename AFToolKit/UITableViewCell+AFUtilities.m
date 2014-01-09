//
//  UITableViewCell+AFUtilities.m
//  AFToolKit
//
//  Created by Ashkon Farhangi on 8/7/13.
//  Copyright (c) 2013 Ashkon Farhangi. All rights reserved.
//

#import "UITableViewCell+AFUtilities.h"

@implementation UITableViewCell (AFUtilities)

+ (instancetype)af_cellForTableView:(UITableView *)tableView withStyle:(UITableViewCellStyle)style
{
    NSString *CellIdentifier = NSStringFromClass(self);
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[self alloc] initWithStyle:style reuseIdentifier:CellIdentifier];
    }
    return cell;
}

+ (instancetype)af_cellForTableView:(UITableView *)tableView
{
    return [self af_cellForTableView:tableView withStyle:UITableViewCellStyleDefault];
}

/// best to not take in table view? any reason to need it?
+ (instancetype)af_staticCellWithStyle:(UITableViewCellStyle)style
{
    NSString *CellIdentifier = [NSStringFromClass(self) stringByAppendingString:@"**Static"]; /// best identifier?
    UITableViewCell *cell = [[self alloc] initWithStyle:style reuseIdentifier:CellIdentifier];
    return cell;
}

+ (instancetype)af_staticCell
{
    return [self af_staticCellWithStyle:UITableViewCellStyleDefault];
}

@end
