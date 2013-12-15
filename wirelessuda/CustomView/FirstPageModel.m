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
    NSDictionary *news=[[responseString JSONValue]objectForKey:@"news"];
    
    NSDictionary *news1=[news objectForKey:@"news1"];
    NSLog(@"new1:%@",news1);
    NSDictionary *news2=[news objectForKey:@"news2"];
    NSLog(@"new2:%@",news2);
    NSDictionary *news3=[news objectForKey:@"news3"];
    NSDictionary *news4=[news objectForKey:@"news4"];
    NSMutableArray *newsInfo=[NSMutableArray arrayWithObjects:news1,news2,news3,news4, nil];
    [delegate getFirstPageNews:newsInfo];
}
@end
