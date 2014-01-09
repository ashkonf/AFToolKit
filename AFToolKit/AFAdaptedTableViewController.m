//
//  AFAdaptedTableViewController.m
//  AFPlatform
//
//  Created by Ashkon Farhangi on 9/2/13.
//  Copyright (c) 2013 Ashkon Farhangi. All rights reserved.
//

#import "AFAdaptedTableViewController.h"

#import "AFTableRowAdapter.h"

@interface AFAdaptedTableViewController ()

@property (nonatomic) NSMutableDictionary *adapters;

@end

@implementation AFAdaptedTableViewController

#pragma mark - Setters and Getters

- (NSMutableDictionary *)adapters
{
    if (!_adapters) {
        _adapters = [[NSMutableDictionary alloc] init];
    }
    return _adapters;
}

#pragma mark - AFAdaptedTableViewDatasource

- (id)objectForTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

- (AFTableRowAdapter *)adapterForObject:(id)object inTableView:(UITableView *)tableView
{
    return nil;
}

#pragma mark - AFAdaptedTableViewDatasource + UITableViewDatasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

#pragma mark - UITableViewDatasource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AFTableRowAdapter *adapter = [self _adapterForTableView:tableView atIndexPath:indexPath];
    return [adapter cellInTableViewController:self];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    AFTableRowAdapter *adapter = [self _adapterForTableView:tableView atIndexPath:indexPath];
    [adapter willDisplayInTableViewController:self];
}

- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    AFTableRowAdapter *adapter = [self _adapterForTableView:tableView atIndexPath:indexPath];
    [adapter didEndDisplayingInTableViewController:self];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AFTableRowAdapter *adapter = [self _adapterForTableView:tableView atIndexPath:indexPath];
    [adapter didSelectInTableViewController:self];
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AFTableRowAdapter *adapter = [self _adapterForTableView:tableView atIndexPath:indexPath];
    [adapter didDeselctInTableViewController:self];
}

#pragma mark - Helper Methods

- (AFTableRowAdapter *)_adapterForTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath
{
    id object = [self objectForTableView:tableView atIndexPath:indexPath];
    AFTableRowAdapter *adapter = self.adapters[object];
    if (!adapter) {
        adapter = [self adapterForObject:object inTableView:tableView];
        self.adapters[object] = adapter;
    }
    return adapter;
}

@end
