//
//  CardData.h
//  wirelessuda
//
//  Created by Mac on 13-11-30.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CardBaseData : NSObject

@property (strong, nonatomic) NSString *status;
@property (strong, nonatomic) NSString *flag;
@property (strong, nonatomic) NSString *balance;//余额
@property (strong, nonatomic) NSString *preTmpBalance;//上次过渡余额
@property (strong, nonatomic) NSString *tmpBalance;//当前过渡余额;

+(id)cardBaseDataWithJson:(NSString *)responseString;
@end

@interface CardAllData : CardBaseData

@property (strong, nonatomic) NSString *photo;
@property (strong, nonatomic) NSString *stuNum;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *account;
@property (strong, nonatomic) NSString *idDept;//所属部门
@property (strong, nonatomic) NSString *pidName;//身份类型，本科生
@property (strong, nonatomic) NSString *idNumber;//身份证号

+(id)cardAllDataWithJson:(NSString *)responseString;
+(void)setDataAsDefault:(CardAllData *)data;
@end

