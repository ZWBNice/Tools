//
//  WBFourTableViewCell.m
//  ProjectFramework
//
//  Created by zwb on 2018/1/15.
//  Copyright © 2018年 WB. All rights reserved.
//

#import "WBFourTableViewCell.h"

@implementation WBFourTableViewCell

- (id)initWithCellReuse:(NSString *)cellReuse{
    if (self= [super initWithCellReuse:cellReuse]) {
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI{
    self.titleL = [[UILabel alloc] init];
    self.contentL = [[UILabel alloc] init];
    [self.contentView addSubview:self.titleL];
    [self.contentView addSubview:self.contentL];

}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.titleL.frame = CGRectMake(10, 0, 100, 20);
    self.contentL.frame = CGRectMake(200, 0, 100, 20);

}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
