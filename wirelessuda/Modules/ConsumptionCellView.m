//
//  ConsumptionCellView.m
//  wirelessuda
//
//  Created by Mac on 13-11-18.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import "ConsumptionCellView.h"

@implementation ConsumptionCellView

@synthesize turnover;
@synthesize turnoverNumber;
@synthesize balance;
@synthesize balanceNumber;
@synthesize time;
@synthesize place;
@synthesize type;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        turnover= [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 80, 30)];
        turnover.text = @"交易额:";
        turnover.font = [UIFont fontWithName:@"Helvetica" size:16];
        turnover.textAlignment = UITextAlignmentCenter;
        turnover.backgroundColor = [UIColor clearColor];
        
        turnoverNumber = [[UILabel alloc]initWithFrame:CGRectMake(90, 0, 80, 50)];
        turnoverNumber.font = [UIFont fontWithName:@"Helvetica" size:25];
        turnoverNumber.textAlignment = UITextAlignmentCenter;
        turnoverNumber.backgroundColor = [UIColor clearColor];
        turnoverNumber.textColor = [UIColor redColor];
        
        balance= [[UILabel alloc]initWithFrame:CGRectMake(160, 10, 80, 30)];
        balance.text = @"余额:";
        balance.font = [UIFont fontWithName:@"Helvetica" size:16];
        balance.textAlignment = UITextAlignmentCenter;
        balance.backgroundColor = [UIColor clearColor];
        
        balanceNumber = [[UILabel alloc]initWithFrame:CGRectMake(240, 0, 80, 50)];
        balanceNumber.font = [UIFont fontWithName:@"Helvetica" size:25];
        balanceNumber.textAlignment = UITextAlignmentCenter;
        balanceNumber.backgroundColor = [UIColor clearColor];
        balanceNumber.textColor = [UIColor redColor];
        
        time = [[UILabel alloc]initWithFrame:CGRectMake(20, 80, 300, 20)];
        time.font = [UIFont fontWithName:@"Helvetica" size:16];
        time.textAlignment = UITextAlignmentLeft;
        time.backgroundColor = [UIColor clearColor];
        
        place = [[UILabel alloc]initWithFrame:CGRectMake(20, 50, 310, 20)];
        place.font = [UIFont fontWithName:@"Helvetica" size:16];
        place.textAlignment = UITextAlignmentLeft;
        place.backgroundColor = [UIColor clearColor];
        
        [self addSubview:turnover];
        [self addSubview:turnoverNumber];
        [self addSubview:balance];
        [self addSubview:balanceNumber];
        [self addSubview:time];
        [self addSubview:type];
        [self addSubview:place];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
