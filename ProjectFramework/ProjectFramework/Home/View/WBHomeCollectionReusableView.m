//
//  WBHomeCollectionReusableView.m
//  ProjectFramework
//
//  Created by zwb on 2018/1/15.
//  Copyright © 2018年 WB. All rights reserved.
//

#import "WBHomeCollectionReusableView.h"

@implementation WBHomeCollectionReusableView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI{
    self.titleL = [[UILabel alloc] init];
    self.titleL.text = @"  标题";
    [self addSubview:self.titleL];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.titleL.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.frame.size.height);
}

@end
