//
//  NewsViewController.h
//  wirelessuda
//
//  Created by 叶帆 on 13-11-27.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ButtonBarScrollView.h"
#import "WLSudaCommonViewController.h"

@interface NewsViewController :  WLSudaCommonViewController<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate,NSXMLParserDelegate>

@property (nonatomic, strong)ButtonBarScrollView *scrollView;
@property (nonatomic, strong)UIImage *btnStretchImg;

@property (nonatomic, strong)NSMutableArray *rssList;
@property (nonatomic, strong)NSMutableDictionary *currentItem;
@property (nonatomic, strong)NSMutableString *currentContents;
@property (nonatomic, strong) NSArray *nameArray;
@property (nonatomic) NSInteger prevButtonIndex;

@property (nonatomic, strong)UITableView *newsTableView;

@end
