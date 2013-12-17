//
//  SchoolNewsViewController.m
//  wirelessuda
//
//  Created by 叶帆 on 13-11-26.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import "SchoolNewsViewController.h"
#import "SchoolNewsDetailViewController.h"
#import "SchoolNewsCell.h"

@interface SchoolNewsViewController ()

@end

@implementation SchoolNewsViewController

@synthesize rssList;
@synthesize currentItem;
@synthesize currentContents;
@synthesize newsTableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.navigationItem.title = @"校内通知";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];  //设置statusbar为白底黑字
    
    self.rssList = [[NSMutableArray alloc] init];
    
    NSXMLParser *firstParser = [[NSXMLParser alloc] initWithContentsOfURL:[NSURL URLWithString:@"http://jsglxt.suda.edu.cn/feed.action?type=1"]];
    firstParser.delegate = self;
    [firstParser parse];
    
    newsTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, SCREEN_HEIGHT) style:UITableViewStylePlain];
    [newsTableView setDelegate:self];
    [newsTableView setDataSource:self];
    newsTableView.allowsSelection = YES;
    newsTableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    [self.view addSubview:newsTableView];
}

#pragma mark - NSXMLParser delegate Methods

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
	if([elementName isEqualToString:@"item"])
	{
		currentItem = [[NSMutableDictionary alloc] init];
	}
	else if (currentItem != NULL)
	{
		currentContents = [[NSMutableString alloc] init];
	}
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
	if([elementName isEqualToString:@"item"])
	{
		[rssList addObject:currentItem];
		
	}
	else if (currentContents && currentItem)
	{
		[currentItem setObject:currentContents forKey:elementName];
		currentContents = nil;
    }
}

- (void)parser:(NSXMLParser *)parser foundCDATA:(NSData *)CDATABlock
{
	if(currentItem && currentContents)
	{
		currentContents = [[NSMutableString alloc] initWithData:CDATABlock encoding:NSUTF8StringEncoding];
	}
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
	if(currentItem && currentContents)
	{
		[currentContents appendString:string];
	}
}

#pragma mark - Tableview data source
#pragma mark - 返回section的个数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

#pragma mark - 返回section中row的数目
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [rssList count];
}

#pragma mark - cell的属性
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"SchoolNewsCell";
    SchoolNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[SchoolNewsCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellIdentifier];
    }
	if (indexPath.row % 2 == 0) {
        cell.backgroundColor = [UIColor colorWithRed:210/255.0 green:210/255.0 blue:210/255.0 alpha:1];
    }
    else
    {
        cell.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1];
    }
    cell.title.text = [[rssList objectAtIndex:indexPath.row] objectForKey:@"title"];
    cell.creator.text = [NSString stringWithFormat:@"发布部门:%@",[[rssList objectAtIndex:indexPath.row] objectForKey:@"dc:creator"]];
    cell.date.text = [self dealWithDate:[[rssList objectAtIndex:indexPath.row
                                                     ]objectForKey:@"pubDate"]];
    NSLog(@"%@",[rssList objectAtIndex:indexPath.row]);
    return cell;
}

#pragma mark - cell的点击属性
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SchoolNewsDetailViewController *detailViewController = [[SchoolNewsDetailViewController alloc] initWithNibName:nil bundle:nil];
    detailViewController.detailURL = [NSString stringWithFormat:@"http://jsglxt.suda.edu.cn/noticeDetail.action?detailUrl=%@",[[rssList objectAtIndex:indexPath.row]objectForKey:@"link"]];
    [self.navigationController pushViewController:detailViewController animated:YES];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(NSString *)dealWithDate:(NSString *)pubDate
{
    int count = 0;
    NSString *day;
    NSString *month;
    NSString *year;
    NSString *time;
    NSString *date;
    
    if ([pubDate rangeOfString:@", "].location != NSNotFound) {
        pubDate = [pubDate stringByReplacingCharactersInRange:NSMakeRange(0, [pubDate rangeOfString:@", "].location + [pubDate rangeOfString:@", "].length) withString:@""];
        for (int i=0; i<[pubDate length]; i++) {
            char space = [pubDate characterAtIndex:i];
            if (space == ' ') {
                count++;
                if(count == 1) {
                    day = [pubDate substringWithRange:NSMakeRange(0, i)];
                }
                        
                if(count == 2) {
                    month = [pubDate substringWithRange:NSMakeRange(i-3, i-3)];
                    if ([month isEqualToString:@"Jan"]) month = @"1月";
                    if ([month isEqualToString:@"Feb"]) month = @"2月";
                    if ([month isEqualToString:@"Mar"]) month = @"3月";
                    if ([month isEqualToString:@"Apr"]) month = @"4月";
                    if ([month isEqualToString:@"May"]) month = @"5月";
                    if ([month isEqualToString:@"Jun"]) month = @"6月";
                    if ([month isEqualToString:@"Jul"]) month = @"7月";
                    if ([month isEqualToString:@"Aug"]) month = @"8月";
                    if ([month isEqualToString:@"Sep"]) month = @"9月";
                    if ([month isEqualToString:@"Oct"]) month = @"10月";
                    if ([month isEqualToString:@"Nov"]) month = @"11月";
                    if ([month isEqualToString:@"Dec"]) month = @"12月";
                }
                        
                if(count == 3)
                {
                    year = [pubDate substringWithRange:NSMakeRange(i-4, i-7)];
                }
                        
                if(count == 4)
                {
                    time = [pubDate substringWithRange:NSMakeRange(i-8, i-12)];
                }

            }
        }
        date = [[[[[year stringByAppendingString:@"年"] stringByAppendingString:month] stringByAppendingString:day] stringByAppendingString:@"日 "] stringByAppendingString:time];
        return date;
}
    return nil;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
