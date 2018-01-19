//
//  BaseViewController.h
//  MyProject
//
//  Created by 张文博 on 16/1/7.
//  Copyright © 2016年 张文博. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

- (void)showLeftBtnWithImageName:(NSString *)imageName withTitle:(NSString *)title;

- (void)LeftonTap;

- (void)showRightBtnWithImageName:(NSString *)imageName withTitle:(NSString *)title;

- (void)RightonTap;

@property (nonatomic, strong) WBBaseEmptyView *emptyView;
@property (nonatomic, strong) WBBaseEmptyView *noNetWorkView;


@end
