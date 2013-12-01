//
//  BusLineViewController.h
//  SchoolBusTest
//
//  Created by Tkey on 13-11-19.
//  Copyright (c) 2013年 TKey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLMianBusViewController.h"
#import "BusLineCustomCell.h"
#import "FlatUIKit.h"

@interface BusLineViewController : UIViewController
<UITableViewDataSource, UITableViewDelegate,buttonSelectDelegate>

{
    
    __weak IBOutlet UITableView *busLineTable;
}

@property (nonatomic, strong) NSString *selectTitle;
@property (nonatomic, strong) NSMutableArray *lineData;

@end
