//
//  ConsumptionView.m
//  wirelessuda
//
//  Created by Mac on 13-11-27.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import "ConsumptionView.h"
#import "ConsumptionCellView.h"

@implementation ConsumptionView
@synthesize tableView=_tableView;
@synthesize consumption;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 10, 320, SCREEN_HEIGHT-164-35) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self addSubview:_tableView];
    }
    return self;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 105;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [consumption count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellWithIdentifier = @"ConsumptionCellView";
    ConsumptionCellView *cell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier];
    if (cell == nil) {
        cell = [[ConsumptionCellView alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellWithIdentifier];
    }
    if (indexPath.row % 2 == 0) {
        cell.backgroundColor = [UIColor colorWithRed:210/255.0 green:210/255.0 blue:210/255.0 alpha:1];
    }
    else
    {
        cell.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1];
    }
    CardConsumptionData *cardConsumptionData=[consumption objectAtIndex:indexPath.row];
    cell.turnoverNumber.text = cardConsumptionData.FTranAmt;
    cell.balanceNumber.text = cardConsumptionData.FCardBalance;
    NSString *address=cardConsumptionData.sysname1;
    cell.place.text = [NSString stringWithFormat:@"交易地点:%@",address];
    NSString *date=cardConsumptionData.jndatetime;
    cell.time.text = [NSString stringWithFormat:date,nil];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(void)setContentOfView
{
    CardModel *cardModel=[CardModel shareInstance];
    NSString *account=[[NSUserDefaults standardUserDefaults]objectForKey:@"account"];
    cardModel.delegate=self;
    [cardModel startRequest:@"Consumption" withUrl:@"http://weixin.suda.edu.cn/servlet/TodayTrjnLogBrows" withParam1:account withParam2:nil withParam3:nil withParam4:nil];
}
-(void)getConsumptionData:(NSMutableArray *)data
{
    consumption=data;
    [_tableView reloadData];
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
