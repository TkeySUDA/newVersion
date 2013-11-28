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
@synthesize name,stuId;
@synthesize tableView=_tableView;

@synthesize turnover,balance,type,place,time;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        name=[[UILabel alloc]initWithFrame:CGRectMake(20, 0, 80, 40)];
        name.text=@"姓名:孙旭";
        name.backgroundColor = [UIColor clearColor];
        name.textColor=[UIColor  whiteColor];
        stuId=[[UILabel alloc]initWithFrame:CGRectMake(20, 20, 150, 40)];
        stuId.text=@"账号:1127403119";
        stuId.backgroundColor = [UIColor clearColor];
        stuId.textColor=[UIColor whiteColor];
        
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 60, 320, SCREEN_HEIGHT-164-64) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        [self addSubview:name];
        [self addSubview:stuId];
        [self addSubview:_tableView];
        
        turnover = [[NSMutableArray alloc]initWithObjects:@"-6.70", @"-9.00", @"-6.00", @"-0.40", @"-2.00",@"-3.00", @"-2.00", @"-2.90", @"-8.70", @"-1.50",nil];
        balance = [[NSMutableArray alloc]initWithObjects:@"202.40", @"209.10", @"218.10", @"224.10", @"224.50", @"226.50", @"229.50", @"231.50", @"234.40", @"243.10", nil];
        type = [[NSMutableArray alloc]initWithObjects:@"持卡人消费", @"持卡人消费", @"持卡人消费", @"持卡人消费", @"银行ATM存取", @"持卡人消费", @"持卡人消费", @"支付宝转账", @"持卡人消费", @"持卡人消费", nil];
        place = [[NSMutableArray alloc]initWithObjects:@"东区教育超市C", @"苏州大学东区食堂", @"苏州大学东区食堂", @"第三方对接子系统", @"本部方塔餐厅", @"苏州大学本部莘园餐厅", @"本部教育超市A",@"水控管理子系统", @"水控管理子系统", @"水控管理子系统",nil];
        time = [[NSMutableArray alloc]initWithObjects:@"2013/11/18 18:02:10", @"2013/11/18 17:47:45", @"2013/11/18 17:46:21", @"2013/11/18 17:38:54", @"2013/11/18 17:37:16", @"2013/11/18 12:32:14", @"2013/11/18 09:57:14", @"2013/11/17 12:53:11", @"2013/11/17 09:51:37", @"2013/11/16 13:15:21", nil];
    }
    return self;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [turnover count];
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
    cell.turnoverNumber.text = [turnover objectAtIndex:indexPath.row];
    cell.balanceNumber.text = [balance objectAtIndex:indexPath.row];
    cell.type.text = [NSString stringWithFormat:@"交易类型:%@",[type objectAtIndex:indexPath.row]];
    cell.place.text = [NSString stringWithFormat:@"交易地点:%@",[place objectAtIndex:indexPath.row]];
    cell.time.text = [NSString stringWithFormat:[time objectAtIndex:indexPath.row],nil];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
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
