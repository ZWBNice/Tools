//
//  WBHomeCollectionViewCell.m
//  ProjectFramework
//
//  Created by zwb on 2018/1/15.
//  Copyright © 2018年 WB. All rights reserved.
//

#import "WBHomeCollectionViewCell.h"

@implementation WBHomeCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUpUI];
    }
    return self;
}

+ (WBHomeCollectionViewCell *)configCell:(UICollectionView *)collectionView withindexPath:(NSIndexPath *)indexPath{
    WBHomeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:WBHomeCollectionViewCellReuse forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    
    return cell;
}

- (void)setUpUI{
    
}

@end
