//
//  KeychainManager.m
//  MHProject
//
//  Created by Andy on 15/7/22.
//  Copyright (c) 2015年 Andy. All rights reserved.
//

#import "KeychainManager.h"
#import "KeyChain.h"

@implementation KeychainManager

//用bundleid来做key 保证唯一性
#define KEY_IN_KEYCHAIN  [[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString *)kCFBundleIdentifierKey]

#define KEY_PASSWOED [KEY_IN_KEYCHAIN stringByAppendingString:@"Password"]

#define KEY_USERNAME [KEY_IN_KEYCHAIN stringByAppendingString:@"UserName"]

/**
 *  保存数据
 *
 *  @param password 密码
 *  @param userName 用户名
 */
+ (void)savePassword:(NSString *)password userName:(NSString *)userName
{
    NSMutableDictionary *data = [NSMutableDictionary dictionary];
    [data setObject:password forKey:KEY_PASSWOED];
    [data setObject:userName forKey:KEY_USERNAME];
    [KeyChain saveKeychain:KEY_IN_KEYCHAIN data:data];
}

/**
 *  读取密码
 *
 *  @return <#return value description#>
 */
+ (id)readPassword
{
    NSMutableDictionary *data = (NSMutableDictionary *)[KeyChain loadKeychain:KEY_IN_KEYCHAIN];
    return [data objectForKey:KEY_PASSWOED];
}

/**
 *  读取用户名
 *
 *  @return <#return value description#>
 */
+ (id)readUserName
{
    NSMutableDictionary *data = (NSMutableDictionary *)[KeyChain loadKeychain:KEY_IN_KEYCHAIN];
    return [data objectForKey:KEY_USERNAME];
}

/**
 *  删除数据
 */
+ (void)deleteData
{
    [KeyChain deleteKeychain:KEY_IN_KEYCHAIN];
}

/**
 *  删除密码
 */
+ (void)deletePassword
{
    NSMutableDictionary *data = (NSMutableDictionary *)[KeyChain loadKeychain:KEY_IN_KEYCHAIN];
    [data removeObjectForKey:KEY_PASSWOED];
    [KeyChain saveKeychain:KEY_IN_KEYCHAIN data:data];
}

/**
 *  删除用户名
 */
+ (void)deleteUserName
{
    NSMutableDictionary *data = (NSMutableDictionary *)[KeyChain loadKeychain:KEY_IN_KEYCHAIN];
    [data removeObjectForKey:KEY_USERNAME];
    [KeyChain saveKeychain:KEY_IN_KEYCHAIN data:data];
}

@end
