//
//  WBAppDelegate+WBYIDengFaceLog.m
//  ProjectFramework
//
//  Created by RC025 on 17/3/24.
//  Copyright © 2017年 WB. All rights reserved.
//

#import "WBAppDelegate+WBYIDengFaceLog.h"

@implementation WBAppDelegate (WBYIDengFaceLog)

- (void)registerYiDendAppWithAppID:(NSString *)appId withAppSecret:(NSString *)secrectId{
    
    //Step_1:  使用从一登官网创建的App应用获取到的AppID和AppSecret,注册一登SDK服务

    [[SuperID sharedInstance] registerAppWithAppID:appId withAppSecret:secrectId];
    //Step_2:  开启或关闭调试模式,YES开启调试模式,App在运行时,控制台会输出相应信息
    [SuperID setDebugMode:YES];
    
    //Step_3:  设置一登SDK的展示的UI语言模式，默认为自动模式
    [SuperID setLanguageMode:SIDAutoMode];

}

@end
