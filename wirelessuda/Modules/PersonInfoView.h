//
//  PersonInfoView.h
//  wirelessuda
//
//  Created by Mac on 13-11-26.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PersonInfoView : UIView

@property(strong, nonatomic)UIButton *photoImage;
@property(strong, nonatomic)UILabel *name;
@property(strong, nonatomic)UILabel *sex;
@property(strong, nonatomic)UILabel *cardNum;

-(void)setStuInfo:(NSDictionary *)stuInfo;
@end
