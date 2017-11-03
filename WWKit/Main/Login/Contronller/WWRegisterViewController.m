//
//  WWRegisterViewController.m
//  WWKit
//
//  Created by awen on 2017/11/2.
//  Copyright © 2017年 wwkit. All rights reserved.
//

#import "WWRegisterViewController.h"
#import "WWCountDownButton.h"
#import "WEDodgeKeyboard.h"

static int textFieldTag = 100;
@interface WWRegisterViewController ()<UITextFieldDelegate>{
    NSString *_phoneNum;// 手机号
    NSString *_pwd; // 密码
    NSString *_pwdAgain;//二次密码
    NSString *_code; //验证码
    BOOL isAgree; // 同意注册条款 默认同意
}

@end

@implementation WWRegisterViewController

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
    [bgView addSubview:topImageView];
    
    NSArray *layoutDataArr = @[@{@"icon":@"loginVC_phoneIcon",@"placeholder":@"请输入您的手机号码",@"keyboardType":@"4"}
                               ,@{@"icon":@"loginVC_pwdIcon",@"placeholder":@"请输入您的密码",@"keyboardType":@"2"}
                               ,@{@"icon":@"loginVC_pwdIcon",@"placeholder":@"请再次输入您的密码",@"keyboardType":@"2"}
                               ,@{@"icon":@"loginVC_ code",@"placeholder":@"请输入验证码",@"keyboardType":@"4"}];
    CGFloat startY = 282;
    int tag = textFieldTag;
    for (NSDictionary *dic in layoutDataArr) {
        
        UIImageView *icon = [[UIImageView alloc] initWithImage:IMAGE_NAMED(dic[@"icon"])];
        icon.frame = CGRectMake(15, startY*kScale, 20, 23.5);
        icon.contentMode = UIViewContentModeScaleAspectFit;
        [bgView addSubview:icon];
        
        UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(icon.right + 18, icon.top, KScreenWidth - 50, 25)];
        textField.tag = tag++;
        textField.delegate = self;
        textField.backgroundColor = [UIColor clearColor];
        textField.textColor = UIColorHex(0xffffff);
        textField.placeholder = dic[@"placeholder"];
        textField.placeholderColor = UIColorHex(0xe0e0e0);
        textField.keyboardType = [dic[@"keyboardType"] integerValue];
        [bgView addSubview:textField];
        
        if ([dic[@"placeholder"] isEqualToString:@"请输入验证码"]) {
            textField.width = KScreenWidth - 92.5 - 20 - icon.right + 18;
        }
        
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(12, textField.bottom + 10*kScale, KScreenWidth - 24, 0.5)];
        line.backgroundColor = UIColorHex(0xe0e0e0);
        [bgView addSubview:line];
        startY += 60.5;
    }
    
    WWCountDownButton *countDownBtn = [[WWCountDownButton alloc] initWithFrame:CGRectMake(KScreenWidth - 92.5 - 12, (startY - 60.5)*kScale - 4, 92.5, 30) TitleString:@"发送校验码" TitleColor:UIColorHex(0xffffff) TitleFont:kUIFontToSize(15) BorderColor:[UIColor clearColor] CornerRadius:4];
    countDownBtn.backgroundColor =UIColorHex(0xf2925a);
    
    [countDownBtn countDownButtonHandler:^(WWCountDownButton *sender, NSInteger tag) {
        sender.enabled = NO;
        
        [sender startCountDownWithSecond:30];
        [sender countDownChanging:^NSString *(WWCountDownButton *sender, NSUInteger second) {
            NSString *title = [NSString stringWithFormat:@"剩余%zd秒",second];
            return title;
        }];
        [sender countDownFinished:^NSString *(WWCountDownButton *sender, NSUInteger second) {
            sender.enabled = YES;
            return @"点击重新获取";
        }];
    }];
    [bgView addSubview:countDownBtn];
    
    
    UIButton *registerNowBtn = [UIButton createButtonWithFrame:CGRectMake(12, startY*kScale, KScreenWidth - 24, 44) Title:@"立即注册" TitleColor:UIColorHex(0xffffff) fontSize:15];
    registerNowBtn.backgroundColor = UIColorHex(0x60cec6);
    registerNowBtn.layer.cornerRadius = 4;
    [registerNowBtn addTarget:self action:@selector(registerNowAction:) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:registerNowBtn];
    
    UIButton *registrationTermsBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    registrationTermsBtn.frame = CGRectMake((KScreenWidth - 160) / 2, registerNowBtn.bottom + 22*kScale, 160, 20);
    
    [registrationTermsBtn setImage:IMAGE_NAMED(@"loginVC_unagreed_teams") forState:UIControlStateNormal];
    [registrationTermsBtn setImage:IMAGE_NAMED(@"loginVC_agreed_teams") forState:UIControlStateSelected];
    registrationTermsBtn.adjustsImageWhenHighlighted = NO;
    registrationTermsBtn.selected = YES;
    
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@"同意寻医社用户注册条款"];
    [text setAttributes:@{NSFontAttributeName:kUIFontToSize(12)} range:NSMakeRange(0, text.length-1)];
    [text setAttributes:@{NSForegroundColorAttributeName:UIColorHex(0x847e7e)} range:NSMakeRange(0, 2)];
    [text setAttributes:@{NSForegroundColorAttributeName:UIColorHex(0x60cec6)} range:NSMakeRange(2, text.length - 2)];

    [registrationTermsBtn setAttributedTitle:text forState:UIControlStateNormal];
    registrationTermsBtn.titleLabel.attributedText = text;
    registrationTermsBtn.titleLabel.font = kUIFontToSize(12);
    
    [registrationTermsBtn layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleLeft imageTitleSpace:5];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(registrationTermsAction:)];
    [registrationTermsBtn addGestureRecognizer:tap];
    
    [bgView addSubview:registrationTermsBtn];
}

//立即注册
- (void)registerNowAction:(UIButton *)sender {
    if (![_phoneNum isMobile]) {
        [MBProgressHUD showHint:@"请输入正确的手机号"];
    }else if (!(_pwd.length>6 && _pwd.length<10)){
        [MBProgressHUD showHint:@"必须包含字母和数字6-20位"];
    }else if (![_pwd isEqualToString:_pwdAgain]) {
        [MBProgressHUD showHint:@"两次密码不同"];
    }
    // 注册
}

// 条款
- (void)registrationTermsAction:(UITapGestureRecognizer *)sender {
    CGPoint point = [sender locationInView:sender.view];
    UIButton *touchBtn = (UIButton *)sender.view;
    if (point.x < 30) {
        touchBtn.selected = !touchBtn.selected;
        // 同意or不同意
        DLog(@"同意or不同意")
    }else{
        // 预览条款
        DLog(@"预览条款")
    }
}

//- (void)textFieldDidEndEditing:(UITextField *)textField {
//    if (textField.tag == textFieldTag) { // 手机号
//        _phoneNum = textField.text;
//        //        MOBILE = @"^1(3[0-9]|4[57]|5[0-35-9]|8[0-9]|7[0678])\\d{8}$";
//    }else if (textField.tag - textFieldTag == 1) { // 密码
//        _pwd = textField.text;
//        //        MOBILE = @"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,20}$";
//    }else if (textField.tag - textFieldTag == 2){ // 二次密码
//        _pwdAgain = textField.text;
//    }else if (textField.tag - textFieldTag == 3) {
//
//        //        MOBILE = @"^[0-9]\\d{n}$";
//    }
//}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
//    NSString *MOBILE;
//    MOBILE = @"^1(3[0-9]|4[57]|5[0-35-9]|8[0-9]|7[0678])\\d{8}$";
//    MOBILE = @"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,20}$";
//    MOBILE = @"^[0-9]\\d{n}$";
//    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
//    return [regextestmobile evaluateWithObject:textField.text];

    if (textField.tag == textFieldTag) { // 手机号
        _phoneNum = textField.text;
        return textField.text.length<11?YES:NO;
    }else if (textField.tag - textFieldTag == 1) { // 密码
        _pwd = textField.text;
        return textField.text.length>6?YES:NO;
    }else if (textField.tag - textFieldTag == 2){ // 二次密码
        _pwdAgain = textField.text;
        return textField.text.length<=6?YES:NO;
    }else if (textField.tag - textFieldTag == 3) {
        _code = textField.text;
        return textField.text.length<=4?YES:NO;
    }
    return YES;
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
