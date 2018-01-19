//
//  WBCustomTabBarController.m
//  ProjectFramework
//
//  Created by RC025 on 17/3/22.
//  Copyright © 2017年 WB. All rights reserved.
//

#import "WBCustomTabBarController.h"
#import "WBTabBar.h"
#import "WBHomeViewController.h"
#import "WBSecondViewController.h"
#import "WBCenterViewController.h"
#import "WBFourthViewController.h"
#import "WBMineViewController.h"
#import "BasenavgationController.h"
#import "WBFourViewController.h"


@interface WBCustomTabBarController ()

@end

@implementation WBCustomTabBarController

#pragma mark -- life
- (void)viewDidLoad {
    [super viewDidLoad];
    WBHomeViewController *hvc = [[WBHomeViewController alloc] init];
    [self addChildController:hvc title:@"首页" imageName:@"home_normal" selectedImageName:@"home_highlight" navVc:[BasenavgationController class]];
    
    WBSecondViewController *fvc = [[WBSecondViewController alloc] init];
    [self addChildController:fvc title:@"活动" imageName:@"fishpond_normal" selectedImageName:@"fishpond_highlight" navVc:[BasenavgationController class]];
    
//    WBCenterViewController *MoreVc = [[WBCenterViewController alloc] init];
//    [self addChildController:MoreVc title:@"更多" imageName:@"message_normal" selectedImageName:@"message_highlight" navVc:[UINavigationController class]];
    
    WBFourViewController *svc = [[WBFourViewController alloc] init];
    [self addChildController:svc title:@"设置" imageName:@"message_normal" selectedImageName:@"message_highlight" navVc:[BasenavgationController class]];
    
    
    WBMineViewController *mineVC = [[WBMineViewController alloc] init];
    [self addChildController:mineVC title:@"我的" imageName:@"account_normal" selectedImageName:@"tab5-fileshow" navVc:[BasenavgationController class]];

    
    [[UITabBar appearance] setBackgroundImage:[self imageWithColor:[UIColor whiteColor]]];
    //  设置tabbar
    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
    // 设置自定义的tabbar
    [self setUpCustomTabBar];
    
//    [self.tabBar setBackgroundImage:[UIImage new]];
//    [self.tabBar setShadowImage:[UIImage new]];

    [self dropShadowWithOffset:CGSizeMake(0, -0.5) radius:1 color:[UIColor grayColor] opacity:0.3];

}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)setUpCustomTabBar{
    WBTabBar *tabbar = [[WBTabBar alloc] init];
    [self setValue:tabbar forKeyPath:@"tabBar"];
    [tabbar.centerBtn addTarget:self action:@selector(centerClick:) forControlEvents:UIControlEventTouchUpInside];
}


- (void)centerClick:(UIButton *)btn{
//       WBCenterViewController *centerVC = [[WBCenterViewController alloc] init];
//
//    [self presentViewController:centerVC animated:YES completion:nil];

    NSLog(@"点击了中间");
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"点击了中间按钮" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}


- (void)addChildController:(UIViewController*)childController title:(NSString*)title imageName:(NSString*)imageName selectedImageName:(NSString*)selectedImageName navVc:(Class)navVc
{
    
    childController.title = title;
    childController.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    // 设置一下选中tabbar文字颜色
    
    [childController.tabBarItem setTitleTextAttributes:@{ NSForegroundColorAttributeName : [UIColor darkGrayColor] }forState:UIControlStateSelected];
    
    UINavigationController* nav = [[navVc alloc] initWithRootViewController:childController];
    
    [self addChildViewController:nav];
}


- (UIImage *)imageWithColor:(UIColor *)color{
    // 一个像素
    CGRect rect = CGRectMake(0, 0, 1, 1);
    // 开启上下文
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [color setFill];
    UIRectFill(rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}


- (void)dropShadowWithOffset:(CGSize)offset
                      radius:(CGFloat)radius
                       color:(UIColor *)color
                     opacity:(CGFloat)opacity {
    
    // Creating shadow path for better performance
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, self.tabBar.bounds);
    self.tabBar.layer.shadowPath = path;
    CGPathCloseSubpath(path);
    CGPathRelease(path);
    
    self.tabBar.layer.shadowColor = color.CGColor;
    self.tabBar.layer.shadowOffset = offset;
    self.tabBar.layer.shadowRadius = radius;
    self.tabBar.layer.shadowOpacity = opacity;
    
    // Default clipsToBounds is YES, will clip off the shadow, so we disable it.
    self.tabBar.clipsToBounds = NO;
}




@end
