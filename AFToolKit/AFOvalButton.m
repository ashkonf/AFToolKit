//
//  AFOvalButton.m
//  AFToolKit
//
//  Created by Ashkon Farhangi on 3/27/14.
//  Copyright (c) 2014 Ashkon Farhangi. All rights reserved.
//

#import "AFOvalButton.h"

#import "UIView+AFDrawing.h"

@implementation AFOvalButton

- (void)layoutSubviews
{
    [super layoutSubviews];

    [self af_makeOvularWithBorderColor:self.borderColor borderWidth:self.borderWidth];
}

@end
