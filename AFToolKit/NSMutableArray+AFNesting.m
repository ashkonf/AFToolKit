//
//  NSMutableArray+AFNesting.m
//  AFToolKit
//
//  Created by Ashkon Farhangi on 1/8/14.
//  Copyright (c) 2014 Ashkon Farhangi. All rights reserved.
//

#import "NSMutableArray+AFNesting.h"

#import "NSArray+AFUtilities.h"

@implementation NSMutableArray (AFNesting)

- (void)af_replaceObjectAtIndexPath:(NSIndexPath *)indexPath withObject:(id)object
{
    if (indexPath) {
        if ([self af_indexInBounds:indexPath.section]) {
            NSMutableArray *section = self[indexPath.section];
            if ([section isKindOfClass:[NSMutableArray class]]) {
                if ([section af_indexInBounds:indexPath.row]) {
                    section[indexPath.row] = object;
                }
            }
        }
    }
}

@end
