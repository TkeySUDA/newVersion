//
//  ConsumptionView.h
//  wirelessuda
//
//  Created by Mac on 13-11-27.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CardModel.h"

@interface ConsumptionView : UIView<UITableViewDataSource,UITableViewDelegate,CardDelegate>

@property (strong, nonatomic)UITableView *tableView;
@property (strong, nonatomic)NSMutableArray *consumption;

-(void)setContentOfView;

@end
