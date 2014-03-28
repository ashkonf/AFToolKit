//
//  AFUtilities.m
//  AFToolKit
//
//  Created by Ashkon Farhangi on 1/8/14.
//  Copyright (c) 2014 Ashkon Farhangi. All rights reserved.
//

#import "AFUtilities.h"

@implementation AFUtilities

+ (BOOL)onIpad
{
    return (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad);
}

@end
