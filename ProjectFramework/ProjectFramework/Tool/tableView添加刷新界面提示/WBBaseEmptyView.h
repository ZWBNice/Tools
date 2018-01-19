//
//  WBBaseEmptyView.h
//  ProjectFramework
//
//  Created by zwb on 2018/1/16.
//  Copyright © 2018年 WB. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 事件回调
 */
typedef void (^BtnBlock)();

@interface WBBaseEmptyView : UIView
/**
 内容物背景视图
 */
@property (nonatomic,strong,readonly)   UIView  *contentView;
@property(nonatomic, strong) UIImageView *tipImages;
@property(nonatomic, strong) UILabel *tipsLabel;
@property(nonatomic, strong) UILabel *detailsLabel;

@property(nonatomic, strong) UIButton *doneBtn;
@property(nonatomic, copy) BtnBlock btnClickBlock;

@property (nonatomic, copy) NSString *imageStr;
@property (nonatomic, copy) NSString *titleStr;
@property (nonatomic, copy) NSString *detailStr;
@property (nonatomic, copy) NSString *btnTitleStr;
@property (nonatomic, weak, readonly)   id actionBtnTarget;
@property (nonatomic,assign,readonly)   SEL actionBtnAction;

/**
 图片可设置固定大小 (default=图片实际大小)
 */
@property (nonatomic, assign) CGSize imageSize;
/**
 tipsLabel字体颜色
 */
@property (nonatomic, strong) UIColor *tipsLabTextColor;
/**
 tipsLabel字体大小
 */
@property (nonatomic, strong) UIFont *tipsFont;

/**
 detailsLabel字体颜色
 */
@property (nonatomic, strong) UIColor *detailLabTextColor;
/**
 tipsLabel字体大小
 */
@property (nonatomic, strong) UIFont *detailLabFont;

/**
 按钮字体大小
 */
@property (nonatomic, strong) UIFont *doneBtnFont;

/**
 按钮字体颜色
 */
@property (nonatomic, strong) UIColor *doneBtnTextColor;

/**
 按钮背景颜色
 */
@property (nonatomic, strong) UIColor *doneBtnBackGroundColor;


+ (instancetype)noDataView;

+ (instancetype)noDataViewWithTarget:(id)target action:(SEL)action;





@end
