//
//  WBSecondViewController.m
//  ProjectFramework
//
//  Created by RC025 on 17/3/22.
//  Copyright © 2017年 WB. All rights reserved.
//

#import "WBSecondViewController.h"
#import "WBFileManager.h"
#import "WBFMDBManager.h"
@interface WBSecondViewController ()
//@property ()
@end

@implementation WBSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   WBFileManager *mm = [[WBFileManager alloc] init];
   NSString *name = [mm createDirectoryTo:TmpPath WithdirectoryName:@"Hello"];
    NSLog(@"%@",name);
   NSString *fileName = [mm createFileTodirectoryPath:name WithFileName:@"test1.json"];
    NSLog(@"%@",fileName);
    [mm writeDataTodirectoryPath:fileName WithData:@{@"sds":@0,@"avc":@{@"1":@"中国"}}];
    NSDictionary *dic = [mm loadDataWithPath:fileName];
    NSLog(@"%@",dic[@"sds"]);
    NSLog(@"%@",dic[@"avc"][@"1"]);
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
