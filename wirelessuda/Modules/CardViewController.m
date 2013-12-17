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
#import "WLSudaMainViewController.h"

@interface CardViewController ()

@end

@implementation CardViewController
@synthesize personInfoView;
@synthesize btScrollView;
@synthesize functionScrollView;
@synthesize detailInfoView,guaShiView,changePsdView,consumptionView,change;
@synthesize cardAllData,cardBaseData;

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
    NSDictionary *stuInfo=[[NSUserDefaults standardUserDefaults] objectForKey:@"cardAllData"];
    [personInfoView setStuInfo:stuInfo];
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
                                                               action:@selector(cancelClick:)];;
    self.navigationItem.rightBarButtonItem=cancel;
    functionScrollView=[[UIView alloc]init];
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        functionScrollView.frame=CGRectMake(0, 164, 320, SCREEN_HEIGHT-164-70);
    }
    else
    {
        functionScrollView.frame=CGRectMake(0, 164, 320, SCREEN_HEIGHT-164-44);
    }
    functionScrollView.backgroundColor=[UIColor orangeColor];
    
    detailInfoView=[[DetailInfoView alloc]initWithFrame:CGRectMake(0, 0, 320, SCREEN_HEIGHT-228)];
    guaShiView=[[GuaShiView alloc]initWithFrame:CGRectMake(0, 0, 320, SCREEN_HEIGHT-228)];
    changePsdView=[[ChangePsdView alloc]initWithFrame:CGRectMake(0, 0, 320, SCREEN_HEIGHT-228)];
    consumptionView=[[ConsumptionView alloc]initWithFrame:CGRectMake(0, 0, 320, SCREEN_HEIGHT-228)];
    detailInfoView.backgroundColor=[UIColor redColor];
    change=[[UIView  alloc]init];
    [self.view addSubview:detailInfoView];
    [self.view addSubview:btScrollView];
    [self.view addSubview:personInfoView];
    [self.view addSubview:functionScrollView];
    [functionScrollView addSubview:detailInfoView];
}
-(void)backAction:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:NO];
}
-(void)cancelClick:(id)sender
{
    [[NSUserDefaults standardUserDefaults] setObject:@"1" forKey:@"cardAutoLogin"];
    [self.navigationController popToRootViewControllerAnimated:NO];
}
-(void)buttonClick:(NSString *)which
{
    if ([which isEqualToString:@"0"]) {
        NSLog(@"详细信息");
        detailInfoView.backgroundColor=[UIColor redColor];
        [functionScrollView addSubview:detailInfoView];
    }else if ([which isEqualToString:@"1"]){
        NSLog(@"苏大通挂失");
        NSString *flag=[[[NSUserDefaults standardUserDefaults]objectForKey:@"flag"] substringWithRange:NSMakeRange(0, 4)];
        if ([flag isEqualToString:@"0010"]) {
            change.frame=CGRectMake(0, 0, 320, SCREEN_HEIGHT-228);
            change.backgroundColor=[UIColor cyanColor];
            UILabel *inform=[[UILabel alloc]initWithFrame:CGRectMake(0, 20, 320, 30)];
            inform.text=@"您的苏大通已经挂失，解挂请到东区网络中心";
            inform.font=[UIFont systemFontOfSize:15];
            inform.textAlignment=NSTextAlignmentCenter;
            [change addSubview:inform];
            [functionScrollView addSubview:change];
        }else if ([flag isEqualToString:@"0000"]){
            guaShiView.backgroundColor=[UIColor cyanColor];
            guaShiView.delegate=self;
            [functionScrollView addSubview:guaShiView];
        }
        
    }else if ([which isEqualToString:@"2"]){
        NSLog(@"修改密码");
        changePsdView.backgroundColor=[UIColor purpleColor];
        changePsdView.delegate=self;
        [functionScrollView addSubview:changePsdView];
        
    }else if ([which isEqualToString:@"3"]){
        NSLog(@"消费查询");
        consumptionView.backgroundColor=[UIColor blueColor];
        [functionScrollView addSubview:consumptionView];
    }
}
-(void)getSuccedStatus:(NSString *)status{
    if ([status isEqualToString:@"0"]) {
        change.frame=CGRectMake(0, 0, 320, SCREEN_HEIGHT-228);
        change.backgroundColor=[UIColor cyanColor];
        UILabel *inform=[[UILabel alloc]initWithFrame:CGRectMake(0, 20, 320, 30)];
        inform.text=@"您的苏大通已经挂失，解挂请到东区网络中心";
        inform.font=[UIFont systemFontOfSize:15];
        inform.textAlignment=NSTextAlignmentCenter;
        [change addSubview:inform];
        [functionScrollView addSubview:change];
    }
}
-(void)getPsdSuccedStatus:(NSString *)status{
    if ([status isEqualToString:@"0"]) {
        UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:nil message:@"密码修改成功,请重新登录!" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alertView show];
        CardLoginViewController *loginViewController=[[CardLoginViewController alloc] init];
        [self.navigationController pushViewController:loginViewController animated:YES];
    }else{
        UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:nil message:@"密码错误" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alertView show];
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
