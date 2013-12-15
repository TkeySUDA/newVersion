//
//  GuaShiView.h
//  wirelessuda
//
//  Created by Mac on 13-11-27.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "CardModel.h"
@protocol CardGuaShiDelegate <NSObject>
-(void)getSuccedStatus:(NSString *)status;

@optional

@end
@interface GuaShiView : UIView<CardDelegate>

@property (strong, nonatomic)UILabel *usernameLabel;
@property (strong, nonatomic)UILabel *usernameField;
@property (strong, nonatomic)UILabel *passwordLabel;
@property (strong, nonatomic)UITextField *passwordField;
@property (strong, nonatomic)id<CardGuaShiDelegate> delegate;
@end

