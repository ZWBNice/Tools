//
//  HttpRequestManager.h
//  ProjectFramework
//
//  Created by zwb on 2018/1/24.
//  Copyright © 2018年 WB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

static NSString * const BaseUrlString = @"";
static CGFloat AFtimeoutInterval = 30.0f;

typedef enum : NSUInteger {
    KHttpRequstTypeGet,
    KHttpRequstTypePost,
    KHttpRequstTypePut,
    KHttpRequstTypeDelete,

} HttpRequestType;


typedef enum : NSUInteger {
    KNetworkStatusNotReachable,
    kNetworkStatusReachableViaWiFi,
    kNetworkStatusReachableViaWWAN,
    kNetworkStatusUnknown,
} kNetWorkStatus;

// MARK: - 下载进度block
typedef void (^DownloadProgress)(int64_t bytesRead,
                                 int64_t totalBytesRead);
// MARK: - 请求成功block
typedef void(^HTTPResponseSuccess)(id response);
// MARK: - 请求失败block
typedef void(^HTTPResponseFail)(NSError *error);

@interface HttpRequestManager : NSObject

@property(nonatomic, assign) kNetWorkStatus netWorkStatus;

+ (HttpRequestManager *)sharedInstance;

- (void)requestWithHttpMethodType:(HttpRequestType)requsetType withURL:(NSString *)urlString withParameters:(NSDictionary *)params withIsCache:(BOOL)isCache withSuccessBlock:(HTTPResponseSuccess)successBlock WithFailBlock:(HTTPResponseFail)failBlock withdownloadBlock:(DownloadProgress)downloadBlock;


@end
