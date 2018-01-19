//
//  WBTabBar.h
//  ProjectFramework
//
//  Created by RC025 on 17/3/22.
//  Copyright © 2017年 WB. All rights reserved.
//

#import <UIKit/UIKit.h>


static CGFloat const tabBarCount = 5;

@interface WBTabBar : UITabBar
/**
 *  中间凸起按钮
 */
@property (nonatomic, strong) UIButton *centerBtn;

@end
