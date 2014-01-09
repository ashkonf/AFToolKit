//
//  AFTableCellAdapter.h
//  AFPlatform
//
//  Created by Ashkon Farhangi on 9/1/13.
//  Copyright (c) 2013 Ashkon Farhangi. All rights reserved.
//

@class AFAdaptedTableViewController;

@protocol AFTableRowAdapterDelegate;

@interface AFTableRowAdapter : NSObject

- (instancetype)initWithObject:(id)object;

@property (nonatomic, readonly) id object;

// Data source, so to speak
- (UITableViewCell *)cellInTableViewController:(AFAdaptedTableViewController *)tableViewController;
- (CGFloat)heightInTableViewController:(AFAdaptedTableViewController *)tableViewController;

// Delegate, so to speak
/// basing method names sorta off of UITableViewDelegate methods (really just inspired by)
/// add in cell arguments? if sticking with delegate thing where can just ask for argument, no need. good thing about delegate is that allows access to cell outside of table view events (like events relevant to shit having loaded)
/// don't like that have object in name when object is no arg, and that arg name is not right before arg
- (void)willDisplayInTableViewController:(AFAdaptedTableViewController *)tableViewController;
- (void)didEndDisplayingInTableViewController:(AFAdaptedTableViewController *)tableViewController;
- (void)didSelectInTableViewController:(AFAdaptedTableViewController *)tableViewController;
- (void)didDeselctInTableViewController:(AFAdaptedTableViewController *)tableViewController;

@property (nonatomic) id<AFTableRowAdapterDelegate> delegate;

@end

/// not really a delegate or datasource
@protocol AFTableRowAdapterDelegate <NSObject>

- (UITableViewCell *)cellForAdapter:(AFTableRowAdapter *)adapter;
//- (void)reloadCellForData /// need method that tells TVC this cell needs to be reloaded
/// could even supply an animated parameter, or leave that up to TVC maybe

@end
