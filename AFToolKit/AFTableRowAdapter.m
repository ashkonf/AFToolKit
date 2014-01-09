//
//  AFTableCellAdapter.m
//  AFPlatform
//
//  Created by Ashkon Farhangi on 9/1/13.
//  Copyright (c) 2013 Ashkon Farhangi. All rights reserved.
//

#import "AFTableRowAdapter.h"

@interface AFTableRowAdapter()

@property (nonatomic, readwrite) id object;

@end

@implementation AFTableRowAdapter

- (instancetype)initWithObject:(id)object
{
    self = [super init];
    if (self) {
        self.object = object;
    }
    return self;
}

/// good pragma mark?
#pragma mark - Datasource, so to speak

- (UITableViewCell *)cellInTableViewController:(AFAdaptedTableViewController *)tableViewController
{
    return nil;
}

- (CGFloat)heightInTableViewController:(AFAdaptedTableViewController *)tableViewController
{
    return 0;
}

/// good pragma mark?
#pragma mark - Delegate, so to speak

- (void)willDisplayInTableViewController:(AFAdaptedTableViewController *)tableViewController
{
}

- (void)didEndDisplayingInTableViewController:(AFAdaptedTableViewController *)tableViewController
{
}

- (void)didSelectInTableViewController:(AFAdaptedTableViewController *)tableViewController
{
}

- (void)didDeselctInTableViewController:(AFAdaptedTableViewController *)tableViewController
{
}

@end
