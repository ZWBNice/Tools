//
//  UITableView+Empty.m
//  ProjectFramework
//
//  Created by zwb on 2018/1/16.
//  Copyright © 2018年 WB. All rights reserved.
//

#import "UITableView+Empty.h"
#import <objc/runtime.h>
#import "UIScrollView+Empty.h"

@implementation UITableView (Empty)

// load 方法会在加载类的时候就被调用，也就是 ios 应用启动的时候，就会加载所有的类，就会调用每个类的 + load 方法。
+ (void)load{
    Method reloadData = class_getInstanceMethod(self, @selector(reloadData));
    Method wb_reloadData = class_getInstanceMethod(self, @selector(wb_reloadData));
    method_exchangeImplementations(reloadData, wb_reloadData);
    
    // section
    Method insertSections = class_getInstanceMethod(self, @selector(insertSections:withRowAnimation:));
    Method wb_insertSections = class_getInstanceMethod(self, @selector(wb_insertSections:withRowAnimation:));
    method_exchangeImplementations(insertSections, wb_insertSections);

    Method deleteSections = class_getInstanceMethod(self, @selector(deleteSections:withRowAnimation:));
    Method wb_deleteSections = class_getInstanceMethod(self, @selector(wb_deleteSections:withRowAnimation:));
    method_exchangeImplementations(deleteSections, wb_deleteSections);
    
    // row

    Method insertRows = class_getInstanceMethod(self, @selector(insertRowsAtIndexPaths:withRowAnimation:));
    Method wb_insertRows = class_getInstanceMethod(self, @selector(wb_insertRowsAtIndexPaths:withRowAnimation:));
    method_exchangeImplementations(insertRows, wb_insertRows);
    
    Method deleteRows = class_getInstanceMethod(self, @selector(deleteRowsAtIndexPaths:withRowAnimation:));
    Method wb_deleteRows = class_getInstanceMethod(self, @selector(wb_deleteRowsAtIndexPaths:withRowAnimation:));
    method_exchangeImplementations(deleteRows, wb_deleteRows);
    

}

- (void)wb_reloadData{
    [self wb_reloadData];
    [self getDataAndSet];
}

- (void)wb_insertSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation{
    [self wb_insertSections:sections withRowAnimation:animation];
    [self getDataAndSet];

}
- (void)wb_deleteSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation{
    [self wb_deleteSections:sections withRowAnimation:animation];
    [self getDataAndSet];

}

- (void)wb_insertRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation{
    [self wb_insertRowsAtIndexPaths:indexPaths withRowAnimation:animation];
    [self getDataAndSet];
}

- (void)wb_deleteRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation{
    [self wb_deleteRowsAtIndexPaths:indexPaths withRowAnimation:animation];
    [self getDataAndSet];
}


@end
