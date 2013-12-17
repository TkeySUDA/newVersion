//
//  ForgetPsdViewController.m
//  wirelessuda
//
//  Created by 叶帆 on 13-12-17.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import "ForgetPsdViewController.h"

@interface ForgetPsdViewController ()

@end

@implementation ForgetPsdViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.view.backgroundColor = [UIColor whiteColor];
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];  //设置statusbar为白底黑字
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UILabel *identify = [[UILabel alloc]initWithFrame:CGRectMake(40, 20, 60, 40)];
    identify.text = @"账号";
    UITextField *identifyText = [[UITextField alloc]initWithFrame:CGRectMake(100, 20, 150, 40)];
    identifyText.borderStyle=UITextBorderStyleLine;
    identifyText.borderStyle = UITextBorderStyleRoundedRect;
    
    UILabel *codeID = [[UILabel alloc]initWithFrame:CGRectMake(40, 70, 60, 40)];
    codeID.text = @"验证码";
    UITextField *codeIDText = [[UITextField alloc]initWithFrame:CGRectMake(100, 70, 150, 40)];
    codeIDText.borderStyle=UITextBorderStyleLine;
    codeIDText.borderStyle = UITextBorderStyleRoundedRect;
    
    UIButton *code = [[UIButton alloc]initWithFrame:CGRectMake(40, 130, 100, 40)];
    [code setTitle:@"获取验证码" forState:UIControlStateNormal];
    code.backgroundColor = [UIColor grayColor];
    
    UIButton *confirm = [[UIButton alloc]initWithFrame:CGRectMake(170, 130, 100, 40)];
    [confirm setTitle:@"找回" forState:UIControlStateNormal];
    confirm.backgroundColor = [UIColor grayColor];
    
    [self.view addSubview:identify];
    [self.view addSubview:identifyText];
    [self.view addSubview:codeID];
    [self.view addSubview:codeIDText];
    [self.view addSubview:code];
    [self.view addSubview:confirm];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
