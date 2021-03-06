//
//  KeyChain.h
//  MHProject
//
//  Created by Andy on 15/7/22.
//  Copyright (c) 2015年 Andy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KeyChain : NSObject

//需要导入Security.framework框架

+ (NSMutableDictionary *)getKeychainQuery:(NSString *)key;

+ (void)saveKeychain:(NSString *)key data:(id)data;

+ (id)loadKeychain:(NSString *)key;

+ (void)deleteKeychain:(NSString *)key;

@end
