//
//  UIScrollView+Empty.m
//  ProjectFramework
//
//  Created by zwb on 2018/1/16.
//  Copyright © 2018年 WB. All rights reserved.
//

#import "UIScrollView+Empty.h"
#import <objc/runtime.h>

static const char associatedEmptyViewKey;

@implementation UIScrollView (Empty)


- (WBBaseEmptyView *)emptyView{
    
    return objc_getAssociatedObject(self, &associatedEmptyViewKey);
}

- (void)setEmptyView:(WBBaseEmptyView *)emptyView{
    
    if (emptyView != self.emptyView) {
        objc_setAssociatedObject(self, &associatedEmptyViewKey, emptyView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        for (UIView *view in self.subviews) {
            if ([view isKindOfClass:[WBBaseEmptyView class]]) {
                [view removeFromSuperview];
            }
        }
        [self addSubview:self.emptyView];
    }
}

- (NSInteger)getTotalCount{
    NSInteger totalCount = 0;
    if ([self isKindOfClass:[UITableView class]]) {
        UITableView *tableView = (UITableView *)self;
        for (NSInteger section = 0; section < tableView.numberOfSections; section++) {
           totalCount += [tableView numberOfRowsInSection:section];
            if (totalCount > 0) {
                break;
            }
        }
    }else if ([self isKindOfClass:[UICollectionView class]]){
        UICollectionView *collectionView = (UICollectionView *)self;
        for (NSInteger section = 0; section < collectionView.numberOfSections; section++) {
            totalCount += [collectionView numberOfItemsInSection:section];
            if (totalCount > 0) {
                break;
            }
        }
    }
    return totalCount;
}

- (void)getDataAndSet{
    if ([self getTotalCount] == 0) {
        [self show];
    }else{
        [self hide];
    }
}

- (void)show{
    [self bringSubviewToFront:self.emptyView];
    self.emptyView.hidden = false;
    self.mj_header.hidden = true;
    self.mj_footer.hidden = true;
}

- (void)hide{
    [self insertSubview:self.emptyView atIndex:0];
    self.emptyView.hidden = true;
    self.mj_header.hidden = false;
    self.mj_footer.hidden = false;
}

@end
