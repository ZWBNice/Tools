//
//  WBFourViewController.m
//  ProjectFramework
//
//  Created by zwb on 2018/1/15.
//  Copyright © 2018年 WB. All rights reserved.
//

#import "WBFourViewController.h"
#import "WBFourTableViewCell.h"
#import "UIScrollView+Empty.h"
#import "WBBaseEmptyView.h"

@interface WBFourViewController ()

@end

@implementation WBFourViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTableViewFrame:self.view.frame];
    self.showRefreshHeader = true;
    self.showRefreshFooter = true;
    self.tableView.emptyView = self.noNetWorkView;
    [self loadDataWithPage:self.page withIsHeader:true];
    NSLog(@"%@",[[NSBundle mainBundle] bundlePath]);

}

- (void)WBEmptyClick:(UIButton *)btn{
    
}

// MARK: - UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WBFourTableViewCell *cell = [WBFourTableViewCell configCellWithTableView:tableView];
    cell.titleL.text = self.dataSource[indexPath.row];
    cell.contentL.text = self.dataSource[indexPath.row];

    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

// MARK: - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (void)loadDataWithPage:(int)page withIsHeader:(BOOL)isHeader{
    if (isHeader) {
        [self.dataSource removeAllObjects];
    }
    [self.dataSource addObjectsFromArray:@[]];
    [self tableViewDidFinishTriggerHeader:isHeader reload:true];
}

- (void)tableViewDidTriggerFooterRefresh{
    self.page += 1;
    [self loadDataWithPage:self.page withIsHeader:false];
}

- (void)tableViewDidTriggerHeaderRefresh{
    self.page = 0;
    [self loadDataWithPage:self.page withIsHeader:true];
}




@end
