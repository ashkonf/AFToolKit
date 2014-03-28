//
//  AFStaticTableViewSection.h
//  AFToolKit
//
//  Created by Ashkon Farhangi on 1/16/14.
//  Copyright (c) 2014 Ashkon Farhangi. All rights reserved.
//

@class AFTableRowAdapter;

@interface AFStaticTableViewSection : NSObject

+ (AFStaticTableViewSection *)sectionWithHeader:(NSString *)header footer:(NSString *)footer;

@property (nonatomic, readonly) NSMutableArray *adapters;
@property (nonatomic) NSString *header;
@property (nonatomic) NSString *footer;

- (void)addCellWithAdapter:(AFTableRowAdapter *)adapter;

@end
