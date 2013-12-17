//
//  PersonInfoView.m
//  wirelessuda
//
//  Created by Mac on 13-11-26.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import "PersonInfoView.h"
#import "UIButton+WebCache.h"

@implementation PersonInfoView
@synthesize photoImage,name,sex,cardNum;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor=WLSuda_gray;
        photoImage=[UIButton buttonWithType:UIButtonTypeCustom];
        photoImage.frame=CGRectMake(5, 5, 70, 90);
        name=[[UILabel alloc]initWithFrame:CGRectMake(80, 0, 120, 40)];
        name.textAlignment=NSTextAlignmentLeft;
        name.text=@"姓名:";
        name.backgroundColor = [UIColor clearColor];
        sex=[[UILabel alloc]initWithFrame:CGRectMake(80, 30, 80, 40)];
        sex.textAlignment=NSTextAlignmentLeft;
        sex.text=@"性别:";
        sex.backgroundColor = [UIColor clearColor];
        cardNum=[[UILabel alloc]initWithFrame:CGRectMake(80, 60, 150, 40)];
        
        [self addSubview:photoImage];
        [self addSubview:name];
        [self addSubview:sex];
        [self addSubview:cardNum];
    }
    return self;
}
-(void)setStuInfo:(NSDictionary *)stuInfo
{
    NSString *photo=[stuInfo objectForKey:@"photo"];
    NSURL *photoUrl=[NSURL URLWithString:photo];
    [photoImage setImageWithURL:photoUrl forState:UIControlStateNormal];
    NSString *nameString=[stuInfo objectForKey:@"name"];
    name.text=[NSString stringWithFormat:@"姓名:%@",nameString];
    NSString *sexName=[stuInfo objectForKey:@"sexName"];
    sex.text=[NSString stringWithFormat:@"性别:%@",sexName];
    NSString *stuNum=[stuInfo objectForKey:@"stuNum"];
    cardNum.text=[NSString stringWithFormat:@"卡号:%@",stuNum];
    
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
