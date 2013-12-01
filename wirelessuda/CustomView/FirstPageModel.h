//
//  FirstPageModel.h
//  wirelessuda
//
//  Created by Mac on 13-11-30.
//  Copyright (c) 2013年 苏州大学信息化建设与管理中心. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"

@protocol FirstPageDelegtate;

@interface FirstPageModel : NSObject<ASIHTTPRequestDelegate>

@property (strong, nonatomic) id<FirstPageDelegtate> delegate;

+ (FirstPageModel *)shareInstance;
- (void) startFirstPageRequest;

@end
@protocol FirstPageDelegtate <NSObject>

@optional
-(void)getFirstPageNews:(NSMutableArray *)newsData;

@end