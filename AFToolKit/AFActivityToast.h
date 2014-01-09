//
//  AFActivityToast.h
//  AFToolKit
//
//  Created by Ashkon Farhangi on 1/8/14.
//  Copyright (c) 2014 Ashkon Farhangi. All rights reserved.
//

#import "AFToast.h"

@interface AFActivityToast : AFToast

- (void)dismissSuccessWithCompletion:(void (^)())completion;
- (void)dismissFailureWithCompletion:(void (^)())completion;

@end
