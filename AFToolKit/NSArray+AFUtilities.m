//
//  NSArray+AFUtilities.m
//  AFToolKit
//
//  Created by Ashkon Farhangi on 1/8/14.
//  Copyright (c) 2014 Ashkon Farhangi. All rights reserved.
//

#import "NSArray+AFUtilities.h"

@implementation NSArray (AFUtilities)

- (BOOL)af_indexInBounds:(NSInteger)index
{
    if (index < 0 || index >= self.count) {
        return NO;
    }
    return YES;
}

- (void)af_performBlockForAllIndices:(void (^)(id object, NSInteger index))block
{
    if (block) {
        for (NSInteger index = 0; index < self.count; index++) {
            block(self[index], index);
        }
    }
}

@end
