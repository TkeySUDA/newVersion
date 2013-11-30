//
//  CardModel.m
//  wirelessuda
//
//  Created by Mac on 13-11-30.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import "CardModel.h"
#import "SBJson.h"

@implementation CardModel

@synthesize delegate;

+(CardModel *)shareInstance
{
    CardModel *cardModel=[[CardModel alloc]init];
    return cardModel;
}
- (void) startRequest:(NSString *)tag withUrl:(NSString *)url withParam1:(NSString *)param1 withParam2:(NSString *)param2 withParam3:(NSString *)param3 withParam4:(NSString *)param4{
    if ([tag isEqualToString:@"login"]) {
        NSString *urlString = [NSString stringWithFormat:@"%@?username=%@&password=%@&usertype=1*logintype=1",url,param1,param2];
        NSURL *urlLast=[NSURL URLWithString:urlString];
        ASIHTTPRequest *request=[ASIHTTPRequest requestWithURL:urlLast];
        request.delegate=self;
        request.tag=Login;
        [request startSynchronous];
    }
}

-(void)requestFinished:(ASIHTTPRequest *)request
{
    NSString *responseString=request.responseString;
    if (request.tag==Login) {
        NSDictionary *result=[[responseString JSONValue] objectForKey:@"result"];
        NSString *status=[result objectForKey:@"status"];
        [delegate getLoginStatus:status];
    }
}
@end
