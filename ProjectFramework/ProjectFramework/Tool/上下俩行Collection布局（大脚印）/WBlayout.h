//
//  WBlayout.h
//  自定义layout
//
//  Created by 张文博 on 16/6/30.
//  Copyright © 2016年 张文博. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WBlayout : UICollectionViewLayout



/**
 *  设置距离屏幕四周的边界距离
 */
@property(nonatomic, assign)UIEdgeInsets edgeInsets;

/**
 *  行间距
 */
@property(nonatomic, assign)NSInteger rowSpace;

/**
 *  列间距
 */
@property(nonatomic, assign)NSInteger columnSpace;

/**
 *   最大的列数 默认为8
 */
@property (nonatomic, assign) NSInteger columnMaxCount;

@end
