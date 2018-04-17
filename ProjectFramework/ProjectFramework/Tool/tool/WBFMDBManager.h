//
//  WBFMDBManager.h
//  ProjectFramework
//
//  Created by zwb on 2018/1/22.
//  Copyright © 2018年 WB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FMDB.h>
@interface WBFMDBManager : NSObject

+ (WBFMDBManager *)shareFMDBManager;

// MARK: - 创建数据库
- (FMDatabase *)createDBWithDBName:(NSString *)dbName;

// MARK: - 给指定数据库建表
- (void)createTableWithDB:(FMDatabase *)db WithTableName:(NSString *)tableName WithSQLString:(NSString *)sql;

- (void)insertKeyValues:(NSDictionary *)keyValues WithDB:(FMDatabase *)db intoTable:(NSString *)tableName WithSQLString:(NSString *)sql;
@end
