//
//  UIBarButtonItem+Ext.h
//  WWKit
//
//  Created by awen on 2017/9/21.
//  Copyright © 2017年 wwkit. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^BarButtonJKActionBlock)(void);

@interface UIBarButtonItem (Ext)

+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action;
+ (instancetype)itemWithButton:(UIImage *)img bounds:(CGRect)bounds target:(id)target action:(SEL)action;
+ (instancetype)itemWithButton:(UIButton *)btn target:(id)target action:(SEL)action;

/// A block that is run when the UIBarButtonItem is tapped.
//@property (nonatomic, copy) dispatch_block_t actionBlock;
- (void)setJk_actionBlock:(BarButtonJKActionBlock)actionBlock;

@property (strong, atomic) UILabel *badge;
// Badge value to be display
@property (nonatomic) NSString *badgeValue;
// Badge background color
@property (nonatomic) UIColor *badgeBGColor;
// Badge text color
@property (nonatomic) UIColor *badgeTextColor;
// Badge font
@property (nonatomic) UIFont *badgeFont;
// Padding value for the badge
@property (nonatomic) CGFloat badgePadding;
// Minimum size badge to small
@property (nonatomic) CGFloat badgeMinSize;
// Values for offseting the badge over the BarButtonItem you picked
@property (nonatomic) CGFloat badgeOriginX;
@property (nonatomic) CGFloat badgeOriginY;
// In case of numbers, remove the badge when reaching zero
@property BOOL shouldHideBadgeAtZero;
// Badge has a bounce animation when value changes
@property BOOL shouldAnimateBadge;
@end
