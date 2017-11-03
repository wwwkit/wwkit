//
//  WEDodgeKeyboardObjects.h
//  MeiX
//
//  Created by we on 2017/4/14.
//  Copyright © 2017年 ganruihao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WEDodgeKeyboardObjects : NSObject

@property (nonatomic, strong) UIView *observerView;
@property (nonatomic, strong) UIWindow *textEffectsWindow;
@property (nonatomic, strong) UIView *firstResponderView;
@property (nonatomic, assign) CGRect originalViewFrame;
@property (nonatomic, assign) CGRect keyboardFrame;
@property (nonatomic, assign) CGFloat shiftHeight;
@property (nonatomic, assign) double keyboardAnimationDutation;
@property (nonatomic, assign) BOOL isKeyboardShow;

@end
