//
//  WeatherView.m
//  wirelessuda
//
//  Created by 叶帆 on 13-11-24.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import "WeatherView.h"

@implementation WeatherView

@synthesize city;
@synthesize date;
@synthesize week;
@synthesize fchh;
@synthesize temp;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code

        city = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 200, 30)];
        [self addSubview:city];
        
        date = [[UILabel alloc]initWithFrame:CGRectMake(10, 40, 200, 30)];
        [self addSubview:date];
        
        week = [[UILabel alloc]initWithFrame:CGRectMake(10, 70, 200, 30)];
        [self addSubview:week];
        
        fchh = [[UILabel alloc]initWithFrame:CGRectMake(10, 100, 200, 30)];
        [self addSubview:fchh];
        
        temp = [[UILabel alloc]initWithFrame:CGRectMake(10, 130, 200, 30)];
        [self addSubview:temp];
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
