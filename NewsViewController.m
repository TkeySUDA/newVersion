//
//  NewsViewController.m
//  wirelessuda
//
//  Created by 叶帆 on 13-11-27.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import "NewsViewController.h"
#import "NewsCell.h"
#import "NewsDetailViewController.h"

@interface NewsViewController ()

@end

@implementation NewsViewController

#pragma mark - 按钮基本常量
const NSUInteger btnNumber = 4;
const NSUInteger screenWidth = 320;
const NSUInteger btnWidth = 100;
const NSUInteger btnHeight = 37;
const NSUInteger btnInterval = 100;
const NSUInteger contentHeightOffset = 8;

@synthesize scrollView;
@synthesize btnStretchImg;
@synthesize rssList;
@synthesize currentContents;
@synthesize currentItem;
@synthesize newsTableView;
@synthesize nameArray;
@synthesize prevButtonIndex;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.view.backgroundColor = [UIColor whiteColor];
        self.navigationItem.title = @"苏大新闻";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];  //设置statusbar为白底黑字
    
#pragma mark - 滑动按钮
    scrollView = [[ButtonBarScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 37 + 8)];
	[scrollView setContentSize:CGSizeMake(SCREEN_WIDTH + 4 / 2 * 100, 37)];
	scrollView.backgroundColor = [UIColor grayColor];
    scrollView.delegate = self;
    [self addTitleButtons];
	[self.view addSubview:scrollView];
	
#pragma mark - 标题按钮
	//UIImage *btnImg = [UIImage imageNamed:@"select.png"];
	//btnStretchImg = [btnImg stretchableImageWithLeftCapWidth:14 topCapHeight:0];
	
}

#pragma mark - button按钮
- (void)addTitleButtons
{
#pragma mark - 按钮标题名称
    nameArray = [NSArray arrayWithObjects:@"学校发文", @"苏大要闻", @"学生报告", @"E海报要闻", nil];
    
	for (int i = 0; i < btnNumber; i++)
    {
		UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
		btn.frame = CGRectMake(btnInterval * i, contentHeightOffset/2, btnWidth, btnHeight);
		[btn setTitle:[NSString stringWithFormat:@"%@",[nameArray objectAtIndex:i]] forState:UIControlStateNormal];
		[btn addTarget:self action:@selector(buttonSelected:) forControlEvents:UIControlEventTouchUpInside];
		btn.tag = i;
		[self.scrollView addSubview:btn];
	}
    
#pragma mark - 默认选择第一个按钮
    [self buttonSelected:0];
    [self selectButtonAtIndex:0];
}

- (void)selectButtonAtIndex:(NSUInteger)index
{
	UIButton *selectedBtn = [[self.scrollView subviews] objectAtIndex:index];
	[selectedBtn setBackgroundImage:btnStretchImg forState:UIControlStateNormal];
	[selectedBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	prevButtonIndex = index;
}

- (void)deselectButtonAtIndex:(NSUInteger)prevIndex
{
	UIButton *deselectedBtn = [[self.scrollView subviews] objectAtIndex:prevIndex];
	[deselectedBtn setBackgroundImage:nil forState:UIControlStateNormal];
	[deselectedBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
}

- (void)buttonSelected:(id)sender
{
	UIButton *selectedBtn = (UIButton *)sender;
	NSUInteger index = selectedBtn.tag;
	
	if (index != prevButtonIndex) {
		[self deselectButtonAtIndex:prevButtonIndex];
		[self selectButtonAtIndex:index];
		[self.scrollView scrollRectToVisible:CGRectMake(btnInterval * (index - 1)-110, 20, screenWidth, btnHeight) animated:YES];
	}
    
#pragma mark - 初始化tablView
    self.newsTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 40, 320, 480) style:UITableViewStylePlain];
    [newsTableView setDelegate:self];
    [newsTableView setDataSource:self];
    newsTableView.allowsSelection = YES;
    [self.view addSubview:newsTableView];
    
#pragma mark - 初始化每一个cell
    self.rssList = [[NSMutableArray alloc] init];
    
    NSString *url = [NSString stringWithFormat:@"http://jsglxt.suda.edu.cn/feed.action?type=%d",index+2];
    NSXMLParser *firstParser = [[NSXMLParser alloc] initWithContentsOfURL:[NSURL URLWithString:url
]];
    firstParser.delegate = self;
    [firstParser parse];
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

#pragma mark - 返回section中row的数目
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [rssList count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

#pragma mark - cell的属性
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"NewsCell";
    NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[NewsCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellIdentifier];
    }
	
    cell.title.text = [[rssList objectAtIndex:indexPath.row] objectForKey:@"title"];
    cell.creator.text = [NSString stringWithFormat:@"发布部门:%@",[[rssList objectAtIndex:indexPath.row] objectForKey:@"dc:creator"]];
    cell.date.text = [self dealWithDate:[[rssList objectAtIndex:indexPath.row
                                          ]objectForKey:@"pubDate"]];
    NSLog(@"%@",[rssList objectAtIndex:indexPath.row]);
    return cell;
    
    return cell;
}

#pragma mark - cell的点击属性
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewsDetailViewController *detailViewController = [[NewsDetailViewController alloc] initWithNibName:nil bundle:nil];
    detailViewController.detailURL = [NSString stringWithFormat:@"http://jsglxt.suda.edu.cn/feedDetail.action?detailUrl=%@",[[rssList objectAtIndex:indexPath.row]objectForKey:@"link"]];
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
