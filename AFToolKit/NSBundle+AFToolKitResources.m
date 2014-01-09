//
//  NSBundle+AFToolKitResources.m
//  AFToolKit
//
//  Created by Ashkon Farhangi on 1/8/14.
//  Copyright (c) 2014 Ashkon Farhangi. All rights reserved.
//

#import "NSBundle+AFToolKitResources.h"

#import "AFToolKitResources.h"

@implementation NSBundle (AFToolKitResources)

+ (NSBundle *)af_toolKitBundle
{
    for (NSBundle *bundle in [NSBundle allBundles]) {
        NSLog(@"%@",bundle);
    }
    
	static NSBundle *afToolKitBundle = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		NSString *bundlePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:AF_TOOL_KIT_RESOURCES_BUNDLE_NAME];
		afToolKitBundle = [[NSBundle alloc] initWithPath:bundlePath];
	});
	return afToolKitBundle;
}

@end
