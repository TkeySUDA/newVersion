//
//  DetailInfoView.m
//  wirelessuda
//
//  Created by Mac on 13-11-27.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import "DetailInfoView.h"

@implementation DetailInfoView
@synthesize idDeptLabel,idNumberLabel,balanceLabel,pidNameLabel;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        NSDictionary *cardAllData=[[NSUserDefaults  standardUserDefaults] objectForKey:@"cardAllData"];
        idDeptLabel=[[UILabel alloc]initWithFrame:CGRectMake(10, 0, 310, 30)];
        idDeptLabel.backgroundColor=[UIColor clearColor];
        idDeptLabel.textAlignment=NSTextAlignmentLeft;
        NSString *idDept=[cardAllData objectForKey:@"idDept"];
        idDeptLabel.text=[NSString stringWithFormat:@"所属部门：%@",idDept];
        idDeptLabel.font=[UIFont systemFontOfSize:15];
        
        pidNameLabel=[[UILabel alloc]initWithFrame:CGRectMake(10, 30, 310, 30)];
        pidNameLabel.backgroundColor=[UIColor clearColor];
        pidNameLabel.textAlignment=NSTextAlignmentLeft;
        NSString *pidName=[cardAllData objectForKey:@"pidName"];
        pidNameLabel.text=[NSString stringWithFormat:@"身份类型：%@",pidName];
        pidNameLabel.font=[UIFont systemFontOfSize:15];
        
        idNumberLabel=[[UILabel alloc]initWithFrame:CGRectMake(10, 60, 310, 30)];
        idNumberLabel.backgroundColor=[UIColor clearColor];
        idNumberLabel.textAlignment=NSTextAlignmentLeft;
        NSString *idNumber=[cardAllData objectForKey:@"idNumber"];
        idNumberLabel.text=[NSString stringWithFormat:@"身份证：%@",idNumber];
        idNumberLabel.font=[UIFont systemFontOfSize:15];
        
        balanceLabel=[[UILabel alloc]initWithFrame:CGRectMake(10, 90, 310, 30)];
        balanceLabel.backgroundColor=[UIColor clearColor];
        balanceLabel.textAlignment=NSTextAlignmentLeft;
        NSString *balanceString=[cardAllData objectForKey:@"balance"];
        float balance=[balanceString floatValue]/100;
        balanceLabel.text=[NSString stringWithFormat:@"余额：%.2f元",balance];
        balanceLabel.font=[UIFont systemFontOfSize:15];
        
        [self addSubview:idDeptLabel];
        [self addSubview:pidNameLabel];
        [self addSubview:idNumberLabel];
        [self addSubview:balanceLabel];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
