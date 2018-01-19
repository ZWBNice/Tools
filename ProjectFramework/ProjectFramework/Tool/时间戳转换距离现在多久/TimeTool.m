//
//  TimeTool.m
//  12
//
//  Created by dllo on 15/11/27.
//  Copyright (c) 2015年 zwb. All rights reserved.
//

#import "TimeTool.h"
@implementation TimeTool
+ (NSString *)Whattime:(NSNumber *)timer {
    if (timer == nil) {
        return @"";
    }
    NSString *str = [NSString stringWithFormat:@"%@", timer];
    if (str.length) {
        
    double timeInterval = [[str substringToIndex:10]floatValue];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    // 这个是当前系统的时间
    NSDate *date = [NSDate date];
    // 转换成东8区的时间
    //    NSDate *date = [aadate dateByAddingTimeInterval:8 * 60 * 60];
    //   currentCalendar来获得当前系统用户设置的日历对象。
    NSCalendar *calendar = [NSCalendar currentCalendar];
    //     要从里面取值，还得定义其它的组件：NSComponents来表示一个日期对象的组件---例如年、月、日和小时。
    NSUInteger unitFlags = NSCalendarUnitYear| NSCalendarUnitMonth | NSCalendarUnitDay |NSCalendarUnitHour |NSCalendarUnitMinute;
    // 如果要使NSDateComponents对象有意义，必须将其与一个日历对象相关联。
    NSDateComponents *cmponents = [[NSDateComponents alloc] init];
    cmponents = [calendar components:unitFlags fromDate:date];
    //  5.      前面已经定义好了，下面就可以依次取里面的值了。
    //取出日 小时 分钟
    NSInteger dayNow = [cmponents day];
    NSInteger hourNow = [cmponents hour];
    NSInteger minuteNow = [cmponents minute];
    NSInteger secondNow = [cmponents second]; // 秒
    [formatter setDateFormat:@"MM-dd"];
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    
    
    
    NSDateComponents *cmponents1 = [[NSDateComponents alloc] init];
    cmponents1 = [calendar components:unitFlags fromDate:confromTimesp];
//    NSLog(@"%ld", [cmponents1 day]);
//    NSLog(@"%ld", [cmponents1 hour]);
    NSInteger dayData = [cmponents1 day];
    NSInteger hourData = [cmponents1 hour];
    NSInteger minuteData = [cmponents1 minute];
    NSInteger secondData = [cmponents1 second];
    // 同一天
    if (dayNow == dayData) {
        
        if (hourNow == hourData ) {
            if (minuteData == minuteNow ) {
                
                // 60秒之内
                if (secondData < secondNow || secondData == secondNow) {
                NSString *myTime = @"刚刚";
                    return myTime;
                }
            
            }else if (minuteData < minuteNow) {
                NSInteger i = minuteNow - minuteData;
                NSString *myTime = [NSString stringWithFormat:@"%ld分钟前", i];
                return myTime;
            }else {
                
                return @"刚刚";
            }
        }
        // 1小时之内
        else if (hourNow - 1 == hourData) {
            if (minuteData > hourData) {
                
                NSInteger i = 60 - minuteData + hourData;
                NSString *myTime = [NSString stringWithFormat:@"%ld分钟前", i];
                return myTime;
            }
            
        }else if (hourData < hourNow){
            
            NSInteger i = hourNow - hourData;
            NSString *myTime = [NSString stringWithFormat:@"%ld小时前", i];
            return myTime;
        }
        
    }
    // 一天之内
    else if (dayNow - 1 == dayData) {
        // 获取昨天的时间 即距离现在前24小时的时间
//        [cmponents setHour:-24];
//        [cmponents setMinute:0];
//        [cmponents setMinute:0];
    
        // 满足这个条件在24小时之内
        if (hourData > [cmponents hour]) {
            NSInteger i = 24 - hourData + hourNow;
           
            if (minuteData - minuteNow > 0 && minuteData == minuteNow) {
                i -= 1;
                NSString *myTime = [NSString stringWithFormat:@"%ld小时前",i];
                return myTime;
            }else {
                NSString *myTime = [NSString stringWithFormat:@"%ld小时前",i];
                return myTime;
            }
        } else {
            [formatter setDateFormat:@"MM-dd"];
            NSString *myTime = [formatter stringFromDate:confromTimesp];
            return myTime;
        }
    } // 不在一天之内
     else {
         [formatter setDateFormat:@"MM-dd"];
         NSString *myTime = [formatter stringFromDate:confromTimesp];
         return myTime;
    }

    }
        return nil;
}
@end
