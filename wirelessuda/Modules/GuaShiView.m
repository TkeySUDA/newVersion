//
//  GuaShiView.m
//  wirelessuda
//
//  Created by Mac on 13-11-27.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import "GuaShiView.h"
#import "MBProgressHUD.h"

@implementation GuaShiView
@synthesize usernameLabel,usernameField;
@synthesize passwordLabel,passwordField;
@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        usernameLabel=[[UILabel alloc] initWithFrame:CGRectMake(30, 20, 60, 35)];
        usernameLabel.text=@"账号:";
        usernameField=[[UILabel alloc] initWithFrame:CGRectMake(90, 20, 150, 35)];
        usernameField.text=@"1127403119";
        usernameField.textColor=[UIColor  redColor];
        usernameField.backgroundColor=[UIColor whiteColor];
        
        passwordLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 60, 60, 35)];
        passwordLabel.text = @"密码:";
        passwordField=[[UITextField alloc] initWithFrame:CGRectMake(90, 60, 150, 35)];
        passwordField.borderStyle=UITextBorderStyleLine;
        passwordField.textColor=[UIColor redColor];
        passwordField.placeholder=@"请输入苏大通密码";
        passwordField.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
        passwordField.secureTextEntry = YES;
        passwordField.backgroundColor=[UIColor whiteColor];
        
        UIButton *ok=[UIButton buttonWithType:UIButtonTypeCustom];
        ok.frame=CGRectMake(100, 120, 80, 40);
        [ok setTitle:@"确定挂失" forState:UIControlStateNormal];
        [ok.titleLabel setFont:[UIFont systemFontOfSize:15]];
        [ok setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [ok setBackgroundColor:[UIColor lightGrayColor]];
        [ok addTarget:self action:@selector(okClicked:) forControlEvents:UIControlEventTouchUpInside];
#pragma mark - 触摸键盘消失
        UITapGestureRecognizer* tapGesture=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        tapGesture.delegate=(id<UIGestureRecognizerDelegate>)self;
        [self addGestureRecognizer:tapGesture];
        
        [self addSubview:usernameLabel];
        [self addSubview:usernameField];
        [self addSubview:passwordLabel];
        [self addSubview:passwordField];
        [self addSubview:ok];
    }
    return self;
}
-(void)okClicked:(id)sender
{
    if ([passwordField.text isEqualToString:@""]) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.labelText = @"     请输入密码！     ";
        hud.margin = 10.f;
        hud.yOffset = -60.f;
        hud.removeFromSuperViewOnHide = YES;
        [hud hide:YES afterDelay:2];
        [usernameField becomeFirstResponder];
    }else{
        CardModel *cardModel=[CardModel shareInstance];
        cardModel.delegate=self;
        NSString *account=[[NSUserDefaults standardUserDefaults] objectForKey:@"account"];
        NSLog(@"account:%@",account);
        [cardModel startRequest:@"GuaShi" withUrl:@"http://weixin.suda.edu.cn/servlet/AccountDoLoss" withParam1:account withParam2:passwordField.text withParam3:nil withParam4:nil];
    }
}
-(void)getGuaShiResult:(NSString *)result
{
    if ([result isEqualToString:@"操作成功"]) {
        //拿动态数据？？？
        [[NSUserDefaults standardUserDefaults]setObject:@"001001000100004" forKey:@"flag"];
        [delegate getSuccedStatus:@"0"];
    }else{
        NSLog(@"挂失失败");
    }
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
