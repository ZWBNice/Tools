//
//  WBAppDelegate.m
//  ProjectFramework
//
//  Created by RC025 on 17/3/22.
//  Copyright © 2017年 WB. All rights reserved.
//

#import "WBAppDelegate.h"
#import "WBCustomTabBarController.h"
#import "WBLoginViewController.h"
#import "UserInfo.h"
#import "WBAppDelegate+WBSetRootVC.h"
#import "WBAppDelegate+WBYIDengFaceLog.h"
@implementation WBAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 初始化window
    [self initialWindow];
    // 初始化登录SDK
    [self registerYiDendAppWithAppID:YIDENGappId withAppSecret:YIDENGsecrectId];
    return YES;
}



//- (void)dismissLaunch:(UIWindow *)window {
//
//    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
//    animation.duration = 0.5;
//    animation.toValue  = @(2.5);
//    [window.layer addAnimation:animation forKey:nil];
//
//    [UIView animateWithDuration:0.5 animations:^{
//        window.alpha = 0;
//    } completion:^(BOOL finished) {
//        [window setHidden:YES];
//
//        [self.window makeKeyAndVisible];
//    }];
//}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}



@end
