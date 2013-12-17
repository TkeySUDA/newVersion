//
//  DevelopersViewController.m
//  wirelessuda
//
//  Created by 叶帆 on 13-12-17.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import "DevelopersViewController.h"

@interface DevelopersViewController ()

@end

@implementation DevelopersViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.view.backgroundColor = [UIColor lightGrayColor];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UIButton *image = [UIButton buttonWithType:UIButtonTypeCustom];
    [image setBackgroundImage:[UIImage imageNamed:@"120.png"] forState:UIControlStateNormal];
    image.frame = CGRectMake(100, 120, 120, 120);
    image.backgroundColor = [UIColor clearColor];
    
    UILabel *app = [[UILabel alloc]initWithFrame:CGRectMake(120, 240, 80, 40)];
    app.text = @"无线苏大";
    app.textAlignment = UITextAlignmentCenter;
    
    UILabel *name = [[UILabel alloc]initWithFrame:CGRectMake(0, 280, 320, 40)];
    name.text = @"开发人员：王璞，叶帆，孙旭，陈晓强";
    name.textAlignment = UITextAlignmentCenter;
    
    UILabel *ui = [[UILabel alloc]initWithFrame:CGRectMake(0, 320, 320, 40)];
    ui.text = @"UI设计：王振";
    ui.textAlignment = UITextAlignmentCenter;
    
    UILabel *beta = [[UILabel alloc]initWithFrame:CGRectMake(0, 420, 320, 40)];
    beta.text = @"版权所有：信息化建设与管理中心";
    beta.textAlignment = UITextAlignmentCenter;
    
    [self.view addSubview:image];
    [self.view addSubview:app];
    [self.view addSubview:name];
    [self.view addSubview:ui];
    [self.view addSubview:beta];    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
