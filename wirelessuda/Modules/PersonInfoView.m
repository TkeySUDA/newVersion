//
//  PersonInfoView.m
//  wirelessuda
//
//  Created by Mac on 13-11-26.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import "PersonInfoView.h"

@implementation PersonInfoView
@synthesize photo,name,sex,turnOver,cardNum;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor=[UIColor orangeColor];
        photo=[[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 50, 50)];
        [photo setImage:[UIImage imageNamed:@"1.png"]];
        name=[[UILabel alloc]initWithFrame:CGRectMake(70, 10, 80, 40)];
        name.textAlignment=NSTextAlignmentLeft;
        name.text=@"姓名:";
        name.backgroundColor = [UIColor clearColor];
        sex=[[UILabel alloc]initWithFrame:CGRectMake(70, 50, 80, 40)];
        sex.textAlignment=NSTextAlignmentLeft;
        sex.text=@"性别:";
        sex.backgroundColor = [UIColor clearColor];
        turnOver=[[UILabel alloc]initWithFrame:CGRectNull];
        cardNum=[[UILabel alloc]initWithFrame:CGRectNull];
        
        [self addSubview:photo];
        [self addSubview:name];
        [self addSubview:sex];
        [self addSubview:turnOver];
        [self addSubview:cardNum];
    }
    return self;
}
-(void)setStuInfo:(NSDictionary *)stuInfo
{
    NSString *nameString=[stuInfo objectForKey:@"name"];
    name.text=[NSString stringWithFormat:@"姓名:%@",nameString];
    NSString *sexName=[stuInfo objectForKey:@"sexName"];
    sex.text=[NSString stringWithFormat:@"性别:%@",sexName];
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
