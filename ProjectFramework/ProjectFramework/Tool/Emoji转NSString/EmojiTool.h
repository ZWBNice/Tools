//
//  EmojiTool.h
//  表情
//
//  Created by 邢琦 on 15/10/20.
//  Copyright © 2015年 蓝鸥3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EmojiTool : NSObject

+ (NSString *)emojiStringFromString:(NSString *)text;

+ (NSString *)plainStringFromEmojiString:(NSString *)emojiText;

@end
