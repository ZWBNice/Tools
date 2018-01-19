//
//  KeychainManager.h
//  MHProject
//
//  Created by Andy on 15/7/22.
//  Copyright (c) 2015年 Andy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KeychainManager : NSObject

+ (void)savePassword:(NSString *)password userName:(NSString *)userName;

+ (id)readPassword;

+ (id)readUserName;

+ (void)deleteData;

+ (void)deletePassword;

+ (void)deleteUserName;

@end
