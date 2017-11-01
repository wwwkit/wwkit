//
//  UILabel+WWAdd.m
//  WWKit
//
//  Created by weigh on 2017/11/1.
//  Copyright © 2017年 wwkit. All rights reserved.
//

#import "UILabel+WWAdd.h"

@implementation UILabel (WWAdd)

- (CGFloat)contentWidth
{
    return [self.text sizeWithAttributes:@{NSFontAttributeName:self.font}].width;
}

- (CGFloat)contentHeigh
{
    CGRect rect = [self.text boundingRectWithSize:CGSizeMake(self.frame.size.width, MAXFLOAT)
                                          options:NSStringDrawingUsesLineFragmentOrigin
                                       attributes:@{NSFontAttributeName:self.font}
                                          context:nil];
    return rect.size.height;
}

+ (UILabel *)createLabelWithFrame:(CGRect)frame withSize:(CGFloat)size withColor:(UIColor *)color
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.font = UIFontOfSize(size);
    label.textColor = color;
    label.backgroundColor = [UIColor clearColor];
    return label;
}

+ (CGFloat)calculateTextHeightWithFont:(UIFont *)font withContent:(NSString *)contentStr withWidth:(CGFloat)width
{
    CGRect rect = [contentStr boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                                           options:NSStringDrawingUsesLineFragmentOrigin
                                        attributes:@{NSFontAttributeName:font}
                                           context:nil];
    return rect.size.height;
}

+ (UILabel *)createLableFrame:(CGRect)frame  Text:(NSString *)text FontSize:(CGFloat)fontSize TextColor:(UIColor *)textColor TextBackground:(UIColor *)textBackground TextAlignment:(NSTextAlignment)textAlignment {
    
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.text = text;
    label.font = UIFontOfSize(fontSize);
    label.textColor = textColor;
    label.backgroundColor = textBackground;
    label.textAlignment = textAlignment;
    
    return label;
}

@end
