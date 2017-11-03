//
//  WWLoginViewController.m
//  WWKit
//
//  Created by awen on 2017/11/1.
//  Copyright © 2017年 wwkit. All rights reserved.
//

#import "WWRegisterViewController.h"
#import "WWLoginViewController.h"
#import "WEDodgeKeyboard.h"

@interface WWLoginViewController ()

@end

@implementation WWLoginViewController{
    UITextField *_phoneField;
    UITextField *_pwdField;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
    [WEDodgeKeyboard addRegisterTheViewNeedDodgeKeyboard:self.view];
    // Do any additional setup after loading the view.
}

- (void)setUI {
    
    UIImageView *bgView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    bgView.image = IMAGE_NAMED(@"loginVC_bg1");
    bgView.userInteractionEnabled = YES;
    [self.view addSubview:bgView];
    
    UIImageView *topImageView = [[UIImageView alloc] initWithFrame:CGRectMake(131*kScale, 85.5*kScale, 114*kScale, 114*kScale)];
    topImageView.image = IMAGE_NAMED(@"");
    topImageView.backgroundColor = [UIColor redColor];
//    topImageView.center = CGPointMake(bgView.width/2, 150);
    [bgView addSubview:topImageView];
    
    UIImageView *phoneIcon = [[UIImageView alloc] initWithImage:IMAGE_NAMED(@"loginVC_phoneIcon")];
    phoneIcon.frame = CGRectMake(15, 282*kScale, 20, 23.5);
    phoneIcon.contentMode = UIViewContentModeScaleAspectFit;
    [bgView addSubview:phoneIcon];
    
    _phoneField = [[UITextField alloc] initWithFrame:CGRectMake(phoneIcon.right + 18, phoneIcon.top, KScreenWidth - 50, 25)];
    _phoneField.backgroundColor = [UIColor clearColor];
    _phoneField.textColor = UIColorHex(0xffffff);
    _phoneField.placeholder = @"请输入您的手机号码";
    _phoneField.placeholderColor = UIColorHex(0xe0e0e0);
    _phoneField.keyboardType = UIKeyboardTypeNumberPad;
    [bgView addSubview:_phoneField];
    
    UIView *line1 = [[UIView alloc] initWithFrame:CGRectMake(12, _phoneField.bottom + 10*kScale, KScreenWidth - 24, 0.5)];
    line1.backgroundColor = UIColorHex(0xe0e0e0);
    [bgView addSubview:line1];
    
    UIImageView *pwdIcon = [[UIImageView alloc] initWithImage:IMAGE_NAMED(@"loginVC_pwdIcon")];
    pwdIcon.frame = CGRectMake(15, line1.bottom + 25*kScale, 20, 23.5);
    pwdIcon.contentMode = UIViewContentModeScaleAspectFit;
    [bgView addSubview:pwdIcon];
    
    _pwdField = [[UITextField alloc] initWithFrame:CGRectMake(pwdIcon.right + 18, pwdIcon.top, KScreenWidth - 50, 25)];
    _pwdField.backgroundColor = [UIColor clearColor];
    _pwdField.textColor = UIColorHex(0xffffff);
    _pwdField.placeholder = @"请输入您的密码";
    _pwdField.placeholderColor = UIColorHex(0xe0e0e0);
    _pwdField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    [bgView addSubview:_pwdField];
    
    UIView *line2 = [[UIView alloc] initWithFrame:CGRectMake(12, _pwdField.bottom + 10*kScale, KScreenWidth - 24, 0.5)];
    line2.backgroundColor = UIColorHex(0xe0e0e0);
    [bgView addSubview:line2];
    
    UIButton *loginBtn = [UIButton createButtonWithFrame:CGRectMake(12, line2.bottom + 91*kScale, KScreenWidth - 24, 44) Title:@"登录" TitleColor:UIColorHex(0xffffff) fontSize:15];
    loginBtn.backgroundColor = UIColorHex(0x6dd3cc);
    loginBtn.layer.cornerRadius = 6;
    [loginBtn addTarget:self action:@selector(loginAction:) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:loginBtn];
    
    
    
    UIButton *registerBtn = [UIButton createButtonWithFrame:CGRectMake(12, loginBtn.bottom + 24.5*kScale, 245*kScale, 44) Title:@"注册" TitleColor:UIColorHex(0xffffff) fontSize:15];
    registerBtn.layer.cornerRadius = 6;
    registerBtn.layer.borderWidth = 0.5;
    registerBtn.layer.borderColor = UIColorHex(0xffffff).CGColor;
    [registerBtn addTarget:self action:@selector(registerAction:) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:registerBtn];

    UIButton *forgetPwdBtn = [UIButton createButtonWithFrame:CGRectMake(registerBtn.right + 12*kScale, loginBtn.bottom + 24.5*kScale, 90*kScale, 44) Title:@"忘记密码" TitleColor:UIColorHex(0xffffff) fontSize:15];
    forgetPwdBtn.layer.cornerRadius = 6;
    forgetPwdBtn.layer.borderWidth = 0.5;
    forgetPwdBtn.layer.borderColor = UIColorHex(0xffffff).CGColor;
    [forgetPwdBtn addTarget:self action:@selector(forgetPwdAction:) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:forgetPwdBtn];
}

#pragma mark - login action
- (void)loginAction:(UIButton *) sender{
    
    if (ISEMPTY(_phoneField.text)) {
        [MBProgressHUD showHint:@"请输入手机号..."];
    }else if (ISEMPTY(_pwdField.text)) {
        [MBProgressHUD showHint:@"请输入密码..."];
    }
}

- (void)registerAction:(UIButton *) sender{
    
    WWRegisterViewController *registerVC = [[WWRegisterViewController alloc] init];
    registerVC.isHidenNaviBar = YES;
    [self.navigationController pushViewController:registerVC animated:YES];
}

- (void)forgetPwdAction:(UIButton *) sender{
    
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
