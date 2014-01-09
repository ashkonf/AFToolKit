//
//  NSObject+AFBlock.h
//  AFToolKit
//
//  Created by Ashkon Farhangi on 1/8/14.
//  Copyright (c) 2014 Ashkon Farhangi. All rights reserved.
//

@interface NSObject (AFBlock)

+ (void)af_performBlock:(void (^)(void))block afterDelay:(NSTimeInterval)delay;
+ (void)af_performBlockInBackground:(void (^)(void))block completion:(void (^)())completion;
+ (void)af_performBlockInBackground:(void (^)(void))block afterDelay:(NSTimeInterval)delay completion:(void (^)())completion;

@end
