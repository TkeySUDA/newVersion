//
//  ButtonBarScrollView.m
//  wirelessuda
//
//  Created by 叶帆 on 13-11-27.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import "ButtonBarScrollView.h"

@implementation ButtonBarScrollView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.bounces=NO;
        self.pagingEnabled=YES;
        self.userInteractionEnabled=YES;
        self.showsHorizontalScrollIndicator=NO;
        self.scrollEnabled = YES;
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
