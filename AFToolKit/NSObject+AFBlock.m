//
//  NSObject+AFBlock.m
//  AFToolKit
//
//  Created by Ashkon Farhangi on 1/8/14.
//  Copyright (c) 2014 Ashkon Farhangi. All rights reserved.
//

#import "NSObject+AFBlock.h"

@implementation NSObject (AFBlock)

+ (void)af_performBlock:(void (^)(void))block afterDelay:(NSTimeInterval)delay
{
	int64_t delta = (int64_t)(1.0e9 * delay);
	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, delta), dispatch_get_main_queue(), block);
}

+ (void)af_performBlockInBackground:(void (^)(void))block completion:(void (^)())completion
{
    if (block) {
        dispatch_queue_t fetchQ = dispatch_queue_create("new feed entry fetcher", NULL);
        dispatch_async(fetchQ, ^{
            block();

            if (completion) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    completion();
                });
            }
        });
    }
}

+ (void)af_performBlockInBackground:(void (^)(void))block afterDelay:(NSTimeInterval)delay completion:(void (^)())completion
{
    [self af_performBlock:^ {
        [self af_performBlockInBackground:block completion:completion];
    } afterDelay:delay];
}

@end
