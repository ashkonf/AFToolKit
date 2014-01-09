//
//  AFToast.h
//  AFToolKit
//
//  Created by Ashkon Farhangi on 1/8/14.
//  Copyright (c) 2014 Ashkon Farhangi. All rights reserved.
//

@interface AFToast : UIView

- (void)present;
- (void)dismissWithCompletion:(void (^)())completion;

@end
