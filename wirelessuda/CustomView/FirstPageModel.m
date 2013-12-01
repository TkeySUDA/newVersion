//
//  FirstPageModel.m
//  wirelessuda
//
//  Created by Mac on 13-11-30.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import "FirstPageModel.h"
#import "SBJson.h"

@implementation FirstPageModel
@synthesize delegate;

+(FirstPageModel *)shareInstance
{
    FirstPageModel *firstPageModel=[[FirstPageModel alloc]init];
    return firstPageModel;
}

-(void)startFirstPageRequest
{
    NSURL *url=[NSURL URLWithString:@"http://jsglxt.suda.edu.cn//firstnews.action"];
    ASIHTTPRequest *request=[ASIHTTPRequest requestWithURL:url];
    request.delegate=self;
    [request retain];
    [request startAsynchronous];
}
-(void)requestFinished:(ASIHTTPRequest *)request
{
    NSString *responseString=[request responseString];
    NSDictionary *result=[responseString JSONValue];
    NSDictionary *news=[[result objectForKey:@"news"] JSONValue];
    
    NSDictionary *news1=[[news objectForKey:@"news1"] JSONValue];
    NSDictionary *news2=[[news objectForKey:@"news2"] JSONValue];
    NSDictionary *news3=[[news objectForKey:@"news3"] JSONValue];
    NSDictionary *news4=[[news objectForKey:@"news4"] JSONValue];

    NSLog(@">>>>>>>>>%@",news);
    NSMutableArray *newsInfo=[NSMutableArray arrayWithObjects:news1,news2,news3,news4, nil];
    [delegate getFirstPageNews:newsInfo];
}
@end
