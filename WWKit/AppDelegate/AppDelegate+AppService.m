//
//  AppDelegate+AppService.m
//  WWKit
//
//  Created by awen on 2017/11/1.
//  Copyright © 2017年 wwkit. All rights reserved.
//

#import <MBProgressHUD/MBProgressHUD.h>
#import "AppDelegate+AppService.h"
#import "WWLoginViewController.h"
#import "OpenUDID.h"

@implementation AppDelegate (AppService)

#pragma mark ————— 初始化服务 —————
-(void)initService{
    //注册登录状态监听
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(loginStateChange:)
//                                                 name:KNotificationLoginStateChange
//                                               object:nil];
    
    //网络状态监听
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(netWorkStateChange:)
                                                 name:KNotificationNetWorkStateChange
                                               object:nil];
}

#pragma mark ————— 初始化window —————
-(void)initWindow{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    self.mainTabBar = [[WWTabBarViewController alloc] init];
    self.window.rootViewController = self.mainTabBar;
    
    [self.window makeKeyAndVisible];
    [[UIButton appearance] setExclusiveTouch:YES];
    //    [[UIButton appearance] setShowsTouchWhenHighlighted:YES];
    [UIActivityIndicatorView appearanceWhenContainedIn:[MBProgressHUD class], nil].color = [UIColor whiteColor];
    if (@available(iOS 11.0, *)){
        [[UIScrollView appearance] setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
    }
}

#pragma mark ————— 设置语言 —————
- (void)initLocalizable{
    
    //获取当前的系统语言设置
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSArray *languages = [defaults objectForKey:@"AppleLanguages"];
    NSString *currentLanguage = [languages objectAtIndex:0];
    NSLog(@"%@",currentLanguage);
    
    //设置用户语言为当前系统语言
    [defaults setObject:currentLanguage forKey:@"user_lang_string"];
}


#pragma mark ————— 初始化用户系统 —————
-(void)initUserManager{
    
    WWLoginViewController *loginVC = [[WWLoginViewController alloc] init];
    loginVC.isHidenNaviBar = YES;
    WWBaseNavigationViewController *loginNavi = [[WWBaseNavigationViewController alloc] initWithRootViewController:loginVC];
    self.window.rootViewController = loginNavi;
    
//    DLog(@"设备IMEI ：%@",[OpenUDID value]);
//    if([userManager loadUserInfo]){
//
//        //如果有本地数据，先展示TabBar 随后异步自动登录
//        self.mainTabBar = [UITabBarController new];
//        self.window.rootViewController = self.mainTabBar;
//
//        //自动登录
//        [userManager autoLoginToServer:^(BOOL success, NSString *des) {
//            if (success) {
//                DLog(@"自动登录成功");
//                //                    [MBProgressHUD showSuccessMessage:@"自动登录成功"];
//                KPostNotification(KNotificationAutoLoginSuccess, nil);
//            }else{
//                [MBProgressHUD showErrorMessage:NSStringFormat(@"自动登录失败：%@",des)];
//            }
//        }];
//
//    }else{
//        //没有登录过，展示登录页面
//        KPostNotification(KNotificationLoginStateChange, @NO);
//        //        [MBProgressHUD showErrorMessage:@"需要登录"];
//    }
}

#pragma mark ————— 登录状态处理 —————
- (void)loginStateChange:(NSNotification *)notification
{
    BOOL loginSuccess = YES;//[notification.object boolValue];
    
    if (loginSuccess) {//登陆成功加载主窗口控制器
        
        //为避免自动登录成功刷新tabbar
        if (!self.mainTabBar || ![self.window.rootViewController isKindOfClass:[WWTabBarViewController class]]) {
            self.mainTabBar = [WWTabBarViewController new];
            
            CATransition *anima = [CATransition animation];
            anima.type = @"cube";//设置动画的类型
            anima.subtype = kCATransitionFromRight; //设置动画的方向
            anima.duration = 0.3f;
            
            self.window.rootViewController = self.mainTabBar;
            
            [kAppWindow.layer addAnimation:anima forKey:@"revealAnimation"];
            
        }
        
    }else {//登陆失败加载登陆页面控制器
        
        self.mainTabBar = nil;
        WWBaseNavigationViewController *loginNavi =[[WWBaseNavigationViewController alloc] initWithRootViewController:[WWLoginViewController new]];
        
        CATransition *anima = [CATransition animation];
        anima.type = @"fade";//设置动画的类型
        anima.subtype = kCATransitionFromRight; //设置动画的方向
        anima.duration = 0.3f;
        
        self.window.rootViewController = loginNavi;
        
        [kAppWindow.layer addAnimation:anima forKey:@"revealAnimation"];
        
    }
    //展示FPS
//    [AppManager showFPS];
}


#pragma mark ————— 网络状态变化 —————
- (void)netWorkStateChange:(NSNotification *)notification
{
    BOOL isNetWork = [notification.object boolValue];
    
    if (isNetWork) {//有网络
//        if ([userManager loadUserInfo] && !isLogin) {//有用户数据 并且 未登录成功 重新来一次自动登录
//            [userManager autoLoginToServer:^(BOOL success, NSString *des) {
//                if (success) {
//                    DLog(@"网络改变后，自动登录成功");
//                    //                    [MBProgressHUD showSuccessMessage:@"网络改变后，自动登录成功"];
//                    KPostNotification(KNotificationAutoLoginSuccess, nil);
//                }else{
//                    [MBProgressHUD showErrorMessage:NSStringFormat(@"自动登录失败：%@",des)];
//                }
//            }];
//        }
        
    }else {//登陆失败加载登陆页面控制器
        [MBProgressHUD showTopTipMessage:@"网络状态不佳" isWindow:YES];
    }
}


#pragma mark ————— 友盟 初始化 —————
-(void)initUMeng{
//    /* 打开调试日志 */
//    [[UMSocialManager defaultManager] openLog:YES];
//
//    /* 设置友盟appkey */
//    [[UMSocialManager defaultManager] setUmSocialAppkey:UMengKey];
//
//    [self configUSharePlatforms];
//}
//#pragma mark ————— 配置第三方 —————
//-(void)configUSharePlatforms{
//    /* 设置微信的appKey和appSecret */
//    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession appKey:kAppKey_Wechat appSecret:kSecret_Wechat redirectURL:nil];
//    /*
//     * 移除相应平台的分享，如微信收藏
//     */
//    //[[UMSocialManager defaultManager] removePlatformProviderWithPlatformTypes:@[@(UMSocialPlatformType_WechatFavorite)]];
//
//    /* 设置分享到QQ互联的appID
//     * U-Share SDK为了兼容大部分平台命名，统一用appKey和appSecret进行参数设置，而QQ平台仅需将appID作为U-Share的appKey参数传进即可。
//     */
//    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_QQ appKey:kAppKey_Tencent/*设置QQ平台的appID*/  appSecret:nil redirectURL:nil];
}
//
//#pragma mark ————— OpenURL 回调 —————
//// 支持所有iOS系统
//- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
//{
//    //6.3的新的API调用，是为了兼容国外平台(例如:新版facebookSDK,VK等)的调用[如果用6.2的api调用会没有回调],对国内平台没有影响
//    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url sourceApplication:sourceApplication annotation:annotation];
//    if (!result) {
//        // 其他如支付等SDK的回调
//    }
//    return result;
//}

#pragma mark ————— 网络状态监听 —————
- (void)monitorNetworkStatus
{
//    // 网络状态改变一次, networkStatusWithBlock就会响应一次
//    [PPNetworkHelper networkStatusWithBlock:^(PPNetworkStatusType networkStatus) {
//
//        switch (networkStatus) {
//                // 未知网络
//            case PPNetworkStatusUnknown:
//                DLog(@"网络环境：未知网络");
//                // 无网络
//            case PPNetworkStatusNotReachable:
//                DLog(@"网络环境：无网络");
//                KPostNotification(KNotificationNetWorkStateChange, @NO);
//                break;
//                // 手机网络
//            case PPNetworkStatusReachableViaWWAN:
//                DLog(@"网络环境：手机自带网络");
//                // 无线网络
//            case PPNetworkStatusReachableViaWiFi:
//                DLog(@"网络环境：WiFi");
//                KPostNotification(KNotificationNetWorkStateChange, @YES);
//                break;
//        }
//
//    }];
    
}

+ (AppDelegate *)shareAppDelegate{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

@end
