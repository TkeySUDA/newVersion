//
//  mainViewScrollView.h
//  WirelessSudaV1-1.01
//
//  Created by Mac on 13-10-25.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//
@protocol FirstPageButtonDelegtate <NSObject>

@optional
-(void)getFirstPageDetailNews:(NSString *)detail;
@end

#import <UIKit/UIKit.h>
#import "FirstPageModel.h"

@interface mainViewScrollView : UIScrollView<UIScrollViewDelegate,FirstPageDelegtate>

@property (strong, nonatomic)NSMutableArray *imagePage;
@property (strong, nonatomic)NSMutableArray *detail;
@property (strong, nonatomic)id<FirstPageButtonDelegtate> buttonDelegate;

-(void)setImage;
@end
