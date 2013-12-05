//
//  CardModel.h
//  wirelessuda
//
//  Created by Mac on 13-11-30.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

typedef enum {
    CardFirstLogin,
    CardLogin,
    DetailInfo,
    //ChangePassWord,
    GuaShi,
    Consumption
} CardLine;

@protocol CardDelegate;

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"
#import "CardData.h"

@interface CardModel : NSObject<ASIHTTPRequestDelegate>

@property (strong, nonatomic) id<CardDelegate> delegate;

+ (CardModel *)shareInstance;
- (void) startRequest:(NSString *)tag withUrl:(NSString *)url withParam1:(NSString *)param1 withParam2:(NSString *)param2 withParam3:(NSString *)param3 withParam4:(NSString *)param4;
@end

@protocol CardDelegate <NSObject>

@optional

-(void)getLoginResult:(CardAllData *)result;
-(void)getLoginStatus:(NSString *)result;

@end
