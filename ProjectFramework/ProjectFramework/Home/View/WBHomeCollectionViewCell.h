//
//  WBHomeCollectionViewCell.h
//  ProjectFramework
//
//  Created by zwb on 2018/1/15.
//  Copyright © 2018年 WB. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *const WBHomeCollectionViewCellReuse = @"WBHomeCollectionViewCellReuse";

@interface WBHomeCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) UIImage *image;

+ (WBHomeCollectionViewCell *)configCell:(UICollectionView *)collectionView withindexPath:(NSIndexPath *)indexPath;

@end
