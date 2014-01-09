//
//  NSArray+AFNesting.h
//  AFToolKit
//
//  Created by Ashkon Farhangi on 1/8/14.
//  Copyright (c) 2014 Ashkon Farhangi. All rights reserved.
//

@interface NSArray (AFNesting)

- (id)af_objectAtIndexPath:(NSIndexPath *)indexPath;
- (void)af_performBlockForAllIndexPaths:(void (^)(id object, NSIndexPath *indexPath))block;
- (void)af_addObjectToLastSection:(id)object;

@end
