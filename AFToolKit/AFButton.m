//
//  AFButton.m
//  AFToolKit
//
//  Created by Ashkon Farhangi on 1/31/14.
//  Copyright (c) 2014 Ashkon Farhangi. All rights reserved.
//

#import "AFButton.h"

@interface AFButton()

@end

@implementation AFButton

#pragma mark - UIButton

- (void)setBackgroundImage:(UIImage *)image forState:(UIControlState)state
{
    [super setBackgroundImage:image forState:state];

    /// maybe only if state == normal?
    self.backgroundImage = image;
}

@end
