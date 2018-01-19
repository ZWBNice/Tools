
//
//  WBlayout.m
//  自定义layout
//
//  Created by 张文博 on 16/6/30.
//  Copyright © 2016年 张文博. All rights reserved.
//

#import "WBlayout.h"

#define WBWIDTH     [UIScreen mainScreen].bounds.size.width

#define WBHEIGHT     [UIScreen mainScreen].bounds.size.height

// 一定要小于 每个item的width的一半
#define Padding  (WBWIDTH/(self.columnMaxCount + 1)-4)/2


@interface WBlayout ()
@property (nonatomic, strong) NSMutableArray *attributesArr;
@property (nonatomic, assign) NSInteger i;
@property (nonatomic, assign) int columnCounts;
@end

@implementation WBlayout

- (instancetype)init {
    
    if (self = [super init]) {
        self.attributesArr = [NSMutableArray array];
        self.columnMaxCount = 8;
    }
    
    return self;
}

- (void)setColumnMaxCount:(NSInteger)columnMaxCount {
    
    _columnMaxCount = columnMaxCount;
}

- (void)prepareLayout {
    [super prepareLayout];
    
    _i = 0;
    _columnCounts = 0;

    // 要获取collectionView上有多少个item
    NSInteger count = [self.collectionView numberOfItemsInSection:0];

    for (NSInteger i = 0; i<count; i++) {
    
        [self setItemFrame:i];
    }
    
}

#pragma mark 第三个方法,用来设置每一个item的尺寸
- (void)setItemFrame:(NSInteger)index {
    
    // 指点当前的item是第几分区,第几个
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
    
            UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
            // 通过attributes设置item的尺寸
            [self calculateAttributesFrameWith:attributes];
    
                if (attributes.frame.origin.x+attributes.frame.size.width >WBWIDTH) {
                _columnCounts += 1;
                _i = 0;
                [self calculateAttributesFrameWith:attributes];
                _i+= 1;

            }else{
                
                [self calculateAttributesFrameWith:attributes];
                _i+= 1;

            }
    
        [self.attributesArr addObject:attributes];
    
}

/**
 *  计算 基数行和偶数行 每个item的frame
 *
 *  @param attributes attributes description
 */
- (void)calculateAttributesFrameWith:(UICollectionViewLayoutAttributes *)attributes{
    
    if (_columnCounts % 2 == 0) {
        attributes.frame = CGRectMake(Padding+((WBWIDTH-Padding*2)/self.columnMaxCount)*_i, (WBWIDTH-Padding*2)/self.columnMaxCount*self.columnCounts, (WBWIDTH-Padding*2)/self.columnMaxCount, (WBWIDTH-Padding*2)/self.columnMaxCount);
        
    }else {
        attributes.frame = CGRectMake(Padding+(WBWIDTH-Padding*2)/self.columnMaxCount/2+((WBWIDTH-Padding*2)/self.columnMaxCount)*_i, (WBWIDTH-Padding*2)/self.columnMaxCount*_columnCounts, (WBWIDTH-Padding*2)/self.columnMaxCount, (WBWIDTH-Padding*2)/self.columnMaxCount);
        
    }

}


-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    

        return  self.attributesArr;
}

#pragma mark -- 之后，-(CGSize) collectionViewContentSize将被调用，以确定collection应该占据的尺寸。注意这里的尺寸不是指可视部分的尺寸，而应该是所有内容所占的尺寸。collectionView的本质是一个scrollView，因此需要这个尺寸来配置滚动行为。


- (CGSize)collectionViewContentSize{
    
    // 要获取collectionView上有多少个item
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    
    NSInteger rowcounts =  count/(self.columnMaxCount*2-1);
    CGFloat oneRowHeght = (WBWIDTH-Padding*2)/self.columnMaxCount;
    if (count%(self.columnMaxCount*2-1) == 0) {
        
        return CGSizeMake(0, rowcounts * oneRowHeght *2);

    }else if (count/(self.columnMaxCount*2-1) > 0 && count/(self.columnMaxCount*2-1) <= self.columnMaxCount){
        return CGSizeMake(0, (rowcounts) * oneRowHeght*2+oneRowHeght);

    }else {
        
        return CGSizeMake(0, (rowcounts+1) * oneRowHeght*2);
    }
}


@end
