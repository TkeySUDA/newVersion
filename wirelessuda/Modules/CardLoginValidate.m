//
//  CardLoginValidate.m
//  wirelessuda
//
//  Created by Mac on 13-12-3.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import "CardLoginValidate.h"

@implementation CardLoginValidate
@synthesize delegate;

//status=0:登录成功，status＝1:用户名为空，status＝2:密码为空，status＝3：用户名或者密码输入错误。
-(void)validateCardLogin:(NSString *)username withPassword:(NSString *)password withLoginType:(NSString *)loginType withUserType:(NSString *)userType
{
    CardModel *cardModel=[CardModel shareInstance];
    
    if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"cardFirstLogin"] isEqualToString:@"1"]&&[[[NSUserDefaults standardUserDefaults] objectForKey:@"cardUsername"]isEqualToString:username]) {
        NSLog(@"不是第一次登录");
        if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"cardAutoLogin"] isEqualToString:@"1"]) {
            cardModel.delegate=self;
            [cardModel startRequest:@"notFirstAndNotAuto" withUrl:@"http://weixin.suda.edu.cn/servlet/LoginToCard" withParam1:username withParam2:password withParam3:nil withParam4:nil];
        }
    }
    else{
        cardModel.delegate=self;
        [cardModel startRequest:@"FirstLogin" withUrl:@"http://weixin.suda.edu.cn/servlet/GetUserAllDetail"withParam1:username withParam2:password withParam3:nil withParam4:nil];
        
    }
}
-(void)getLoginResult:(CardAllData *)result
{
    [delegate getCardResult:result];
}
-(void)getLoginStatus:(NSString *)result
{
    [delegate getCardLoginStatus:result];
}
@end
