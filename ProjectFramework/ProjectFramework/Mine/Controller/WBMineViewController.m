//
//  WBMineViewController.m
//  ProjectFramework
//
//  Created by RC025 on 17/3/22.
//  Copyright © 2017年 WB. All rights reserved.
//

#import "WBMineViewController.h"
#import "WBMineTableViewCell.h"

@interface WBMineViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *table;
@end

@implementation WBMineViewController

// MARK: - getter && setter

- (UITableView *)table
{
    if (!_table) {
        _table = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _table.delegate = self;
        _table.dataSource = self;
    }
    return _table;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
}

- (void)setUpUI{
    [self.view addSubview:self.table];
    [_table mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.mas_equalTo(self.view);
    }];
}

// MARK: - UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WBMineTableViewCell *cell = [WBMineTableViewCell configCellWithTableView:tableView];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

// MARK: - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
}


@end
