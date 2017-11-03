//
//  WWCountDownButton.h
//  WWKit
//
//  Created by awen on 2017/11/2.
//  Copyright © 2017年 wwkit. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WWCountDownButton;
typedef NSString* (^CountDownChanging)(WWCountDownButton *sender,NSUInteger second);
typedef NSString* (^CountDownFinished)(WWCountDownButton *sender,NSUInteger second);
typedef void (^TouchedCountDownButtonHandler)(WWCountDownButton *sender,NSInteger tag);

@interface WWCountDownButton : UIButton
@property(nonatomic,strong) id userInfo;
///倒计时按钮点击回调
- (void)countDownButtonHandler:(TouchedCountDownButtonHandler)touchedCountDownButtonHandler;
//倒计时时间改变回调
- (void)countDownChanging:(CountDownChanging)countDownChanging;
//倒计时结束回调
- (void)countDownFinished:(CountDownFinished)countDownFinished;
///开始倒计时
- (void)startCountDownWithSecond:(NSUInteger)second;
///停止倒计时
- (void)stopCountDown;
@end
