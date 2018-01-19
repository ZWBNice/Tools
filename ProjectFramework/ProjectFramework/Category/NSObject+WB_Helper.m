//
//  NSObject+WB_Helper.m
//  WBKIT
//
//  Created by 张文博 on 16/7/26.
//  Copyright © 2016年 张文博. All rights reserved.
//

#import "NSObject+WB_Helper.h"

@implementation NSObject (WB_Helper)

- (NSString *)conversionToString{
    
    return [NSObject conversionToStringWith:self];
}

+ (NSString *)conversionToStringWith:(id)objc {
    NSError *error;
    NSData *data = [NSJSONSerialization dataWithJSONObject:objc options:0 error:&error];
    
    NSString *result = [[NSString alloc] initWithData:data  encoding:NSUTF8StringEncoding];
    return result;
}

@end
