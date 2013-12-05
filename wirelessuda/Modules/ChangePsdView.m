//
//  ChangePsdView.m
//  wirelessuda
//
//  Created by Mac on 13-11-27.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import "ChangePsdView.h"
#import "MBProgressHUD.h"

@implementation ChangePsdView
@synthesize beformPsdLabel,beformPsdText;
@synthesize changedPsdLabel,changedPsdText;
@synthesize conformPsdLabel,conformPsdText;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        beformPsdLabel = [[UILabel alloc]init];
        beformPsdLabel.frame = CGRectMake(20, 20, 80, 30);
        beformPsdLabel.text = @"原密码:";
        [self addSubview:beformPsdLabel];
        
        beformPsdText = [[UITextField alloc]init];
        beformPsdText.frame = CGRectMake(100, 20, 180 ,30);
        beformPsdText.borderStyle = UITextBorderStyleRoundedRect;
        beformPsdText.placeholder = @"请输入原密码";
        beformPsdText.contentHorizontalAlignment = UIControlContentVerticalAlignmentCenter;
        beformPsdText.secureTextEntry = YES;
        [self addSubview:beformPsdText];
        
#pragma mark - 新密码
        changedPsdLabel = [[UILabel alloc]init];
        changedPsdLabel.frame = CGRectMake(20, 60, 80, 30);
        changedPsdLabel.text = @"新密码:";
        [self addSubview:changedPsdLabel];
        changedPsdText = [[UITextField alloc]init];
        changedPsdText.frame = CGRectMake(100, 60, 180, 30);
        changedPsdText.borderStyle = UITextBorderStyleRoundedRect;
        changedPsdText.placeholder = @"请输入新密码";
        changedPsdText.contentHorizontalAlignment = UIControlContentVerticalAlignmentCenter;
        changedPsdText.secureTextEntry = YES;
        [self addSubview:changedPsdText];
        
#pragma mark - 确认密码
        conformPsdLabel = [[UILabel alloc]init];
        conformPsdLabel.frame = CGRectMake(20, 100, 80, 30);
        conformPsdLabel.text = @"确认密码:";
        [self addSubview:conformPsdLabel];
        conformPsdText = [[UITextField alloc]init];
        conformPsdText.frame = CGRectMake(100, 100, 180, 30);
        conformPsdText.borderStyle = UITextBorderStyleRoundedRect;
        conformPsdText.placeholder = @"请确认新密码";
        conformPsdText.contentHorizontalAlignment = UIControlContentVerticalAlignmentCenter;
        conformPsdText.secureTextEntry = YES;
        [self addSubview:conformPsdText];
        
#pragma mark - 确认按钮
        UIButton *ok=[UIButton buttonWithType:UIButtonTypeCustom];
        ok.frame=CGRectMake(140, 140, 80, 40);
        [ok setTitle:@"确定修改" forState:UIControlStateNormal];
        [ok.titleLabel setFont:[UIFont systemFontOfSize:15]];
        [ok setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [ok setBackgroundColor:[UIColor lightGrayColor]];
        [ok addTarget:self action:@selector(onConfirmClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:ok];
        
#pragma mark - 触摸键盘消失
        UITapGestureRecognizer* tapGesture=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        tapGesture.delegate=(id<UIGestureRecognizerDelegate>)self;
        [self addGestureRecognizer:tapGesture];
    }
    return self;
}
-(void)onConfirmClick:(id)sender
{
    
}
#pragma mark - 触摸键盘消失
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if ([touch.view isKindOfClass:[UIButton class]]) {
        return NO;
    }
    return YES;
}

-(void)tap:(UIGestureRecognizer*)gesture
{
    if (self.frame.origin.y==-85) {
        [UIView animateWithDuration:0.3 animations:^{
            self.frame=CGRectOffset(self.frame, 0, 85);
        }];
    }
    [self endEditing:YES];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
