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

//// unfinished
/// convey thru name that will only perform if possible?
/// fixing that warning would be great:. This article describes a solution: https://stackoverflow.com/questions/7017281/performselector-may-cause-a-leak-because-its-selector-is-unknown
- (void)af_makeObjectsPerformSelector:(SEL)selector
{
    [self af_performBlockForAllIndices:^ (id object, NSInteger index) {
        if ([object respondsToSelector:selector]) {
            [object performSelector:selector];
        }
    }];
}

- (CGFloat)af_min
{
    CGFloat min = CGFLOAT_MAX;

    for (NSNumber *number in self) {
        if ([number isKindOfClass:[NSNumber class]]) {
            if ([number floatValue] < min) {
                min = [number floatValue];
            }
        } else {
            [NSException raise:@"AF: Array must contain only NSNumber objects" format:@""];
        }
    }

    return min;
}

- (CGFloat)af_max
{
    CGFloat max = CGFLOAT_MIN;

    for (NSNumber *number in self) {
        if ([number isKindOfClass:[NSNumber class]]) {
            if ([number floatValue] > max) {
                max = [number floatValue];
            }
        } else {
            [NSException raise:@"AF: Array must contain only NSNumber objects" format:@""];
        }

    }

    return max;
}

@end
