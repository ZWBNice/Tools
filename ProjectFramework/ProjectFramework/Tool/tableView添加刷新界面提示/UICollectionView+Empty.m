//
//  UICollectionView+Empty.m
//  ProjectFramework
//
//  Created by zwb on 2018/1/17.
//  Copyright © 2018年 WB. All rights reserved.
//

#import "UICollectionView+Empty.h"
#import <objc/runtime.h>
#import "UIScrollView+Empty.h"

@implementation UICollectionView (Empty)
+ (void)load{
    
    Method reloadData = class_getInstanceMethod(self, @selector(reloadData));
    Method wb_reloadData = class_getInstanceMethod(self, @selector(wb_reloadData));
    method_exchangeImplementations(reloadData, wb_reloadData);
    
    
    ///section
    Method insertSections = class_getInstanceMethod(self, @selector(insertSections:));
    Method wb_insertSections = class_getInstanceMethod(self, @selector(wb_insertSections:));
    method_exchangeImplementations(insertSections, wb_insertSections);
    
    Method deleteSections = class_getInstanceMethod(self, @selector(deleteSections:));
    Method wb_deleteSections = class_getInstanceMethod(self, @selector(wb_deleteSections:));
    method_exchangeImplementations(deleteSections, wb_deleteSections);
    
    ///item
    Method insertItemsAtIndexPaths = class_getInstanceMethod(self, @selector(insertItemsAtIndexPaths:));
    Method wb_insertItemsAtIndexPaths = class_getInstanceMethod(self, @selector(wb_insertItemsAtIndexPaths:));
    method_exchangeImplementations(insertItemsAtIndexPaths, wb_insertItemsAtIndexPaths);
    
    Method deleteItemsAtIndexPaths = class_getInstanceMethod(self, @selector(deleteItemsAtIndexPaths:));
    Method wb_deleteItemsAtIndexPaths = class_getInstanceMethod(self, @selector(wb_deleteItemsAtIndexPaths:));
    method_exchangeImplementations(deleteItemsAtIndexPaths, wb_deleteItemsAtIndexPaths);

}


- (void)wb_reloadData{
    [self wb_reloadData];
    [self getDataAndSet];
}

///section
- (void)wb_insertSections:(NSIndexSet *)sections{
    [self wb_insertSections:sections];
    [self getDataAndSet];
}
- (void)wb_deleteSections:(NSIndexSet *)sections{
    [self wb_deleteSections:sections];
    [self getDataAndSet];
}
///item
- (void)wb_insertItemsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths{
    [self wb_insertItemsAtIndexPaths:indexPaths];
    [self getDataAndSet];
}
- (void)wb_deleteItemsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths{
    [self wb_deleteItemsAtIndexPaths:indexPaths];
    [self getDataAndSet];
}


@end
