//
//  WBAppDelegate+WBSetRootVC.m
//  ProjectFramework
//
//  Created by zwb on 2018/1/12.
//  Copyright © 2018年 WB. All rights reserved.
//

#import "WBAppDelegate+WBSetRootVC.h"
#import "WBLoginViewController.h"
#import "WBCustomTabBarController.h"
#import "UserInfo.h"
@implementation WBAppDelegate (WBSetRootVC)


#pragma mark Window RootViewController
- (void)initialWindow {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self setRootVC];
    [self.window makeKeyAndVisible];
}


- (void)setRootVC{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loginStatusChange:) name:LoginStatus object:nil];
    NSMutableDictionary *obj = [NSMutableDictionary dictionary];
    
    if ([UserInfo sharedInstance].userType == KUserTypeLogin) {
        obj[@"isLogin"] = @1;
    }else{
        obj[@"isLogin"] = @0;
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:LoginStatus object:obj];
}

- (void)loginStatusChange:(NSNotification*)notification{
    id obj = notification.object;
    if ([obj[@"isLogin"]  isEqual: @1]) {
        [self.window setRootViewController:[WBCustomTabBarController new]];
    }else{
        [self.window setRootViewController:[WBLoginViewController new]];
    }
}

@end
