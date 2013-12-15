//
//  CardLoginViewController.m
//  wirelessuda
//
//  Created by Mac on 13-11-17.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import "CardLoginViewController.h"
#import "CardViewController.h"
#import "MBProgressHUD.h"

@interface CardLoginViewController ()

@end

@implementation CardLoginViewController
@synthesize usernameLabel,usernameField;
@synthesize passwordLabel,passwordField;
@synthesize loginButton,backButton;
@synthesize autoLoginButton,autoLoginLabel;
@synthesize btnAutoLogin,autoLogin;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.navigationItem.title=@"首页";
        autoLogin=@"0";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UIView *subBackground=[[UIView alloc]init];
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        subBackground.frame = CGRectMake(0, 20, 320, SCREEN_HEIGHT-20);
    }else{
        subBackground.frame = CGRectMake(0, 0, 320, SCREEN_HEIGHT-20);
    }
    subBackground.backgroundColor=[UIColor lightGrayColor];
    
    UIImageView* loginView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login_textfield"]];
    loginView.frame=CGRectMake(10, 130, 300, 94);
    [subBackground addSubview:loginView];
    
    UILabel *loginType=[[UILabel alloc]initWithFrame:CGRectMake(0, 20, 320, 100)];
    loginType.textAlignment=NSTextAlignmentCenter;
    loginType.backgroundColor = [UIColor clearColor];
    loginType.text=@"苏大通用户登录";
    loginType.textColor=[UIColor blackColor];
    loginType.font=[UIFont fontWithName:@"Arial" size:20];
    
    usernameLabel=[[UILabel alloc] initWithFrame:CGRectMake(30, 140, 60, 35)];
    usernameLabel.text=@"登录号:";
    usernameField=[[UITextField alloc] initWithFrame:CGRectMake(90, 140, 200, 35)];
    usernameField.placeholder=@"请输入苏大通账号";
    usernameField.autocapitalizationType=UITextAutocapitalizationTypeNone;
    usernameField.autocorrectionType=UITextAutocorrectionTypeNo;
    usernameField.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    usernameField.backgroundColor=[UIColor whiteColor];
    
    passwordLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 180, 60, 35)];
    passwordLabel.text = @"  密码:";
    passwordField=[[UITextField alloc] initWithFrame:CGRectMake(90, 180, 200, 35)];
    passwordField.placeholder=@"请输入苏大通密码";
    passwordField.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    passwordField.secureTextEntry = YES;
    passwordField.backgroundColor=[UIColor whiteColor];
    
    loginButton=[UIButton buttonWithType:UIButtonTypeCustom];
    loginButton.frame=CGRectMake(15, 260, 140, 44);
    [loginButton setBackgroundImage:[UIImage imageNamed:@"login18"] forState:UIControlStateNormal];
    [loginButton addTarget:self action:@selector(onLoginClick) forControlEvents:UIControlEventTouchUpInside];
    
    backButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    backButton.frame=CGRectMake(165, 260, 140, 44);
    [backButton setTitle:@"" forState:UIControlStateNormal];
    [backButton setBackgroundImage:[UIImage imageNamed:@"return18"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(onBackClick) forControlEvents:UIControlEventTouchUpInside];
    
    btnAutoLogin=[UIButton buttonWithType:UIButtonTypeCustom];
    btnAutoLogin.frame=CGRectMake(170, 320, 130, 40);
    btnAutoLogin.titleLabel.font=[UIFont boldSystemFontOfSize:15];
    [btnAutoLogin setTitle:@"允许自动登录" forState:UIControlStateNormal];
    [btnAutoLogin setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    btnAutoLogin.showsTouchWhenHighlighted=YES;
    //    [btnAutoLogin setImage:[UIImage imageNamed:@"auto_login_frame"] forState:UIControlStateNormal];
    [btnAutoLogin setImage:[UIImage imageNamed:@"auto_login2"] forState:UIControlStateNormal];
    btnAutoLogin.tag=0;
    
    [btnAutoLogin addTarget:self action:@selector(onAutoLoginClick:) forControlEvents:UIControlEventTouchUpInside];
    
#pragma mark - 触摸键盘消失
    UITapGestureRecognizer* tapGesture=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    tapGesture.delegate=(id<UIGestureRecognizerDelegate>)self;
    [self.view addGestureRecognizer:tapGesture];
    
    [subBackground addSubview:btnAutoLogin];
    [subBackground addSubview:loginType];
    [subBackground addSubview:usernameLabel];
    [subBackground addSubview:usernameField];
    [subBackground addSubview:passwordLabel];
    [subBackground addSubview:passwordField];
    [subBackground addSubview:loginButton];
    [subBackground addSubview:backButton];
    [subBackground addSubview:autoLoginLabel];
    [subBackground addSubview:autoLoginButton];
    [self.view addSubview:subBackground];
}

#pragma mark - 触摸键盘消失
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if ([touch.view isKindOfClass:[UIButton class]]) {
        return NO;
    }
    return YES;
}

-(void)tap:(UIGestureRecognizer*)gesture
{
    if (self.view.frame.origin.y==-85) {
        [UIView animateWithDuration:0.3 animations:^{
            self.view.frame=CGRectOffset(self.view.frame, 0, 85);
        }];
    }
    [self.view endEditing:YES];
}
-(void)onAutoLoginClick:(UIButton *)btn
{
    if (btn.tag==0) {
        btn.tag=1;
        NSLog(@"%d",btn.tag);
        [btnAutoLogin setImage:[UIImage imageNamed:@"auto_login_frame"] forState:UIControlStateNormal];
        autoLogin=@"1";
    }else if(btn.tag==1){
        btn.tag=0;
        NSLog(@"%d",btn.tag);
        [btnAutoLogin setImage:[UIImage imageNamed:@"auto_login2"] forState:UIControlStateNormal];
        autoLogin=@"0";
    }
}

-(void)onLoginClick
{
    if ([usernameField.text isEqualToString:@""]) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.labelText = @"     请输入用户名！     ";
        hud.margin = 10.f;
        hud.yOffset = -60.f;
        hud.removeFromSuperViewOnHide = YES;
        [hud hide:YES afterDelay:2];
        [usernameField becomeFirstResponder];
    }else if ([passwordField.text isEqualToString:@""]){
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.labelText = @"     请输入密码！     ";
        hud.margin = 10.f;
        hud.yOffset = -60.f;
        hud.removeFromSuperViewOnHide = YES;
        [hud hide:YES afterDelay:2];
        [passwordField becomeFirstResponder];
    }else{
    CardLoginValidate *cardLoginValidate=[[CardLoginValidate alloc]init];
    cardLoginValidate.delegate=self;
    [cardLoginValidate validateCardLogin:usernameField.text withPassword:passwordField.text withLoginType:@"2" withUserType:@"1"];
    }
}
-(void)getCardResult:(CardAllData *)result
{
    if ([result.status isEqualToString:@"-2"]||[result.status isEqualToString:@""]) {
        NSLog(@"登录失败");
        UIAlertView * alert= [[UIAlertView alloc]initWithTitle:nil message:@"用户名或密码输入错误！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }else if([result.status isEqualToString:@"0"]){
        if ([autoLogin isEqualToString:@"0"]) {
            [[NSUserDefaults standardUserDefaults] setObject:@"0" forKey:@"cardAutoLogin"];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }else{
            [[NSUserDefaults standardUserDefaults] setObject:@"1" forKey:@"cardAutoLogin"];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }
        [[NSUserDefaults standardUserDefaults] setObject:usernameField.text forKey:@"cardUsername"];
        [[NSUserDefaults standardUserDefaults]setObject:passwordField.text forKey:@"cardPassword"];
//        NSString *name=result.name;
//        NSString *stuNum=result.stuNum;
//        NSLog(@"登录成功%@,%@",name,stuNum);
        CardViewController *cardViewController=[[CardViewController alloc]initWithNibName:nil bundle:nil];
        [self.navigationController pushViewController:cardViewController animated:YES];
        cardViewController.navigationController.navigationBar.hidden=NO;
    }
}
-(void)getCardLoginStatus:(NSString *)status
{
    if ([status isEqualToString:@"-2"]) {
        NSLog(@"登录失败");
        UIAlertView * alert= [[UIAlertView alloc]initWithTitle:nil message:@"用户名或密码输入错误！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if ([status isEqualToString:@"0"]){
        if ([autoLogin isEqualToString:@"0"]) {
            [[NSUserDefaults standardUserDefaults] setObject:@"0" forKey:@"cardAutoLogin"];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }else{
            [[NSUserDefaults standardUserDefaults] setObject:@"1" forKey:@"cardAutoLogin"];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }
        [[NSUserDefaults standardUserDefaults] setObject:usernameField.text forKey:@"cardUsername"];
        [[NSUserDefaults standardUserDefaults]setObject:passwordField.text forKey:@"cardPassword"];
        CardViewController *cardViewController=[[CardViewController alloc]initWithNibName:nil bundle:nil];
        [self.navigationController pushViewController:cardViewController animated:YES];
        cardViewController.navigationController.navigationBar.hidden=NO;
    }
}

-(void)onBackClick
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    self.navigationController.navigationBar.hidden=YES;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
