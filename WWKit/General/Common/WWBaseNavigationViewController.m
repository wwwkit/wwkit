//
//  WWBaseNavigationViewController.m
//  WWKit
//
//  Created by awen on 2017/9/21.
//  Copyright © 2017年 wwkit. All rights reserved.
//

#import "WWBaseNavigationViewController.h"

@interface WWBaseNavigationViewController ()

@property (nonatomic, strong) id popDelegate;
@property (nonatomic, strong) UIView *alphaView;    /**< 可透明的View */
@property (nonatomic, assign) NSUInteger operation;

@end

@implementation WWBaseNavigationViewController
-(id)initWithRootViewController:(UIViewController *)rootViewController{
    self = [super initWithRootViewController:rootViewController];
    if (self) {
        //        CGRect frame = self.navigationBar.frame;
        //        self.alphaView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height+20)];
        //        self.alphaView.backgroundColor = [UIColor colorWithHexString:@"1b1926"];
        //        [self.view insertSubview:self.alphaView belowSubview:self.navigationBar];
        //        [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"navBar_Bg"] forBarMetrics:UIBarMetricsCompact];
        //        self.navigationBar.layer.masksToBounds = YES;
        
        [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"navBar_Bg"] forBarMetrics:UIBarMetricsDefault];
    }
    return self;
}

- (void)setAlph:(CGFloat)alph{
    _alph = alph;
    //    self.alphaView.alpha = alph;
}


- (void)hidenNavBarWithAnimationPush:(BOOL)push
{
    [UIView animateWithDuration:0.25 animations:^{
        if (push) {
            self.alphaView.right = 0;
        } else {
            //            self.alphaView.left = ScreenWith;
        }
    } completion:^(BOOL finished) {
        if (push) {
            self.alphaView.left = 0;
            //            self.alphaView.backgroundColor = [UIColor redColor];
            //            self.alphaView.alpha = 1;
        } else{
            //            self.alphaView.left = 0;
        }
    }];
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    // 只有push 需要
    //    NSLog(@"%f",self.alph);
    //    if ([viewController isKindOfClass:[MyWalletViewController class]] && self.operation == UINavigationControllerOperationPush) {
    //        [self hidenNavBarWithAnimationPush:YES];
    //    } else if ([viewController isKindOfClass:[MyWalletViewController class]] && self.operation == UINavigationControllerOperationPop){
    //        [self hidenNavBarWithAnimationPush:NO];
    //    }
}

- (void)setNavigationBarHidden:(BOOL)hidden animated:(BOOL)animated{
    [super setNavigationBarHidden:hidden animated:animated];
    self.alphaView.hidden = hidden;
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)loadView
{
    [super loadView];
    // 修改基础导航控制器
    UINavigationBar *navBar = [UINavigationBar appearance];
    [navBar setShadowImage:[UIImage new]];
    // 1.设置背景图片
    UIImage *bgImg =[UIImage imageNamed:@"navBar_Bg"];
    [navBar setBackgroundImage:bgImg forBarMetrics:UIBarMetricsDefault];
    // 2.设置中间title的主题颜色
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSFontAttributeName] = [UIFont boldSystemFontOfSize:18];
    dict[NSForegroundColorAttributeName] = [UIColor colorWithHex:@"aaaaaa"];
    [navBar setTitleTextAttributes:dict];
    
    // 3.修改主题颜色
    navBar.tintColor = [UIColor whiteColor];
    navBar.layer.masksToBounds = YES;
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    _popDelegate = self.interactivePopGestureRecognizer.delegate;
    self.delegate = self;
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    UIViewController *root = self.viewControllers[0];
    if (viewController != root) { // 不是跟控制器,需要实现滑动返回
        // 实现滑动返回
        self.interactivePopGestureRecognizer.delegate = nil;
    }else{
        self.interactivePopGestureRecognizer.delegate = _popDelegate;
    }
}

- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC{
    self.operation = operation;
    return nil;
}


- (BOOL)shouldAutorotate
{
    //    return self.topViewController.shouldAutorotate;
    return NO;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return self.topViewController.supportedInterfaceOrientations;
}

@end
