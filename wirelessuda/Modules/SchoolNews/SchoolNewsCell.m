//
//  SchoolNewsCell.m
//  wirelessuda
//
//  Created by 叶帆 on 13-11-26.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import "SchoolNewsCell.h"

@implementation SchoolNewsCell

@synthesize title;
@synthesize creator;
@synthesize date;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        title = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 320, 20)];
        title.font = [UIFont fontWithName:@"Helvetica" size:18];
        title.backgroundColor = [UIColor clearColor];
        
        creator = [[UILabel alloc]initWithFrame:CGRectMake(10, 40, 300, 15)];
        creator.font = [UIFont fontWithName:@"Helvetica" size:14];
        creator.backgroundColor = [UIColor clearColor];
        creator.textAlignment = NSTextAlignmentRight;
        
        date = [[UILabel alloc]initWithFrame:CGRectMake(10, 60, 300, 15)];
        date.font = [UIFont fontWithName:@"Helvetica" size:14];
        date.backgroundColor = [UIColor clearColor];
        date.textAlignment = NSTextAlignmentRight;
        
        [self addSubview:title];
        [self addSubview:creator];
        [self addSubview:date];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
