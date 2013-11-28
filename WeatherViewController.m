//
//  WeatherViewController.m
//  wirelessuda
//
//  Created by 叶帆 on 13-11-24.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import "WeatherViewController.h"
#import "WeatherView.h"
#import "WeatherData.h"

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
    
    //WeatherData *data = [[WeatherData alloc]init];
    //NSDictionary *weatherInfo = [data startJSONSting];
    
    WeatherModel *weather = [WeatherModel shareInstance];
    weather.delegate = self;
    [weather cityUrl];
    
    weatherView.city.text  = [result objectForKey:@"city"];
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
