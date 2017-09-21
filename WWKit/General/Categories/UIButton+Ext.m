//
//  UIButton+Ext.m
//  WWKit
//
//  Created by awen on 2017/9/21.
//  Copyright © 2017年 wwkit. All rights reserved.
//

#import "UIButton+Ext.h"

@implementation UIButton (Ext)

- (instancetype)initWithFrame:(CGRect)frame TitleString:(NSString *)title TitleColor:(UIColor *)titleColor TitleFont:(UIFont *)font BorderColor:(UIColor *)borderColor CornerRadius:(CGFloat)cornerRadius{
    if (self = [super init]) {
        
        self.frame = frame;
        [self setTitle:title forState:UIControlStateNormal];
        [self setTitleColor:titleColor forState:UIControlStateNormal];
        self.titleLabel.font = font;
        [self.layer setCornerRadius:cornerRadius];
        [self.layer setMasksToBounds:YES];
        if (borderColor) {
            [self.layer setBorderWidth:1.0];
            CGColorRef colorref = borderColor.CGColor;
            [self.layer setBorderColor:colorref];
        }
    }
    return self;
}

#pragma mark 创建图片btn
+(UIButton*) creatButton:(UIImage*) iconImg withFrame:(CGRect)frame tag:(NSInteger) aTag{
    UIButton* button = [[UIButton alloc] initWithFrame:frame];
    [button setTag:aTag];
    [button setImage:iconImg forState:UIControlStateNormal];
    //    [button setTitle:aText forState:UIControlStateSelected];
    return button;
}

+ (UIButton *)createButtonWithFrame:(CGRect)frame Title:(NSString *)title TitleColor:(UIColor *)titleColor fontSize:(CGFloat)fontSize{
    UIButton *btn = [[UIButton alloc]initWithFrame:frame];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    return btn;
}

- (void)layoutButtonWithEdgeInsetsStyle:(MKButtonEdgeInsetsStyle)style
                        imageTitleSpace:(CGFloat)space
{
    //    self.backgroundColor = [UIColor cyanColor];
    
    /**
     *  前置知识点：titleEdgeInsets是title相对于其上下左右的inset，跟tableView的contentInset是类似的，
     *  如果只有title，那它上下左右都是相对于button的，image也是一样；
     *  如果同时有image和label，那这时候image的上左下是相对于button，右边是相对于label的；title的上右下是相对于button，左边是相对于image的。
     */
    
    
    // 1. 得到imageView和titleLabel的宽、高
    CGFloat imageWith = self.imageView.frame.size.width;
    CGFloat imageHeight = self.imageView.frame.size.height;
    
    CGFloat labelWidth = 0.0;
    CGFloat labelHeight = 0.0;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
        // 由于iOS8中titleLabel的size为0，用下面的这种设置
        labelWidth = self.titleLabel.intrinsicContentSize.width;
        labelHeight = self.titleLabel.intrinsicContentSize.height;
    } else {
        labelWidth = self.titleLabel.frame.size.width;
        labelHeight = self.titleLabel.frame.size.height;
    }
    // 2. 声明全局的imageEdgeInsets和labelEdgeInsets
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;
    
    // 3. 根据style和space得到imageEdgeInsets和labelEdgeInsets的值
    switch (style) {
        case MKButtonEdgeInsetsStyleTop:
        {
            imageEdgeInsets = UIEdgeInsetsMake(-labelHeight-space/2.0, 0, 0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith, -imageHeight-space/2.0, 0);
        }
            break;
        case MKButtonEdgeInsetsStyleLeft:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, -space/2.0, 0, space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, space/2.0, 0, -space/2.0);
        }
            break;
        case MKButtonEdgeInsetsStyleBottom:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, 0, -labelHeight-space/2.0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(-imageHeight-space/2.0, -imageWith, 0, 0);
        }
            break;
        case MKButtonEdgeInsetsStyleRight:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth+space/2.0, 0, -labelWidth-space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith-space/2.0, 0, imageWith+space/2.0);
        }
            break;
        default:
            break;
    }
    // 4. 赋值
    self.titleEdgeInsets = labelEdgeInsets;
    self.imageEdgeInsets = imageEdgeInsets;
}

- (UIButton *)initWithFrame:(CGRect)frame Color:(UIColor *)color{
    
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
    bgView.layer.masksToBounds = true;
    bgView.layer.cornerRadius = bgView.frame.size.width / 2;
    bgView.layer.borderColor = [[UIColor clearColor] CGColor];
    bgView.layer.borderWidth = 1;
    
    UIView* temp = [[UIView alloc] initWithFrame:CGRectMake(3, 3, bgView.frame.size.width - 6, bgView.frame.size.width - 6)];
    temp.backgroundColor = color;
    temp.layer.cornerRadius = temp.frame.size.width / 2;
    temp.layer.masksToBounds = true;
    [bgView addSubview:temp];
    
    UIImage *normalImage = [self getImageFromUIView:bgView];
    bgView.layer.borderColor = [color CGColor];
    UIImage *selectImage = [self getImageFromUIView:bgView];
    
    UIButton *button = [[UIButton alloc]initWithFrame:frame];
    [button setImage:normalImage forState:UIControlStateNormal];
    [button setImage:selectImage forState:UIControlStateSelected];
    //    [button addTarget:self action:@selector(selectAction:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

//将UIView转成UIImage
- (UIImage*)getImageFromUIView:(UIView *)view{
    CALayer *theLayer = view.layer;
    UIImage *image = nil;
    @autoreleasepool {
        UIGraphicsBeginImageContextWithOptions(theLayer.bounds.size, false, [UIScreen mainScreen].scale);
        //    CGFloat components[]={254.0/255.0,52.0/255.0,90.0/255.0,1.0};
        //    //注意最后一个参数对于无颜色填充模式指定为当前颜色空间颜色数据
        //    CGContextSetFillPattern(context, pattern, components);
        CGContextRef context = UIGraphicsGetCurrentContext();
        [theLayer renderInContext:context];
        image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    return image;
}

@end
