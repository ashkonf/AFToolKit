//
//  AFTableViewController.m
//  AFToolKit
//
//  Created by Ashkon Farhangi on 8/23/13.
//  Copyright (c) 2013 Ashkon Farhangi. All rights reserved.
//

#import "AFTableViewController.h"

#import "AFTableViewCell.h"

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
        self.style = style;
        self.automaticallyAdjustsScrollViewInsets = YES;
    }
    return self;
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
    CGRect tableViewFrame = self.view.bounds;
    CGRect intersection = CGRectIntersection(self.keyboardFrame, self.view.frame);
    tableViewFrame.size.height -= intersection.size.height;
    return tableViewFrame;
}

- (void)_setTableViewFrame
{
    CGRect tableViewFrame = [self _tableViewFrame];

    // We animate the frame setting only if frame has been set in past
    if (CGRectEqualToRect(self.tableView.frame, CGRectZero)) {
        self.tableView.frame = tableViewFrame;

    } else {
        [UIView animateWithDuration:0.5 animations:^{
            self.tableView.frame = tableViewFrame;
        }];
    }
}
// should to implement all uitableview datasource and delegate methods

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

//// get rid of once make heights all generalized with adapted TVCs
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return tableView.rowHeight;
}

@end
