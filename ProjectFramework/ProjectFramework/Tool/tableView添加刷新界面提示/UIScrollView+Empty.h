//
//  UIScrollView+Empty.h
//  ProjectFramework
//
//  Created by zwb on 2018/1/16.
//  Copyright © 2018年 WB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WBBaseEmptyView.h"

@interface UIScrollView (Empty)
@property (nonatomic, strong) WBBaseEmptyView *emptyView;
// 获取当前的数据个数
- (void)getDataAndSet;
@end
