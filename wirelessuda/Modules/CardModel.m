//
//  CardModel.m
//  wirelessuda
//
//  Created by Mac on 13-11-30.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import "CardModel.h"
#import "SBJson.h"
#import "CardData.h"

@implementation CardModel

@synthesize delegate;

+(CardModel *)shareInstance
{
    CardModel *cardModel=[[CardModel alloc]init];
    return cardModel;
}
- (void) startRequest:(NSString *)tag withUrl:(NSString *)url withParam1:(NSString *)param1 withParam2:(NSString *)param2 withParam3:(NSString *)param3 withParam4:(NSString *)param4{
//    if ([tag isEqualToString:@"notFirstAndNotAuto"]) {
//        NSString *urlString = [NSString stringWithFormat:@"%@?username=%@&password=%@&usertype=1&logintype=2",url,param1,param2];
//        NSLog(@"%@",urlString);
//        NSURL *urlLast=[NSURL URLWithString:urlString];
//        ASIHTTPRequest *request=[ASIHTTPRequest requestWithURL:urlLast];
//        request.delegate=self;
//        request.tag=CardLogin;
//        [request startSynchronous];
//    }
//    else
    if([tag isEqualToString:@"FirstLogin"]){
        NSString *urlString = [NSString stringWithFormat:@"%@?username=%@&password=%@&usertype=1&logintype=2",url,param1,param2];
        NSURL *urlLast=[NSURL URLWithString:urlString];
        ASIHTTPRequest *request=[ASIHTTPRequest requestWithURL:urlLast];
        request.delegate=self;
        request.tag=CardFirstLogin;
        [request startSynchronous];
    }else if ([tag isEqualToString:@"autoLogin"]){
        NSString *urlString = [NSString stringWithFormat:@"%@?account=%@",url,param1];
        NSURL *urlLast=[NSURL URLWithString:urlString];
        ASIHTTPRequest *request=[ASIHTTPRequest requestWithURL:urlLast];
        request.delegate=self;
        request.tag=AutoLogin;
        [request startSynchronous];
    }
    else if ([tag isEqualToString:@"GuaShi"]){
        NSString *urlString=[NSString stringWithFormat:@"%@?account=%@&password=%@",url,param1,param2];
        NSURL *urlLast=[NSURL URLWithString:urlString];
        NSLog(@"url:%@",urlString);
        ASIHTTPRequest *request=[ASIHTTPRequest requestWithURL:urlLast];
        request.delegate=self;
        request.tag=GuaShi;
        [request startSynchronous];
    }else if ([tag isEqualToString:@"ChangePassword"]){
        NSString *urlString=[NSString stringWithFormat:@"%@?account=%@&password=%@&newPassword=%@",url,param1,param2,param2];
        NSURL *urlLast=[NSURL URLWithString:urlString];
        ASIHTTPRequest *request=[ASIHTTPRequest requestWithURL:urlLast];
        request.delegate=self;
        request.tag=PassWord;
        [request startSynchronous];
    }
}

-(void)requestFinished:(ASIHTTPRequest *)request
{
    NSString *responseString=request.responseString;
    if (request.tag==CardFirstLogin){
        CardAllData *cardAllData=[CardAllData cardAllDataWithJson:responseString];
        [CardAllData setDataAsDefault:cardAllData];
        NSDictionary *all=[[NSUserDefaults standardUserDefaults] objectForKey:@"cardAllData"];
        NSLog(@"cardALLdata:%@",all);
        [delegate getLoginResult:cardAllData];
        [[NSUserDefaults standardUserDefaults]setObject:@"1" forKey:@"cardFirstLogin"];
    }else if (request.tag==AutoLogin){
        CardBaseData *cardBaseData=[CardBaseData cardBaseDataWithJson:responseString];
        [delegate getAutoLoginResult:cardBaseData];
    }
    else if(request.tag==GuaShi)
    {
        NSLog(@"挂失：%@",responseString);
        NSDictionary *result=[[responseString JSONValue]objectForKey:@"result"];
        NSString *resultin=[result objectForKey:@"resultin"];
        [delegate getGuaShiResult:resultin];
    }else if (request.tag==PassWord){
        NSLog(@"修改密码成功");
        [[NSUserDefaults standardUserDefaults] setObject:@"0" forKey:@"cardFirstLogin"];
    }
}
@end
