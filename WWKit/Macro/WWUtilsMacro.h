//
//  WWUtilsMacro.h
//  WWKit
//
//  Created by awen on 2017/9/21.
//  Copyright © 2017年 wwkit. All rights reserved.
//

#ifndef WWUtilsMacro_h
#define WWUtilsMacro_h

#pragma mark - 获取系统对象
////////////////////////////////////////////////////////////////////////////////////////////////
#define kApplication        [UIApplication sharedApplication]
#define kAppWindow          [UIApplication sharedApplication].delegate.window
#define kAppDelegate        [AppDelegate shareAppDelegate]
#define kRootViewController [UIApplication sharedApplication].delegate.window.rootViewController
#define kUserDefaults       [NSUserDefaults standardUserDefaults]
#define kNotificationCenter [NSNotificationCenter defaultCenter]

#define kStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
#define kNavBarHeight 44.0
#define kTabBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49)
#define kTopHeight (kStatusBarHeight + kNavBarHeight)

///IOS 版本判断
#define IOSAVAILABLEVERSION(version) ([[UIDevice currentDevice] availableVersion:version] < 0)
// 当前系统版本
#define CurrentSystemVersion [[UIDevice currentDevice].systemVersion doubleValue]
//当前语言
#define CurrentLanguage (［NSLocale preferredLanguages] objectAtIndex:0])

#pragma mark - 屏幕相关
////////////////////////////////////////////////////////////////////////////////////////////////
#define KScreenWidth ([[UIScreen mainScreen] bounds].size.width)
#define KScreenHeight [[UIScreen mainScreen] bounds].size.height
#define kScreen_Bounds [UIScreen mainScreen].bounds

// 屏宽与设计图比例
#define kScale [UIScreen mainScreen].bounds.size.width/375.0

//#define Iphone6ScaleWidth KScreenWidth/375.0
//#define Iphone6ScaleHeight KScreenHeight/667.0
//根据ip6的屏幕来拉伸
#define kRealValue(with) ((with)*(KScreenWidth/375.0f))

#pragma mark - 强弱引用
////////////////////////////////////////////////////////////////////////////////////////////////
#define kWeakSelf(type)  __weak typeof(type) weak##type = type;
#define kStrongSelf(type) __strong typeof(type) type = weak##type;

#pragma mark -打印日志
////////////////////////////////////////////////////////////////////////////////////////////////
//DEBUG  模式下打印日志,当前行
#ifdef DEBUG
#define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define DLog(...)
#endif

#pragma mark - 快捷类
////////////////////////////////////////////////////////////////////////////////////////////////
//定义UIImage对象
#define ImageWithFile(_pointer) [UIImage imageWithContentsOfFile:([[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@@%dx", _pointer, (int)[UIScreen mainScreen].nativeScale] ofType:@"png"])]
#define IMAGE_NAMED(name) [UIImage imageNamed:name]
#define kUIFontToSize(_s_) [UIFont systemFontOfSize:_s_]

//拼接字符串
#define NSStringFormat(format,...) [NSString stringWithFormat:format,##__VA_ARGS__]
#define kRandomColor    KRGBColor(arc4random_uniform(256)/255.0,arc4random_uniform(256)/255.0,arc4random_uniform(256)/255.0)        //随机色生成
#define UIColorFromRGB(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define UIColorFromRGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define UIColorFromHEX(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define UIFontOfSize(s) [UIFont systemFontOfSize:s]
#define NSStringFromInt(intValue) [NSString stringWithFormat:@"%d", intValue]
#define NSStringFromFloat(floatValue) [NSString stringWithFormat:@"%f", floatValue]
#define RespondsToSelector(_c, _m) ([_c respondsToSelector:_m])

#define IsKindOfClass(_x, _class) ([_x isKindOfClass:[_class class]])
#define ISEMPTY(_v) (_v == nil || _v.length == 0)
#define ISNull(_x)   ([_x isKindOfClass:[NSNull class]] || _x == nil)
#define HAVECONTROLLER(value) if(value == nil || value.controller == nil){return;}
#define ARRAY_VALUE(value) (value != nil && [value count] > 0)

#endif /* WWUtilsMacro_h */
