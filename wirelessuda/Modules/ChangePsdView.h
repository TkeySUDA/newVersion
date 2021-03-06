//
//  ChangePsdView.h
//  wirelessuda
//
//  Created by Mac on 13-11-27.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//
@protocol CardChangePsdDelegate <NSObject>
-(void)getPsdSuccedStatus:(NSString *)status;

@optional

@end
#import <UIKit/UIKit.h>
#import "CardModel.h"

@interface ChangePsdView : UIView<CardDelegate>

@property (strong, nonatomic)UILabel *beformPsdLabel;
@property (strong, nonatomic)UITextField *beformPsdText;
@property (strong, nonatomic)UILabel *changedPsdLabel;
@property (strong, nonatomic)UITextField *changedPsdText;
@property (strong, nonatomic)UILabel *conformPsdLabel;
@property (strong, nonatomic)UITextField *conformPsdText;
@property (strong, nonatomic)id<CardChangePsdDelegate> delegate;
@end
