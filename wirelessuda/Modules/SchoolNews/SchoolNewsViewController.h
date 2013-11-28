//
//  SchoolNewsViewController.h
//  wirelessuda
//
//  Created by 叶帆 on 13-11-26.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SchoolNewsViewController : UIViewController<UITableViewDataSource,UITableViewDelegate, NSXMLParserDelegate>

@property (nonatomic, strong)NSMutableArray *rssList;
@property (nonatomic, strong)NSMutableDictionary *currentItem;
@property (nonatomic, strong)NSMutableString *currentContents;

@property (nonatomic, strong)UITableView *newsTableView;

@end
