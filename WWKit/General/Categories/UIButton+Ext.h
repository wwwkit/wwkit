//
//  UIButton+Ext.h
//  WWKit
//
//  Created by awen on 2017/9/21.
//  Copyright © 2017年 wwkit. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, MKButtonEdgeInsetsStyle) {
    MKButtonEdgeInsetsStyleTop, // image在上，label在下
    MKButtonEdgeInsetsStyleLeft, // image在左，label在右
    MKButtonEdgeInsetsStyleBottom, // image在下，label在上
    MKButtonEdgeInsetsStyleRight // image在右，label在左
};

@interface UIButton (Ext)


/**
 创建图片按钮

 @param iconImg 图片
 @param frame frame
 @param aTag tag
 @return 图片按钮
 */
+ (UIButton*) creatButton:(UIImage*) iconImg withFrame:(CGRect)frame tag:(NSInteger) aTag;

/**
 带圆角边框线的button
 
 @param frame frame
 @param title title
 @param titleColor 标题线颜色
 @param borderColor 边框线颜色
 @param cornerRadius 圆角大小
 @return 带圆角边框线的button
 */
- (instancetype)initWithFrame:(CGRect)frame TitleString:(NSString *)title TitleColor:(UIColor *)titleColor TitleFont:(UIFont *)font BorderColor:(UIColor *)borderColor CornerRadius:(CGFloat)cornerRadius;

/**
 快速创建button
 
 @param frame frame description
 @param title title description
 @param titleColor titleColor description
 @param fontSize fontSize description
 @return button
 */
+ (UIButton *)createButtonWithFrame:(CGRect)frame Title:(NSString *)title TitleColor:(UIColor *)titleColor fontSize:(CGFloat)fontSize;

/**
 ⭕️ 套 ⭕️ 的一个选择常用button
 
 @param frame frame description
 @param color color description
 @return button
 */
- (UIButton *)initWithFrame:(CGRect)frame Color:(UIColor *)color;

/*  设置button的titleLabel和imageView的布局样式，及间距
 *
 *  @param style titleLabel和imageView的布局样式
 *  @param space titleLabel和imageView的间距
 */
- (void)layoutButtonWithEdgeInsetsStyle:(MKButtonEdgeInsetsStyle)style
                        imageTitleSpace:(CGFloat)space;


@end
