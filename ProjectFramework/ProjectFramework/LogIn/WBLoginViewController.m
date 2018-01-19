//
//  WBLoginViewController.m
//  ProjectFramework
//
//  Created by RC025 on 17/3/24.
//  Copyright © 2017年 WB. All rights reserved.
//

#import "WBLoginViewController.h"
#import <SuperID.h>
#import "WBThreepartyloginView.h"

@interface WBLoginViewController ()<SuperIDDelegate>

@end

@implementation WBLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登录";
    NSArray *nib = [[NSBundle mainBundle]loadNibNamed:@"WBThreepartyloginView"owner:self options:nil];
    
    UIView *tmpCustomView = [nib objectAtIndex:0];

    [self.view addSubview:tmpCustomView];
    [tmpCustomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.view.mas_bottom).offset(20);
        make.left.mas_equalTo(self.view.mas_left).offset(0);
        make.right.mas_equalTo(self.view.mas_right).offset(0);
        make.height.mas_equalTo(@180);
        
    }];
    
    UIButton *logInBtn = [UIButton WB_fatoryButtonWithFrame:CGRectMake(100, 100, 100, 100) WithTitle:@"登录" WithTitleColor:0xfff Withfont:15 Withimage:nil WithselImage:nil toSuperView:self.view WithClick:^(id sender) {
        id obj = @{@"isLogin":@1};
        [[NSNotificationCenter defaultCenter] postNotificationName:LoginStatus object:obj];
        [UserInfo sharedInstance].userType = KUserTypeLogin;

        NSError *error = nil;
        
        id SIDLoginViewController = [[SuperID sharedInstance] obtainLoginViewControllerWithError:&error];
        
        if (SIDLoginViewController) {
            [self presentViewController:SIDLoginViewController animated:YES completion:nil];
            [[NSNotificationCenter defaultCenter] postNotificationName:LoginStatus object:@{@"isLogin":@1}];

        }else{
            NSLog(@"Error =%ld,%@",(long)[error code],[error localizedDescription]);
        }

    }];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [SuperID sharedInstance].delegate = self;
}

#pragma mark -- 一登delegate
- (void)superID:(SuperID *)sender userDidFinishLoginWithUserInfo:(NSDictionary *)userInfo withOpenId:(NSString *)openId error:(NSError *)error{
    if (!error) {
        //授权登录成功
        NSLog(@"userInfo:%@", userInfo);
        NSLog(@"openId = %@", openId);
    }else{
        //授权登录失败
        NSLog(@"Login Fail Error =%ld,%@",(long)[error code],[error localizedDescription]);

    }
}


@end
