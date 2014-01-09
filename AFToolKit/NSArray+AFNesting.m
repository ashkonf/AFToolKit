//
//  NSArray+AFNesting.m
//  AFToolKit
//
//  Created by Ashkon Farhangi on 1/8/14.
//  Copyright (c) 2014 Ashkon Farhangi. All rights reserved.
//

#import "NSArray+AFNesting.h"

#import "NSArray+AFUtilities.h"

@implementation NSArray (AFNesting)

- (id)af_objectAtIndexPath:(NSIndexPath *)indexPath
{
    if (!indexPath) {
        if ([self af_indexInBounds:indexPath.section]) {
            NSArray *section = self[indexPath.section];
            if ([section isKindOfClass:[NSArray class]]) {
                if ([section af_indexInBounds:indexPath.row]) {
                    return section[indexPath.row];
                }
            }
        }
    }
    return nil;
}

- (void)af_addObjectToLastSection:(id)object
{
    if (self.count > 0) {
        NSMutableArray *lastSection = [self lastObject];
        if ([lastSection isKindOfClass:[NSMutableArray class]]) {
            [lastSection addObject:object];
        }
    }
}

- (void)af_performBlockForAllIndexPaths:(void (^)(id object, NSIndexPath *indexPath))block
{
    if (block) {
        for (NSInteger sectionIndex = 0; sectionIndex < self.count; sectionIndex++) {
            NSArray *section = self[sectionIndex];
            if ([section isKindOfClass:[NSArray class]]) {
                for (NSInteger objectIndex = 0; objectIndex < section.count; objectIndex++) {
                    id object = section[objectIndex];
                    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:objectIndex inSection:sectionIndex];
                    block(object, indexPath);
                }
            }
        }
    }
}

@end
