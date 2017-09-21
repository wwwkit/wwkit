//
//  UIBarButtonItem+Extension.h
//  WWKit
//
//  Created by awen on 2017/9/21.
//  Copyright © 2017年 wwkit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)

+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action;

+ (instancetype)itemWithButton:(UIImage *)img bounds:(CGRect)bounds target:(id)target action:(SEL)action;
+ (instancetype)itemWithButton:(UIButton *)btn target:(id)target action:(SEL)action;
@end
