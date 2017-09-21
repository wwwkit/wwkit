//
//  UIView+Ext.h
//  WWKit
//
//  Created by awen on 2017/9/21.
//  Copyright © 2017年 wwkit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Ext)
@property(nonatomic) CGFloat top;
@property(nonatomic) CGFloat left;
@property(nonatomic) CGFloat right;
@property(nonatomic) CGFloat bottom;

@property(nonatomic) CGFloat width;
@property(nonatomic) CGFloat height;

@property(nonatomic) CGFloat centerX;
@property(nonatomic) CGFloat centerY;

@property(nonatomic,readonly) CGFloat screenX;
@property(nonatomic,readonly) CGFloat screenY;
@property(nonatomic,readonly) CGFloat screenViewX;
@property(nonatomic,readonly) CGFloat screenViewY;
@property(nonatomic,readonly) CGRect screenFrame;

@property(nonatomic) CGPoint origin;
@property(nonatomic) CGSize size;

@property(nonatomic) BOOL visible;

/**
 * Finds the first descendant view (including this view) that is a member of a particular class.
 */
- (UIView*)descendantOrSelfWithClass:(Class)cls;

/**
 * Finds the first ancestor view (including this view) that is a member of a particular class.
 */
- (UIView*)ancestorOrSelfWithClass:(Class)cls;

/**
 * Removes all subviews.
 */
- (void)removeAllSubviews;


/**
 * Calculates the offset of this view from another view in screen coordinates.
 */
- (CGPoint)offsetFromView:(UIView*)otherView;


/**
 * The view controller whose view contains this view.
 */
- (UIViewController*)viewController;


- (void)addSubviews:(NSArray *)views;

- (void)removeAllRecognizers;

- (void)addTapCallBack:(id)target sel:(SEL)selector;

- (void)setLeft:(CGFloat)x;
#pragma mark cRadius=圆角弧度 bwidth=边线宽度 bColor=边线颜色
- (void)setRadius:(CGFloat) cRadius bWidth:(CGFloat) bWidth bColor:(UIColor*) bColor;

+ (UIView *)createViewLayerBorderRadiusFrame:(CGRect)frame CornerRadius:(CGFloat)cornerRadius Color:(UIColor *)color;

@end

