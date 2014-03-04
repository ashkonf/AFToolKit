//
//  AFTableViewController.m
//  AFToolKit
//
//  Created by Ashkon Farhangi on 8/23/13.
//  Copyright (c) 2013 Ashkon Farhangi. All rights reserved.
//

#import "AFTableViewController.h"

@interface AFTableViewController ()

@property (nonatomic, readwrite) UITableView *tableView;
@property (nonatomic, readwrite) UITableViewStyle style;

@end

// also should make this class work as child view controller of contianer (ie without navigation controller, etc)

@implementation AFTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super init];
    if (self) {
        // Initialization
    }
    return self;
}

- (void)reloadData
{
    [self.tableView reloadData];
}

#pragma mark - Setters and Getters

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:[self _tableViewFrame] style:self.style];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

#pragma mark - AFViewController

- (UIRectEdge)edgesForLayout
{
    return UIRectEdgeAll;
}

- (void)keyboardWillAnimate:(NSNotification *)notification
{
    [super keyboardWillAnimate:notification];

    [self _setTableViewFrame];
}

#pragma mark - UIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.view addSubview:self.tableView];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];

    [self _setTableViewFrame];
}

#pragma mark - Layout

- (CGRect)_tableViewFrame
{
    return self.view.bounds;
}

- (void)_setTableViewFrame
{
    self.tableView.frame = [self _tableViewFrame];
}

/// should to implement all uitableview datasource and delegate methods?

#pragma mark - UITableViewDatasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
