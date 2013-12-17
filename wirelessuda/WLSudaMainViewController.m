//
//  WLSudaMainViewController.m
//  wirelessuda
//
//  Created by Mac on 13-10-23.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//Tkey commit

#import "WLSudaMainViewController.h"
#import "GateWayLoginViewController.h"
#import "LoginViewController.h"
#import "GateWayViewController.h"
#import "CardLoginViewController.h"
#import "WLMianBusViewController.h"
#import "CalendarMainViewController.h"
#import "AccountSettingViewController.h"
#import "SchoolNewsViewController.h"
#import "NewsViewController.h"
#import "WeatherViewController.h"
#import "FirstPageModel.h"
#import "CardViewController.h"

@interface WLSudaMainViewController ()

@end

@implementation WLSudaMainViewController
@synthesize topScrollView;
@synthesize pageControl;
@synthesize subView;
@synthesize netWorkStatus;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.navigationItem.title=@"首页";
        self.view.backgroundColor=[UIColor clearColor];
        //self.navigationController.navigationBar.hidden= YES;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view。
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        subView=[[UIView alloc]initWithFrame:CGRectMake(0, 20, 320, 600)];
        self.subView.backgroundColor=[UIColor whiteColor];
    }else
    {
        subView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 600)];
        self.subView.backgroundColor=[UIColor whiteColor];
    }
    //??????????图标命名
    if (SCREEN_HEIGHT>480) {
        //[self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background@2x.png"]]];
    }
    else
    {
        //[self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]]];
    }
    
    topScrollView=[[mainViewScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 160)];

    [topScrollView setImage];
    topScrollView.delegate=self;
    netWorkStatus=[CheckNetWork getNetWorkStatus];
#pragma mark - 定时器
    [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(runTimePage) userInfo:nil repeats:YES];
#pragma mark - 初始化mypagecontrol
    self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(110, 140, 100, 15)];
    [pageControl setCurrentPageIndicatorTintColor:[UIColor orangeColor]];
    [pageControl setPageIndicatorTintColor:[UIColor grayColor]];
    pageControl.numberOfPages = 4;
    pageControl.currentPage = 0;
    [pageControl addTarget:self action:@selector(turnPage) forControlEvents:UIControlEventValueChanged];
    
#pragma mark - 模块
    CGFloat height=topScrollView.frame.size.height+15;
    NSMutableArray *icons=[NSMutableArray arrayWithObjects:@"news.png", @"gateway.png", @"bus.png", @"calendar.png", @"card.png",@"weather.png",@"news.png",@"login.png",@"settings.png", nil];
    NSMutableArray *names=[NSMutableArray arrayWithObjects:@"苏大新闻", @"网关应用", @"班车路线", @"苏大校历", @"苏大通",@"实时天气",@"校内通知",@"网关登录",@"设置", nil];
    for (int i=0,j=-1; i<[icons count]; i++) {
        if ((i)%4 == 0) {
            j++;
        }
        CustomButton *button=[[CustomButton alloc]initWithFrame:CGRectMake(15+(i-j*4)*75, height+100*j, 65, 85)];
        [button.icon setBackgroundImage:[UIImage imageNamed:[icons objectAtIndex:i]] forState:UIControlStateNormal];
        button.name.text=[names objectAtIndex:i];
        button.icon.tag=i;
        [button.icon addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.subView addSubview:button];
    }
    
    [self.subView addSubview:topScrollView];
    [self.subView addSubview:pageControl];
    [self.view addSubview:subView];
    
}
-(void)getFirstPageDetailNews:(NSString *)image withDetail:(NSString *)detail
{
    UIViewController *firstPageNewsViewController=[[UIViewController alloc]initWithNibName:nil bundle:nil];
    firstPageNewsViewController.view.backgroundColor=[UIColor whiteColor];
    firstPageNewsViewController.navigationController.navigationBarHidden=NO;
    [self.navigationController pushViewController:firstPageNewsViewController animated:YES];
}

-(void)buttonClicked:(id)sender
{
    UIButton *button=(UIButton *)sender;
    int btTag=button.tag;
    switch (btTag) {
        case 0:
        {
            //苏大新闻
            NewsViewController *newsViewController = [[NewsViewController alloc]initWithNibName:nil bundle:nil];
            [self.navigationController pushViewController:newsViewController animated:YES];
            self.navigationController.navigationBar.hidden=NO;
        }
            break;
        case 1:
        {
            //网关应用
            NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
            if ([[defaults objectForKey:@"autoLogin"] isEqualToString:@"0"]) {
                GateWayViewController *appViewController = [[GateWayViewController alloc]initWithNibName:nil bundle:nil];
                [self.navigationController pushViewController:appViewController animated:NO];
                appViewController.navigationController.navigationBar.hidden=NO;
            }
            else{
                LoginViewController *loginViewController = [[LoginViewController alloc]initWithNibName:nil bundle:nil];
                [self.navigationController pushViewController:loginViewController animated:YES];
                self.navigationController.navigationBar.hidden=YES;
            }
        }
            break;
        case 2:
        {
            //班车路线
            WLMianBusViewController *busViewController = [[WLMianBusViewController alloc]initWithNibName:nil bundle:nil];
            [self.navigationController pushViewController:busViewController animated:YES];
            self.navigationController.navigationBar.hidden=NO;
        }
            break;
        case 3:
        {
            //苏大校历
            CalendarMainViewController *calendarViewController = [[CalendarMainViewController alloc]init];
            [self.navigationController pushViewController:calendarViewController animated:YES];
            self.navigationController.navigationBar.hidden=NO;
        }
            break;
        case 4:
        {
            //苏大通
            NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
            NSLog(@"..%@",[defaults objectForKey:@"cardAutoLogin"]);
            if ([[defaults objectForKey:@"cardAutoLogin"] isEqualToString:@"0"]) {
                NSString *account=[[NSUserDefaults standardUserDefaults]objectForKey:@"account"];
                CardModel *cardModel=[CardModel shareInstance];
                cardModel.delegate=self;
                [cardModel startRequest:@"autoLogin" withUrl:@"http://weixin.suda.edu.cn/servlet/GetUserPartDetail" withParam1:account withParam2: nil withParam3:nil withParam4:nil];
                CardViewController *cardViewController=[[CardViewController alloc]initWithNibName:nil bundle:nil];
                [self.navigationController pushViewController:cardViewController animated:YES];
                cardViewController.navigationController.navigationBar.hidden=NO;
            }else{
                CardLoginViewController *cardLoginViewController=[[CardLoginViewController alloc]initWithNibName:nil bundle:nil];
                [self.navigationController pushViewController:cardLoginViewController animated:YES];
                cardLoginViewController.navigationController.navigationBar.hidden=NO;
            }

        }
            break;
        case 5:
        {
            //即时天气
            WeatherViewController *weatherView = [[WeatherViewController alloc]initWithNibName:nil bundle:nil];
            [self.navigationController pushViewController:weatherView animated:YES];
            weatherView.navigationController.navigationBar.hidden = NO;
        }
            break;
        case 6:
        {
            //校内通知
            if ([netWorkStatus isEqualToString:@"0"]) {
                SchoolNewsViewController *schoolNewsViewController = [[SchoolNewsViewController alloc]initWithNibName:nil bundle:nil];
                [self.navigationController pushViewController:schoolNewsViewController animated:YES];
                schoolNewsViewController.navigationController.navigationBar.hidden=NO;
            }
            else{
                UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:nil message:@"您没有连到苏大无线网!!" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
                [alertView show];
            }
        }
            break;
        case 7:
        {
            //网关登录
            if ([netWorkStatus isEqualToString:@"0"]) {
                GateWayLoginViewController *gateWayLogin=[[GateWayLoginViewController alloc]initWithNibName:nil bundle:nil];
                [self.navigationController pushViewController:gateWayLogin animated:YES];
                self.navigationController.navigationBar.hidden=NO;
            }
            else{
                UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:nil message:@"您没有连到苏大无线网!!" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
                [alertView show];
            }
        }
            break;
        case 8:
        {
            //账号设置
            AccountSettingViewController *accountSettingViewController=[[AccountSettingViewController alloc]initWithNibName:nil bundle:nil];
            [self.navigationController pushViewController:accountSettingViewController animated:YES];
        }
            break;
        default:
            break;
    }
}
-(void)getAutoLoginResult:(CardBaseData *)result
{
    CardViewController *cardViewController=[[CardViewController alloc]initWithNibName:nil bundle:nil];
    cardViewController.cardBaseData=result;
    [self.navigationController pushViewController:cardViewController animated:YES];
    cardViewController.navigationController.navigationBar.hidden=NO;
}

#pragma mark - scrollView 委托函数
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat pagewidth = topScrollView.frame.size.width;
    int page = floor(topScrollView.contentOffset.x / pagewidth);
    page --;
    pageControl.currentPage = page;
}

#pragma mark - scrollView 委托函数
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat pagewidth = topScrollView.frame.size.width;
    int currentPage = floor(topScrollView.contentOffset.x/pagewidth);
    if (currentPage == 0) {
        [topScrollView scrollRectToVisible:CGRectMake(320 * 4, 0, 320, 150) animated:NO];
    }
    else if (currentPage == 5) {
        [topScrollView scrollRectToVisible:CGRectMake(320, 0, 320, 150) animated:NO];
    }
}

#pragma mark - 计时器方法
- (void)runTimePage
{
    int page = pageControl.currentPage;
    page ++;
    page = page > 3 ? 0 : page ;
    pageControl.currentPage = page;
    [self turnPage];
}

#pragma mark - 选择器的方法
- (void)turnPage
{
    int page = pageControl.currentPage;
    [topScrollView scrollRectToVisible:CGRectMake(320 * (page+1), 0, 320, 150) animated:NO];
}

-(void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    self.navigationController.navigationBar.hidden= YES;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
