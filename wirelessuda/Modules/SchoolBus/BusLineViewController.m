//
//  BusLineViewController.m
//  SchoolBusTest
//
//  Created by Tkey on 13-11-19.
//  Copyright (c) 2013年 TKey. All rights reserved.
//

#import "BusLineViewController.h"
#import "lineDetailViewController.h"
#import "BusLineDataSourde.h"
#import "BusLineCustomCell.h"
#import "FlatUIKit.h"

@implementation BusLineViewController

- (id)init
{
    self = [super init];
    return self;
}





- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

@synthesize selectTitle;
@synthesize lineData;

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIBarButtonItem *BackBtn = [[UIBarButtonItem alloc] initWithTitle:@"返回"
                                                                style:UIBarButtonItemStylePlain
                                                               target:self
                                                               action:@selector(backAction:)];
    self.navigationItem.leftBarButtonItem = BackBtn;
    lineData = [[[NSMutableArray alloc] initWithArray:[[BusLineDataSourde sharedData] linesArrayAndTimeSorted:selectTitle]] mutableCopy];
    NSLog(@"string");
}

- (void)backAction:(UIButton *)button
{
    [self.navigationController popViewControllerAnimated:YES];
}


- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [lineData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    NSLog(@"hello");
    
    NSMutableDictionary *p =  [lineData objectAtIndex:[indexPath row]];
    
    
    BusLineCustomCell *cell = [tableView  dequeueReusableCellWithIdentifier:@"BusLineCustomCell"];
    
    if (!cell) {
            cell = [[BusLineCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"BusLineCustomCell"];
    }

    
    if ([p objectForKey:@"Flag"] == [NSNumber numberWithInt:1]) {
        cell.timeLabel.backgroundColor = [UIColor greenColor];
        NSMutableString *t = [NSMutableString stringWithFormat:@"%@",[p objectForKey:@"Name"]];
        [cell.nameLabel setText:t];
        [cell.timeLabel setText:[NSString stringWithFormat:@"%@分钟后可乘",[p objectForKey:@"Last"]]];
        cell.timeLabel.backgroundColor = [UIColor greenColor];
        [cell.descriptionLabel setText:[NSString stringWithFormat:@"%@",[p objectForKey:@"Description"]]];
        [cell.stationLabel setText:[NSString stringWithFormat:@"%@",[p objectForKey:@"Station"]]];
        
    } else {
        if ([p objectForKey:@"Flag"] == [NSNumber numberWithInt:2]) {
            NSMutableString *t = [NSMutableString stringWithFormat:@"%@",[p objectForKey:@"Name"]];
            [cell.nameLabel setText:t];
            [cell.timeLabel setText:@"今日    尚有"];
            cell.timeLabel.backgroundColor = [UIColor yellowColor];
            [cell.descriptionLabel setText:[NSString stringWithFormat:@"%@",[p objectForKey:@"Description"]]];
            [cell.stationLabel setText:[NSString stringWithFormat:@"%@",[p objectForKey:@"Station"]]];

        }
        else {
            NSMutableString *t = [NSMutableString stringWithFormat:@"%@",[p objectForKey:@"Name"]];
            [cell.nameLabel setText:t];
            [cell.timeLabel setText:@"今日    已无"];
            cell.timeLabel.backgroundColor = [UIColor redColor];
            [cell.descriptionLabel setText:[NSString stringWithFormat:@"%@",[p objectForKey:@"Description"]]];
            [cell.stationLabel setText:[NSString stringWithFormat:@"%@",[p objectForKey:@"Station"]]];

        }
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%@",indexPath);
    lineDetailViewController *modal = [[lineDetailViewController alloc] init];
    NSDictionary *p = [lineData objectAtIndex:[indexPath row]];
    modal.detailLineInfo = [[NSArray alloc] initWithArray:[p objectForKey:@"DetailLine"]];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:modal];
    [self presentViewController:nav animated:YES completion:nil];
}

- (void)titleOfSelectButton:(NSString *)title
{
    selectTitle = title;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80.0;
}


@end
