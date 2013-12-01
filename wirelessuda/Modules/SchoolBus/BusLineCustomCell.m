//
//  BusLineCustomCell.m
//  wirelessuda
//
//  Created by Tkey on 13-12-1.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import "BusLineCustomCell.h"

@implementation BusLineCustomCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(79, 5, 176, 21)];
        self.nameLabel.font = [UIFont fontWithName:@"Heiti SC" size:17];
        self.nameLabel.numberOfLines = 0;
        
        
        self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(13, 20, 50, 41)];
        self.timeLabel.font = [UIFont fontWithName:@"Heiti SC" size:15];
        self.timeLabel.numberOfLines = 0;
        self.timeLabel.textAlignment = UITextAlignmentLeft;
        
        self.descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(79, 31, 206, 21)];
        self.descriptionLabel.font = [UIFont fontWithName:@"Heiti SC" size:15];
        self.descriptionLabel.numberOfLines = 0;
        
        self.stationLabel = [[UILabel alloc] initWithFrame:CGRectMake(79, 56, 206, 21)];
        self.stationLabel.font = [UIFont fontWithName:@"Heiti SC" size:12];
        self.stationLabel.numberOfLines = 0;
        
        [self addSubview:self.nameLabel];
        [self addSubview:self.stationLabel];
        [self addSubview:self.timeLabel];
        [self addSubview:self.descriptionLabel];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setFrame:(CGRect)frame
{
    frame.origin.x += 10;
    frame.size.width -= 20;
    [super setFrame:frame];
}

@end
