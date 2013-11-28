//
//  WeatherModel.m
//  wirelessuda
//
//  Created by 叶帆 on 13-11-24.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import "WeatherModel.h"
#import "SBJson.h"
#import "ASIHTTPRequest.h"

@implementation WeatherModel

@synthesize delegate;
@synthesize weatherId;

+ (WeatherModel *)shareInstance
{
    WeatherModel *weatherModel = [[WeatherModel alloc]init];
    return weatherModel;
}

//- (void)getCityCode
//{
//    //解析网址通过ip 获取城市天气代码
//    NSURL *url = [NSURL URLWithString:@"http://61.4.185.48:81/g/"];
//    
////    //定义一个NSError对象，用于捕获错误信息
////    NSError *error;
////    NSString *jsonString = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&error];
//    
//    ASIHTTPRequest *request=[ASIHTTPRequest requestWithURL:url];
//    request.tag=1;
//    request.delegate=self;
//    [request retain];
//    [request startAsynchronous];
//    //得到城市代码字符串，截取出城市代码
//
//}

- (void)cityUrl
{
    NSString *url = @"http://m.weather.com.cn/data/101190401.html";
    NSURL *urlList = [NSURL URLWithString:url];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:urlList];
    request.delegate = self;
    [request startSynchronous];
}

- (void)requestFinished:(ASIHTTPRequest *)request
{
        NSString *responseString=request.responseString;
        NSDictionary *response = [responseString JSONValue];
        NSDictionary *result = [response objectForKey:@"weatherinfo"];
        [delegate getResult:result];

}

- (void)requestFailed:(ASIHTTPRequest *)request
{
    NSError *error = [request error];
    NSLog(@">>>>>>>>>>>>>>>%@",error);
}

@end
