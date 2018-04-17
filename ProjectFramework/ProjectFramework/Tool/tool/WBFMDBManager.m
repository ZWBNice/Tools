//
//  WBFMDBManager.m
//  ProjectFramework
//
//  Created by zwb on 2018/1/22.
//  Copyright © 2018年 WB. All rights reserved.
//

#import "WBFMDBManager.h"

@implementation WBFMDBManager

+ (WBFMDBManager *)shareFMDBManager
 {
    static WBFMDBManager *once = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        once = [[self alloc] init];
    });
    return once;
}

// MARK: - 创建数据库
- (FMDatabase *)createDBWithDBName:(NSString *)dbName{
    NSArray *library = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *dbPath = [library[0] stringByAppendingPathComponent:dbName];
    NSLog(@"%@",dbPath);
    FMDatabase *db = [FMDatabase databaseWithPath:dbPath];
    if (![db open]) {
        NSLog(@"%@",@"无法获取数据库");
        return nil;
    }
    NSLog(@"%@",@"数据库创建成功");
    return db;
}

// MARK: - 给指定数据库建表
- (void)createTableWithDB:(FMDatabase *)db WithTableName:(NSString *)tableName WithSQLString:(NSString *)sql{
    if ([self isOpenDataBase:db]) {
        BOOL flag = [db executeUpdate:sql];
        [self checkSQLIsSuccessWithdbResult:flag];
    }
}

// MARK: -  给指定数据库的表添加值

- (void)insertKeyValues:(NSDictionary *)keyValues WithDB:(FMDatabase *)db intoTable:(NSString *)tableName WithSQLString:(NSString *)sql{
    if ([self isOpenDataBase:db]) {
        BOOL flag = [db executeUpdate:sql withArgumentsInArray:[keyValues allValues]];
        [self checkSQLIsSuccessWithdbResult:flag];
    }
}

// MARK: - 打开数据库
- (BOOL)isOpenDataBase:(FMDatabase *)db{
    if (![db open]) {
        [db open];
    }
    return YES;
}

- (void)checkSQLIsSuccessWithdbResult:(BOOL)isSuccess{
    if (isSuccess) {
        NSLog(@"%@",@"sql执行成功");
    }else{
        NSLog(@"%@",@"sql执行失败");
    }
}


@end
