//
//  UIBarButtonItem+Extension.m
//  WWKit
//
//  Created by awen on 2017/9/21.
//  Copyright © 2017年 wwkit. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)

+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action
{
    UIButton *button = [[UIButton alloc] init];
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    button.frame = (CGRect){CGPointZero, button.currentImage.size};
    return [[self alloc] initWithCustomView:button];
}

+ (instancetype)itemWithButton:(UIButton *)btn target:(id)target action:(SEL)action
{
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    return item;
}

+ (instancetype)itemWithButton:(UIImage *)img bounds:(CGRect)bounds target:(id)target action:(SEL)action{
    
    UIButton *right1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [right1 setImage:img forState:UIControlStateNormal];
    right1.bounds = bounds;
    return [UIBarButtonItem itemWithButton:right1 target:target action:action];
}

@end
