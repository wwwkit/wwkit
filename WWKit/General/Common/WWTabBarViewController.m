//
//  WWTabBarViewController.m
//  WWKit
//
//  Created by weigh on 2017/11/1.
//  Copyright © 2017年 wwkit. All rights reserved.
//

#import "WWTabBarViewController.h"
#import "WWBaseViewController.h"
#import "WWBaseNavigationViewController.h"

@interface WWTabBarViewController ()

@property (nonatomic,strong) WWBaseViewController *viewController1;
@property (nonatomic,strong) WWBaseViewController *viewController2;
@property (nonatomic,strong) WWBaseViewController *viewController3;

@end

@implementation WWTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.viewController1 = [[WWBaseViewController alloc]init];
    WWBaseNavigationViewController *nav1 = [[WWBaseNavigationViewController alloc]initWithRootViewController:self.viewController1];
    nav1.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:[[UIImage imageNamed:@"AppIcon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"AppIcon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    self.viewController2 = [[WWBaseViewController alloc]init];
    WWBaseNavigationViewController *nav2 = [[WWBaseNavigationViewController alloc]initWithRootViewController:self.viewController2];
    nav2.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页2" image:[[UIImage imageNamed:@"AppIcon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"AppIcon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    self.viewControllers = @[nav1,nav2];
    self.tabBar.barTintColor = [UIColor whiteColor];
    self.tabBar.tintColor = [UIColor whiteColor];
    self.tabBar.opaque = YES;
    
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 49)];
    backView.backgroundColor = [UIColor whiteColor];
    [self.tabBar insertSubview:backView atIndex:0];
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor], NSForegroundColorAttributeName,[UIFont systemFontOfSize:10],NSFontAttributeName,nil] forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:CNavBgColor, NSForegroundColorAttributeName,nil] forState:UIControlStateSelected];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tabBar.frame.size.width, 0.5)];
    line.backgroundColor = [UIColor whiteColor];
    [self.tabBar addSubview:line];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
