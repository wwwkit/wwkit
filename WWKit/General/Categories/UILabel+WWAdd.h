//
//  UILabel+WWAdd.h
//  WWKit
//
//  Created by weigh on 2017/11/1.
//  Copyright © 2017年 wwkit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (WWAdd)

@property(nonatomic, readonly) CGFloat contentWidth;
@property(nonatomic, readonly) CGFloat contentHeigh;

+ (UILabel *)createLabelWithFrame:(CGRect)frame withSize:(CGFloat)size withColor:(UIColor *)color;
+ (CGFloat)calculateTextHeightWithFont:(UIFont *)font withContent:(NSString *)contentStr withWidth:(CGFloat)width;

+ (UILabel *)createLableFrame:(CGRect)frame  Text:(NSString *)text FontSize:(CGFloat)fontSize TextColor:(UIColor *)textColor TextBackground:(UIColor *)textBackground TextAlignment:(NSTextAlignment)textAlignment;

@end
