//
//  WBAppDelegate+WBYIDengFaceLog.h
//  ProjectFramework
//
//  Created by RC025 on 17/3/24.
//  Copyright © 2017年 WB. All rights reserved.
//

#import "WBAppDelegate.h"
#import <SuperID.h>

static NSString * const YIDENGappId = @"5700d5864bed786df6684670";
static NSString *const YIDENGsecrectId = @"7b431e54c5b217f23a02d2c8";

@interface WBAppDelegate (WBYIDengFaceLog)

- (void)registerYiDendAppWithAppID:(NSString *)appId withAppSecret:(NSString *)secrectId;

@end
