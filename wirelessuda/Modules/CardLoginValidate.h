//
//  CardLoginValidate.h
//  wirelessuda
//
//  Created by Mac on 13-12-3.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CardModel.h"
#import "CardData.h"

@protocol CardLoginValidateDelegate;

@interface CardLoginValidate : NSObject<CardDelegate>
@property(strong, nonatomic)id<CardLoginValidateDelegate> delegate;

-(void)validateCardLogin:(NSString *)username withPassword:(NSString*) password withLoginType:(NSString *)loginType withUserType:(NSString *)userType;
@end

@protocol CardLoginValidateDelegate<NSObject>

@optional

-(void)getCardResult:(CardAllData *)result;
-(void)getCardLoginStatus:(NSString *)status;
@end