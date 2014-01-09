//
//  AFTextView.h
//  AFToolKit
//
//  Created by Ashkon Farhangi on 1/8/14.
//  Copyright (c) 2014 Ashkon Farhangi. All rights reserved.
//

@interface AFTextView : UITextView

+ (AFTextView *)textViewWithText:(NSString *)text placeholder:(NSString *)placeholder;

@property (nonatomic) NSString *placeholder;
@property (nonatomic) UIColor *placeholderTextColor;

@end
