//
//  FirstPageNewsViewController.m
//  wirelessuda
//
//  Created by Mac on 13-12-17.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import "FirstPageNewsViewController.h"

@interface FirstPageNewsViewController ()

@end

@implementation FirstPageNewsViewController

@synthesize newsDetail;
@synthesize detailUrl;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    newsDetail=[[UIWebView alloc]initWithFrame:CGRectMake(0, 0, 320, SCREEN_HEIGHT)];
    NSURL *url=[NSURL URLWithString:detailUrl];
    NSLog(@"%@",url);
    [newsDetail loadRequest:[NSURLRequest requestWithURL:url]];
    [self.view addSubview:newsDetail];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
