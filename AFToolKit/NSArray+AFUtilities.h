//
//  NSArray+AFUtilities.h
//  AFToolKit
//
//  Created by Ashkon Farhangi on 1/8/14.
//  Copyright (c) 2014 Ashkon Farhangi. All rights reserved.
//

@interface NSArray (AFUtilities)

- (BOOL)af_indexInBounds:(NSInteger)index;
- (void)af_performBlockForAllIndices:(void (^)(id object, NSInteger index))block;

@end
