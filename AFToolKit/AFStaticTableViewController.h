//
//  AFStaticTableViewController.h
//  AFToolKit
//
//  Created by Ashkon Farhangi on 1/16/14.
//  Copyright (c) 2014 Ashkon Farhangi. All rights reserved.
//

#import "AFAdaptedTableViewController.h"

@class AFTableRowAdapter;

@interface AFStaticTableViewController : AFAdaptedTableViewController

- (void)addSectionWithHeader:(NSString *)header footer:(NSString *)footer;
- (void)addCellWithAdapter:(AFTableRowAdapter *)adapter;

@end
