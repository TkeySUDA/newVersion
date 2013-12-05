//
//  CardViewController.m
//  wirelessuda
//
//  Created by Mac on 13-11-17.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import "CardViewController.h"
#import "CustomButton.h"
#import "CardLoginViewController.h"

@interface CardViewController ()

@end

@implementation CardViewController
@synthesize personInfoView;
@synthesize btScrollView;
@synthesize functionScrollView;
@synthesize detailInfoView,guaShiView,changePsdView,consumptionView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.view.backgroundColor=[UIColor whiteColor];
        self.navigationItem.title=@"苏大通应用";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    personInfoView=[[PersonInfoView alloc]initWithFrame:CGRectMake(0, 0, 320, 100)];
    btScrollView=[[BtScrollView alloc]initWithFrame:CGRectMake(0, 100, 320, 64)];
    btScrollView.delegate=self;
    
#pragma mark - 返回按钮
    UIBarButtonItem *BackBtn = [[UIBarButtonItem alloc] initWithTitle:@"首页"
                                                                style:UIBarButtonItemStylePlain
                                                               target:self
                                                               action:@selector(backAction:)];
    self.navigationItem.leftBarButtonItem = BackBtn;
    UIBarButtonItem *cancel = [[UIBarButtonItem alloc] initWithTitle:@"退出登录"
                                                               style:UIBarButtonItemStylePlain
                                                              target:self
                                                              action:@selector(cancelClick:)];
    self.navigationItem.rightBarButtonItem=cancel;
    functionScrollView=[[UIView alloc]init];
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        functionScrollView.frame=CGRectMake(0, 164, 320, SCREEN_HEIGHT-164-70);
    }
    else
    {
        functionScrollView.frame=CGRectMake(0, 164, 320, SCREEN_HEIGHT-164-44);
    }
    NSLog(@"aaaaa%f",SCREEN_HEIGHT);
    functionScrollView.backgroundColor=[UIColor orangeColor];
    
    detailInfoView=[[DetailInfoView alloc]initWithFrame:CGRectMake(0, 0, 320, SCREEN_HEIGHT-228)];
    guaShiView=[[GuaShiView alloc]initWithFrame:CGRectMake(0, 0, 320, SCREEN_HEIGHT-228)];
    changePsdView=[[ChangePsdView alloc]initWithFrame:CGRectMake(0, 0, 320, SCREEN_HEIGHT-228)];
    consumptionView=[[ConsumptionView alloc]initWithFrame:CGRectMake(0, 0, 320, SCREEN_HEIGHT-228)];
    [self.view addSubview:detailInfoView];
    [self.view addSubview:btScrollView];
    [self.view addSubview:personInfoView];
    [self.view addSubview:functionScrollView];
}
-(void)backAction:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
-(void)cancelClick:(id)sender
{
    [[NSUserDefaults standardUserDefaults] setObject:@"1" forKey:@"cardAutoLogin"];
    CardLoginViewController *cardLoginViewController=[[CardLoginViewController alloc]initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:cardLoginViewController animated:YES];
}
-(void)buttonClick:(NSString *)which
{
    if ([which isEqualToString:@"0"]) {
        NSLog(@"详细信息");
        detailInfoView.backgroundColor=[UIColor redColor];
        [functionScrollView addSubview:detailInfoView];
    }else if ([which isEqualToString:@"1"]){
        NSLog(@"苏大通挂失");
        guaShiView.backgroundColor=[UIColor cyanColor];
        [functionScrollView addSubview:guaShiView];
    }else if ([which isEqualToString:@"2"]){
        NSLog(@"修改密码");
        changePsdView.backgroundColor=[UIColor purpleColor];
        [functionScrollView addSubview:changePsdView];
        
    }else if ([which isEqualToString:@"3"]){
        NSLog(@"消费查询");
        consumptionView.backgroundColor=[UIColor blueColor];
        [functionScrollView addSubview:consumptionView];
    }
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
