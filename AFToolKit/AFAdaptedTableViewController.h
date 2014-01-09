//
//  AFAdaptedTableViewController.h
//  AFPlatform
//
//  Created by Ashkon Farhangi on 9/2/13.
//  Copyright (c) 2013 Ashkon Farhangi. All rights reserved.
//

#import "AFTableViewController.h"

#import "AFAdaptedTableViewDatasource.h"

@class AFTableRowAdapter;

@interface AFAdaptedTableViewController : AFTableViewController <AFAdaptedTableViewDatasource>

@end
