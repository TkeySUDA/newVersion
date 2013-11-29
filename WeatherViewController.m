//
//  WeatherViewController.m
//  wirelessuda
//
//  Created by 叶帆 on 13-11-24.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import "WeatherViewController.h"
#import "WeatherView.h"

@interface WeatherViewController ()

@end

@implementation WeatherViewController

@synthesize result;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.view.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    WeatherView *weatherView = [[WeatherView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        
    WeatherModel *weather = [WeatherModel shareInstance];
    weather.delegate = self;
    [weather cityUrl];
    
    weatherView.city.text = [result objectForKey:@"city"];
    weatherView.date.text = [result objectForKey:@"date_y"];
    weatherView.week.text = [result objectForKey:@"week"];
    weatherView.fchh.text = [result objectForKey:@"img_title_single"];
    weatherView.temp.text = [result objectForKey:@"temp1"];
    [self.view addSubview:weatherView];
    
}

- (void)getResult:(NSDictionary *)cityInfo
{
    result = cityInfo;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
