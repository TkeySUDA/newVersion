//
//  CardData.m
//  wirelessuda
//
//  Created by Mac on 13-11-30.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import "CardData.h"
#import "SBJson.h"

@implementation CardBaseData

+(id)cardBaseDataWithJson:(NSString *)responseString
{
    CardBaseData *cardBaseData=[[CardBaseData alloc]init];
    NSDictionary *result=[responseString JSONValue];
    NSString *status=[result objectForKey:@"status"];
    if ([status isEqualToString:@"-2"]) {
        cardBaseData.status=status;
    }else if ([status isEqualToString:@"0"]){
        cardBaseData.status=status;
        cardBaseData.balance=[result objectForKey:@"balance"];
        cardBaseData.flag=[result objectForKey:@"flag"];
        cardBaseData.preTmpBalance=[result objectForKey:@"preTmpBalance"];
        cardBaseData.tmpBalance=[result objectForKey:@"tmpBalance"];
    }
    return cardBaseData;
}

@end

@implementation CardAllData

+(id)cardAllDataWithJson:(NSString *)responseString
{
    CardAllData *cardAllData=[[CardAllData alloc]init];
    NSDictionary *result=[[responseString JSONValue] objectForKey:@"result"];
    NSDictionary *userDTO=[result objectForKey:@"userDTO"];
    NSDictionary *cardUserDTO=[result objectForKey:@"cardUserDTO"];
    NSString *status=[result objectForKey:@"status"];
    if ([status isEqualToString:@"-2"]) {
        cardAllData.status=status;
    }else if ([status isEqualToString:@"0"]){
        cardAllData.status=status;
        cardAllData.balance=[cardUserDTO objectForKey:@"balance"];
        cardAllData.flag=[cardUserDTO objectForKey:@"flag"];
        cardAllData.preTmpBalance=[cardUserDTO objectForKey:@"preTmpBalance"];
        cardAllData.tmpBalance=[cardUserDTO objectForKey:@"tmpBalance"];
        cardAllData.photo=[result objectForKey:@"photo"];
        cardAllData.stuNum=[userDTO objectForKey:@"sno"];
        cardAllData.name=[userDTO objectForKey:@"name"];
        cardAllData.account=[userDTO objectForKey:@"account"];
        cardAllData.idDept=[cardUserDTO objectForKey:@"iddept"];
        cardAllData.pidName=[cardUserDTO objectForKey:@"pidname"];
        cardAllData.idNumber=[cardUserDTO objectForKey:@"idnumber"];
    }
    return cardAllData;
}
+(void)setDataAsDefault:(CardAllData *)data
{
    NSUserDefaults *userDefault=[NSUserDefaults standardUserDefaults];
    NSDictionary *allData=[NSDictionary dictionaryWithObjectsAndKeys:data.photo,@"photo",data.stuNum,@"stuNum",data.name,@"name",data.account,@"account",data.idDept,@"idDept",data.pidName,@"pidName",data.idNumber,@"idNumber", nil];
    [userDefault setObject:allData forKey:@"cardAllData"];
    [userDefault setObject:data.account forKey:@"account"];
    [userDefault synchronize];
}

@end