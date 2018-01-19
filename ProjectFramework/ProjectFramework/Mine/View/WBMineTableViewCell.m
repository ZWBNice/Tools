//
//  WBMineTableViewCell.m
//  ProjectFramework
//
//  Created by zwb on 2018/1/15.
//  Copyright © 2018年 WB. All rights reserved.
//

#import "WBMineTableViewCell.h"

@implementation WBMineTableViewCell

- (instancetype)initWithCellReuse:(NSString *)cellReuse{
    if (self= [super initWithCellReuse:cellReuse]) {
        
    }
    return self;
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
