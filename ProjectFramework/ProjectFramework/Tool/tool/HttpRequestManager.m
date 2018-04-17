//
//  HttpRequestManager.m
//  ProjectFramework
//
//  Created by zwb on 2018/1/24.
//  Copyright © 2018年 WB. All rights reserved.
//

#import "HttpRequestManager.h"
#import "WBFileManager.h"

@interface HttpRequestManager ()
@property (nonatomic, strong) WBFileManager *fileManager;
@end

@implementation HttpRequestManager

- (WBFileManager *)fileManager{
    if(!_fileManager){
        _fileManager = [[WBFileManager alloc] init];
    }
    return _fileManager;
}


+ (HttpRequestManager *)sharedInstance{
    static HttpRequestManager *once = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        once = [[self alloc] init];
        once.netWorkStatus = kNetworkStatusReachableViaWiFi;
        [once checkNetworkStatus];
    });
    return once;
}

// MARK: - private method
- (AFHTTPSessionManager *)getSessionManager{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    // 设置超时时间
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = AFtimeoutInterval;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain", nil]];
    // 设置请求头
    //    manager.requestSerializer setValue:(nullable NSString *) forHTTPHeaderField:<#(nonnull NSString *)#>
    return manager;
}

- (NSString *)checkUrl:(NSString *)url{
    if([url hasPrefix:@"http://"]){
        return url;
    }else{
        return [BaseUrlString stringByAppendingString:url];
    }
}

// MARK: - 解析返回的responseObject
- (id)tryToParseData:(id)responseObject{
    if ([responseObject isKindOfClass:[NSData class]]) {
        // 尝试解析成JSON
        if (responseObject == nil) {
            return responseObject;
        } else {
            NSError *error = nil;
            NSDictionary *response = [NSJSONSerialization JSONObjectWithData:responseObject
                                                                     options:NSJSONReadingMutableContainers
                                                                       error:&error];
            if (error != nil) {
                return responseObject;
            } else {
                return response;
            }
        }
    } else {
        return responseObject;
    }
}

// MARK: - 检查网络错误code
- (void)checkHttpRequestFailErrorMessage:(NSError *)error{
    
    if(error.code == -1009 ){
        NSLog(@"没有网络");
        
    }else if (error.code == -1001){
        NSLog(@"网络超时");
    }
}

// MARK: - 检查网络环境
- (void)checkNetworkStatus {
    
    AFNetworkReachabilityManager *reachabilityManager = [AFNetworkReachabilityManager sharedManager];
    [reachabilityManager startMonitoring];
    [reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        if (status == AFNetworkReachabilityStatusNotReachable){
            self.netWorkStatus = KNetworkStatusNotReachable;
        } else if (status == AFNetworkReachabilityStatusUnknown){
            self.netWorkStatus = kNetworkStatusUnknown;
        } else if (status == AFNetworkReachabilityStatusReachableViaWWAN){
            self.netWorkStatus = kNetworkStatusReachableViaWWAN;
        } else if (status == AFNetworkReachabilityStatusReachableViaWiFi){
            self.netWorkStatus = kNetworkStatusReachableViaWiFi;
        }
    }];
    
}


- (void)cacheWithURLString:(NSString *)url WithRequestType:(HttpRequestType)type Withdata:(id)data {
    NSString *typeStr = [self getRequstTypeStringWithType:type];
    NSString *fileName = [self.fileManager createFileTodirectoryPath:self.fileManager.cachesPath WithFileName:[NSString stringWithFormat:@"%@.json",[[NSString stringWithFormat:@"%@%@",url,typeStr] stringFromMD5Capital]]];
    [self.fileManager writeDataTodirectoryPath:fileName WithData:data];
}

- (id)loadDataWithURLString:(NSString *)urlString WithRequestType:(HttpRequestType)type{
    NSString *typeStr = [self getRequstTypeStringWithType:type];
    id obj =  [self.fileManager loadDataWithPath:[self.fileManager.cachesPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.json",[[NSString stringWithFormat:@"%@%@",urlString,typeStr] stringFromMD5Capital]]]];
    return obj;
}

- (NSString *)getRequstTypeStringWithType:(HttpRequestType)type{
    NSString *typeStr = @"";
    switch (type) {
        case KHttpRequstTypeGet:
            typeStr = @"GET";
            break;
        case KHttpRequstTypePost:
            typeStr = @"POST";
            break;
        case KHttpRequstTypePut:
            typeStr = @"PUT";
            break;
        case KHttpRequstTypeDelete:
            typeStr = @"DELETE";
            break;
        default:
            break;
    }
    return typeStr;
}

// MARK: - public method
- (void)requestWithHttpMethodType:(HttpRequestType)requsetType withURL:(NSString *)urlString withParameters:(NSDictionary *)params withIsCache:(BOOL)isCache withSuccessBlock:(HTTPResponseSuccess)successBlock WithFailBlock:(HTTPResponseFail)failBlock withdownloadBlock:(DownloadProgress)downloadBlock{
    urlString = [urlString wb_urEncode];
    if(self.netWorkStatus == KNetworkStatusNotReachable){
        id obj = [self loadDataWithURLString:urlString WithRequestType:requsetType];
        successBlock(obj);
        return;
    }
    switch (requsetType) {
        case KHttpRequstTypeGet:{
            AFHTTPSessionManager *manager = [self getSessionManager];
            [manager GET:[self checkUrl:urlString] parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
                if (downloadBlock) {
                    downloadBlock(downloadProgress.completedUnitCount,downloadProgress.totalUnitCount);
                }

            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
               id data = [self tryToParseData:responseObject];
                successBlock(data);
                if (isCache){
                    [self cacheWithURLString:urlString WithRequestType:requsetType Withdata:data];
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if(error.code == -1001 || error.code == -1009){
                    id obj =  [self loadDataWithURLString:urlString WithRequestType:requsetType];
                    successBlock(obj);
                }else{
                    failBlock(error);
                }
            }];
            break;
        }
        case KHttpRequstTypePost:{
            AFHTTPSessionManager *manager = [self getSessionManager];
            [manager POST:[self checkUrl:urlString] parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
                if (downloadBlock) {
                    downloadBlock(downloadProgress.completedUnitCount,downloadProgress.totalUnitCount);
                }
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                id data = [self tryToParseData:responseObject];
                successBlock(data);
                if (isCache){
                    [self cacheWithURLString:urlString WithRequestType:requsetType Withdata:data];
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if(error.code == -1001 || error.code == -1009){
                    id obj =  [self loadDataWithURLString:urlString WithRequestType:requsetType];
                    successBlock(obj);
                }else{
                    failBlock(error);
                }
            }];
            break;
        }
        case KHttpRequstTypePut:{
            AFHTTPSessionManager *manager = [self getSessionManager];
            [manager PUT:[self checkUrl:urlString] parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                id data = [self tryToParseData:responseObject];
                successBlock(data);
                if (isCache){
                    [self cacheWithURLString:urlString WithRequestType:requsetType Withdata:data];
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if(error.code == -1001 || error.code == -1009){
                    id obj =  [self loadDataWithURLString:urlString WithRequestType:requsetType];
                    successBlock(obj);
                }else{
                    failBlock(error);
                }
            }];
            break;
        }
        case KHttpRequstTypeDelete:{
            AFHTTPSessionManager *manager = [self getSessionManager];
            [manager DELETE:[self checkUrl:urlString] parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                id data = [self tryToParseData:responseObject];
                successBlock(data);
                if (isCache){
                    [self cacheWithURLString:urlString WithRequestType:requsetType Withdata:data];
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if(error.code == -1001 || error.code == -1009){
                    id obj =  [self loadDataWithURLString:urlString WithRequestType:requsetType];
                    successBlock(obj);
                }else{
                    failBlock(error);
                }
            }];
            break;
        }
        default:
            break;
    }
}

@end
