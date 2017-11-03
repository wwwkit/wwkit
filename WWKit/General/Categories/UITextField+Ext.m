//
//  UITextField+Ext.m
//  WWKit
//
//  Created by awen on 2017/11/2.
//  Copyright © 2017年 wwkit. All rights reserved.
//

#import "UITextField+Ext.h"

@implementation UITextField (Ext)
@dynamic placeholderFont,placeholderColor;

- (UIColor *)placeholderColor {
    return [self valueForKey:@"_placeholderLabel.textColor"];
}

- (UIFont *)placeholderFont {
    return [self valueForKey:@"_placeholderLabel.font"];
}

- (void)setPlaceholderFont:(UIFont *)placeholderFont {
    [self setValue:placeholderFont forKeyPath:@"_placeholderLabel.font"];
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor {
    [self setValue:placeholderColor forKeyPath:@"_placeholderLabel.textColor"];
}

@end
