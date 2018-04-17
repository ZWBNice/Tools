//
//  WBLoginViewController.m
//  ProjectFramework
//
//  Created by RC025 on 17/3/24.
//  Copyright © 2017年 WB. All rights reserved.
//

#import "WBLoginViewController.h"

@interface WBLoginViewController ()

@end

@implementation WBLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登录";
    
//    UIButton *logInBtn = [UIButton WB_fatoryButtonWithFrame:CGRectMake(100, 100, 100, 100) WithTitle:@"登录" WithTitleColor:0xfff Withfont:15 Withimage:nil WithselImage:nil toSuperView:self.view WithClick:^(id sender) {
//        id obj = @{@"isLogin":@1};
//        [[NSNotificationCenter defaultCenter] postNotificationName:LoginStatus object:obj];
//        [UserInfo sharedInstance].userType = KUserTypeLogin;
//        NSError *error = nil;
//    }];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}


@end
