//
//  NSBundle+AFToolKitResources.h
//  AFToolKit
//
//  Created by Ashkon Farhangi on 1/8/14.
//  Copyright (c) 2014 Ashkon Farhangi. All rights reserved.
//

#define AFToolKitLocalizedString(key) [[NSBundle afToolkitBundle] localizedStringForKey:(key) value:@"" table:@"AFToolKit"]

@interface NSBundle (AFToolKitResources)

+ (NSBundle *)af_toolKitBundle;

@end
