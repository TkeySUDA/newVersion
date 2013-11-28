//
//  WeatherView.h
//  wirelessuda
//
//  Created by 叶帆 on 13-11-24.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeatherView : UIView

@property(strong, nonatomic)UILabel *city;//城市
@property(strong, nonatomic)UILabel *date;//农历
@property(strong, nonatomic)UILabel *week;//星期
@property(strong, nonatomic)UILabel *fchh;//时间
@property(strong, nonatomic)UILabel *temp;//温度

@end
