//
//  BaseViewController.m
//  MyProject
//
//  Created by 张文博 on 16/1/7.
//  Copyright © 2016年 张文博. All rights reserved.
//

#import "BaseViewController.h"
//#import "WB_UIButton.h"
//#import "UIView+Shadow.h"
//#import "NJKWebViewProgressView.h"
//#import "UIImage+NTESColor.h"

@interface BaseViewController ()
@end

@implementation BaseViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil

{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // push 的时候隐藏的是系统的tabbar视图

//        self.title = NSStringFromClass([self class]);

    }

    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];

#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_7_0
    // iOS7顶部屏幕适配
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)])
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
#endif

    // 默认背景色
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;

}





- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

}


- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)showLeftBtnWithImageName:(NSString *)imageName withTitle:(NSString *)title{
    
    UIButton * leftBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    leftBtn.frame = CGRectMake(0, 7, 25, 25);
    leftBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);

    [leftBtn setTitle:title forState:UIControlStateNormal];
    [leftBtn setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(LeftonTap) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = leftItem;
}

- (void)LeftonTap{
    
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
//    [SVProgressHUD dismiss];
}


- (void)showRightBtnWithImageName:(NSString *)imageName withTitle:(NSString *)title{
    
    UIButton * rightBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    rightBtn.frame = CGRectMake(0, 7, 25, 25);
    rightBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [rightBtn setTitle:title forState:UIControlStateNormal];
    [rightBtn setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(RightonTap) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
    
}

- (void)RightonTap{
    NSLog(@"点击了导航栏右侧按钮");
    
}


- (WBBaseEmptyView *)emptyView{
    if (!_emptyView) {
        _emptyView = [WBBaseEmptyView noDataView];
    }
    return _emptyView;
}

- (WBBaseEmptyView *)noNetWorkView{
    if (!_noNetWorkView) {
        _noNetWorkView = [WBBaseEmptyView noDataViewWithTarget:self action:@selector(WBEmptyClick:)];
    }
    return _noNetWorkView;
}

- (void)WBEmptyClick:(UIButton *)btn{
    
}



@end
