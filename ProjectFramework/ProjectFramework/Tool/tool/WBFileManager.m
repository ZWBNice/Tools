//
//  WBFileManager.m
//  ProjectFramework
//
//  Created by zwb on 2018/1/18.
//  Copyright © 2018年 WB. All rights reserved.
//

#import "WBFileManager.h"

@implementation WBFileManager

// MARK: - getter && setter

- (NSString *)rootHomePath{
    if (!_rootHomePath) {
        _rootHomePath = NSHomeDirectory();
    }
    return _rootHomePath;
}

- (NSString *)tmpPath{
    if (!_tmpPath) {
        _tmpPath = NSTemporaryDirectory();
    }
    return _tmpPath;
}

- (NSString *)libraryPath{
    if (!_libraryPath) {
        NSArray * paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);

        _libraryPath = [paths lastObject];
    }
    return _libraryPath;
}

- (NSString *)documentPath{
    if (!_documentPath) {
        NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        _documentPath = [paths lastObject];
    }
    return _documentPath;
}

- (NSString *)cachesPath{
    if (!_cachesPath) {
        NSArray * paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
        _cachesPath = [paths lastObject];
    }
    return _cachesPath;
}

- (NSString *)preferencesPath{
    if (!_preferencesPath) {
        NSArray * paths = NSSearchPathForDirectoriesInDomains(NSPreferencePanesDirectory, NSUserDomainMask, YES);
        _preferencesPath = [paths lastObject];
    }
    return _preferencesPath;
}


// 创建文件夹
- (NSString *)createDirectoryTo:(WBwritetoLocation)location WithdirectoryName:(NSString *)name {
    NSString * directoryPath;
    switch (location) {
        case writetoDocumentPath:
            directoryPath = self.documentPath;
            break;
        case writetocachesPath:
            directoryPath = self.cachesPath;
            break;
        case writetoTmpPath:
            directoryPath = self.tmpPath;
            break;
        default:
            break;
    }
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *pathName = [directoryPath stringByAppendingPathComponent:name];
    BOOL isSuccess = [fileManager createDirectoryAtPath:pathName withIntermediateDirectories:YES attributes:nil error:nil];
    if (isSuccess) {
        NSLog(@"success");
        return pathName;
    } else {
        NSLog(@"fail");
        return nil;
    }
}

// 创建文件
- (NSString *)createFileTodirectoryPath:(NSString *)directoryPath WithFileName:(NSString *)fileName {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *path = [directoryPath stringByAppendingPathComponent:fileName];
    BOOL isSuccess = [fileManager createFileAtPath:path contents:nil attributes:nil];
    if (isSuccess) {
        return path;
    } else {
        NSLog(@"fail");
        return nil;
    }
}

// 写入文件
- (void)writeDataTodirectoryPath:(NSString *)directoryPath WithData:(id)data {
//    NSArray *arr = [NSArray array];
//    NSDictionary *dic = [NSDictionary dictionary];
    
    BOOL isSuccess =[data writeToFile:directoryPath atomically:YES];
    if (isSuccess) {
        NSLog(@"write success");
    } else {
        NSLog(@"write fail");
    }
}

//// 读取文件
//- (void)readFile {
//    NSString *documentsPath =[self getDocumentsPath];
//    NSString *iOSPath = [documentsPath stringByAppendingPathComponent:@"iOS.txt"];
//    NSString *content = [NSString stringWithContentsOfFile:iOSPath encoding:NSUTF8StringEncoding error:nil];
//    NSLog(@"read success: %@",content);
//}

// 判断文件是否存在
- (BOOL)isSxistAtPath:(NSString *)filePath {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isExist = [fileManager fileExistsAtPath:filePath];
    return isExist;
}

// 计算文件大小
- (unsigned long long)fileSizeAtPath:(NSString *)filePath {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isExist = [fileManager fileExistsAtPath:filePath];
    if (isExist) {
        unsigned long long fileSize = [[fileManager attributesOfItemAtPath:filePath error:nil] fileSize];
        return fileSize;
    } else {
        NSLog(@"file is not exist");
        return 0;
    }
}

// 计算整个文件夹中所有文件大小
- (unsigned long long)folderSizeAtPath:(NSString*)folderPath {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isExist = [fileManager fileExistsAtPath:folderPath];
    if (isExist) {
        NSEnumerator *childFileEnumerator = [[fileManager subpathsAtPath:folderPath] objectEnumerator];
        unsigned long long folderSize = 0;
        NSString *fileName = @"";
        while ((fileName = [childFileEnumerator nextObject]) != nil){
            NSString* fileAbsolutePath = [folderPath stringByAppendingPathComponent:fileName];
            folderSize += [self fileSizeAtPath:fileAbsolutePath];
        }
        return folderSize / (1024.0 * 1024.0);
    } else {
        NSLog(@"file is not exist");
        return 0;
    }
}

//// 删除文件
//- (void)deleteFile {
//    NSString *documentsPath =[self getDocumentsPath];
//    NSFileManager *fileManager = [NSFileManager defaultManager];
//    NSString *iOSPath = [documentsPath stringByAppendingPathComponent:@"iOS.txt"];
//    BOOL isSuccess = [fileManager removeItemAtPath:iOSPath error:nil];
//    if (isSuccess) {
//        NSLog(@"delete success");
//    }else{
//        NSLog(@"delete fail");
//    }
//}
//
//// 移动文件
//- (void)moveFileName {
//    NSString *documentsPath =[self getDocumentsPath];
//    NSFileManager *fileManager = [NSFileManager defaultManager];
//    NSString *filePath = [documentsPath stringByAppendingPathComponent:@"iOS.txt"];
//    NSString *moveToPath = [documentsPath stringByAppendingPathComponent:@"iOS.txt"];
//    BOOL isSuccess = [fileManager moveItemAtPath:filePath toPath:moveToPath error:nil];
//    if (isSuccess) {
//        NSLog(@"rename success");
//    }else{
//        NSLog(@"rename fail");
//    }
//}

//// 重命名
//- (void)renameFileName {
//    //通过移动该文件对文件重命名
//    NSString *documentsPath =[self getDocumentsPath];
//    NSFileManager *fileManager = [NSFileManager defaultManager];
//    NSString *filePath = [documentsPath stringByAppendingPathComponent:@"iOS.txt"];
//    NSString *moveToPath = [documentsPath stringByAppendingPathComponent:@"rename.txt"];
//    BOOL isSuccess = [fileManager moveItemAtPath:filePath toPath:moveToPath error:nil];
//    if (isSuccess) {
//        NSLog(@"rename success");
//    }else{
//        NSLog(@"rename fail");
//    }
//}

@end
