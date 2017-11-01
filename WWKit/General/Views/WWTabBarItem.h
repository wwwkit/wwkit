//
//  WWTabBarItem.h
//  WWKit
//
//  Created by weigh on 2017/11/1.
//  Copyright © 2017年 wwkit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WWTabBarItem : UIView

@property (nonatomic, assign, getter=isSelected) BOOL selected;

- (void)setNormal:(NSString *)normal seleted:(NSString *)selected title:(NSString *)title;

@end
