//
//  WBFileManager.h
//  ProjectFramework
//
//  Created by zwb on 2018/1/18.
//  Copyright © 2018年 WB. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    writetoDocumentPath,
    writetocachesPath,
    writetoTmpPath,
} WBwritetoLocation;

@interface WBFileManager : NSObject
// 根目录
@property(nonatomic, strong) NSString *rootHomePath;
// /Library目录
@property(nonatomic, strong) NSString *libraryPath;
// /Documents目录
@property(nonatomic, strong) NSString *documentPath;
// /caches目录
@property(nonatomic, strong) NSString *cachesPath;
// /preference目录
@property(nonatomic, strong) NSString *preferencesPath;
//  /tmp目录
@property(nonatomic, strong)  NSString *tmpPath;

// MARK: - 创建文件夹到某个目录下
- (NSString *)createDirectoryTo:(WBwritetoLocation)location WithdirectoryName:(NSString *)name;
// MARK: - 创建文件到某个文件夹下
- (NSString *)createFileTodirectoryPath:(NSString *)directoryPath WithFileName:(NSString *)fileName;


- (void)writeDataTodirectoryPath:(NSString *)directoryPath WithData:(id)data;
@end
