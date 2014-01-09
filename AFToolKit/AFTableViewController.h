//
//  AFTableViewController.h
//  AFToolKit
//
//  Created by Ashkon Farhangi on 8/23/13.
//  Copyright (c) 2013 Ashkon Farhangi. All rights reserved.
//

#import "AFViewController.h"

@interface AFTableViewController : AFViewController <UITableViewDelegate, UITableViewDataSource>

- (id)initWithStyle:(UITableViewStyle)style;

@property (nonatomic, readonly) UITableView *tableView;
@property (nonatomic, readonly) UITableViewStyle style;

@end
