//
//  SchoolNewsDetailViewController.m
//  wirelessuda
//
//  Created by 叶帆 on 13-11-26.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import "SchoolNewsDetailViewController.h"

@interface SchoolNewsDetailViewController ()

@end

@implementation SchoolNewsDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.navigationItem.title = @"新闻详情";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.detailWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320, SCREEN_HEIGHT)];
    
    self.detailWebView.scalesPageToFit = YES;
    
    [self.detailWebView loadHTMLString:[NSString stringWithContentsOfURL:[NSURL URLWithString:self.detailURL] encoding:NSUTF8StringEncoding error:nil]  baseURL:nil];
    [self.view addSubview:self.detailWebView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
