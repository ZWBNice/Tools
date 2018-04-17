//
//  WBBaseEmptyView.m
//  ProjectFramework
//
//  Created by zwb on 2018/1/16.
//  Copyright © 2018年 WB. All rights reserved.
//

#import "WBBaseEmptyView.h"

@implementation WBBaseEmptyView
{
    CGFloat contentMaxWidth; //最大宽度
    CGFloat contentWidth;    //内容物宽度
    CGFloat contentHeight;   //内容物高度
    CGFloat subViweMargin;   //间距
}

// MARK: - 懒加载

- (UIImageView *)tipImages{
    if (!_tipImages) {
        _tipImages = [[UIImageView alloc] init];
        _tipImages.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview: _tipImages];
    }
    return _tipImages;
}

- (UILabel *)tipsLabel{
    if (!_tipsLabel) {
        _tipsLabel = [[UILabel alloc] init];
        _tipsLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview: _tipsLabel];
    }
    return _tipsLabel;
}

- (UILabel *)detailsLabel{
    if (!_detailsLabel) {
        _detailsLabel = [[UILabel alloc] init];
        _detailsLabel.numberOfLines = 0;
        _detailsLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview: _detailsLabel];
    }
    return _detailsLabel;
}

- (UIButton *)doneBtn{
    if (!_doneBtn) {
        _doneBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_doneBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.contentView addSubview: _doneBtn];
    }
    return _doneBtn;
}

- (void)setImageSize:(CGSize)imageSize{
        _imageSize = imageSize;
}

+ (instancetype)createEmptyViewWithImageName:(NSString *)imageName titleString:(NSString *)titleString detailStr:(NSString *)detailStr btnTitleStr:(NSString *)btnTitleStr target:(id)target action:(SEL)action{
    WBBaseEmptyView *emptyView = [[WBBaseEmptyView alloc] init];
    [emptyView creatEmptyViewWithImageStr:imageName titleStr:titleString detailStr:detailStr btnTitleStr:btnTitleStr target:target action:action];
    return emptyView;
}

- (void)creatEmptyViewWithImageStr:(NSString *)imageStr titleStr:(NSString *)titleStr detailStr:(NSString *)detailStr btnTitleStr:(NSString *)btnTitleStr target:(id)target action:(SEL)action{
    [self prepare];
    _imageStr = imageStr;
    _titleStr = titleStr;
    _detailStr = detailStr;
    _btnTitleStr = btnTitleStr;
    _actionBtnTarget = target;
    _actionBtnAction = action;
    //内容物背景视图
    if (!_contentView) {
        _contentView = [[UIView alloc] initWithFrame:CGRectZero];
        [self addSubview:_contentView];
    }
}


- (void)prepare{
    self.autoresizingMask = UIViewAutoresizingFlexibleWidth |  UIViewAutoresizingFlexibleHeight;
    contentWidth = 0;
    contentHeight = 0;
    subViweMargin = 20;
    contentMaxWidth = SCREEN_WIDTH - 30.0f;
    self.tipsFont = [UIFont systemFontOfSize:16];
}

- (void)setupTipsImage{
    UIImage *img = [UIImage imageNamed:self.imageStr];
    self.tipImages.image = img;
    
    CGFloat imgViewWidth = img.size.width;
    CGFloat imgViewHeight = img.size.height;
    
    if (self.imageSize.width && self.imageSize.height) {
        if (imgViewWidth > imgViewHeight) {
            imgViewHeight = (imgViewHeight / imgViewWidth) * self.imageSize.width;
            imgViewWidth = self.imageSize.width;
            
        }else{
            imgViewWidth = (imgViewWidth / imgViewHeight) * self.imageSize.height;
            imgViewHeight = self.imageSize.height;
        }
    }
    
    self.tipImages.frame = CGRectMake(0, 0, imgViewWidth, imgViewHeight);
    contentWidth = self.tipImages.frame.size.width;
    contentHeight = self.tipImages.frame.size.height;

}

- (void)setupTipsLabel{
    self.tipsLabel.text = self.titleStr;
    UIFont *font = self.tipsFont.pointSize ? self.tipsFont : [UIFont systemFontOfSize:15];
    CGFloat fontSize = font.pointSize;
    UIColor *textColor = self.tipsLabTextColor ? self.tipsLabTextColor : [UIColor blackColor];
    CGFloat width = [self returnTextWidth:self.titleStr size:CGSizeMake(contentMaxWidth, fontSize) font:font].width;
    
    self.tipsLabel.frame = CGRectMake(0, contentHeight + subViweMargin, width, fontSize);
    self.tipsLabel.font = font;
    self.tipsLabel.textColor = textColor;
    contentWidth = width > contentWidth ? width : contentWidth;
    contentHeight = self.tipsLabel.frame.size.height + self.tipsLabel.frame.origin.y;

}

- (void)setupDetailsLabel{
    
    UIColor *textColor = self.detailLabTextColor ? self.detailLabTextColor : [UIColor grayColor];
    UIFont *font = self.detailLabFont.pointSize ? self.detailLabFont : [UIFont systemFontOfSize:13];
    CGFloat fontSize = font.pointSize;
    
    CGFloat maxHeight =   2 * (fontSize + 5);//如果没有设置最大行数，默认设置为2行的高度
    CGSize size = [self returnTextWidth:self.detailStr size:CGSizeMake(contentMaxWidth, maxHeight) font:font];
    CGFloat width = size.width;
    CGFloat height = size.height;
    
    self.detailsLabel.font = font;
    self.detailsLabel.frame = CGRectMake(0, contentHeight + subViweMargin, width, height);
    self.detailsLabel.text = self.detailStr;
    self.detailsLabel.textColor = textColor;
    
    contentWidth = width > contentWidth ? width : contentWidth;
    contentHeight = self.detailsLabel.frame.size.height + self.detailsLabel.frame.origin.y;
}

- (void)setupDoneButton{
    
    UIFont *font = self.doneBtnFont.pointSize ? self.doneBtnFont : [UIFont systemFontOfSize:15];
    CGFloat fontSize = font.pointSize;
    UIColor *titleColor = self.doneBtnTextColor ? self.doneBtnTextColor : [UIColor blackColor];
    UIColor *backGColor = self.doneBtnBackGroundColor ? self.doneBtnBackGroundColor : [UIColor whiteColor];
    UIColor *borderColor =  [UIColor colorWithRed:0.8f green:0.8f blue:0.8f alpha:1];
    CGFloat borderWidth =  0.0f;
    CGFloat cornerRadius = 5.f;
    
    CGFloat horiMargin = 30.0f;
    CGFloat height =40.0f;
    CGSize textSize = [self returnTextWidth:self.btnTitleStr size:CGSizeMake(contentMaxWidth, fontSize) font:font];
    if (height < textSize.height) {
        height = textSize.height + 4;
    }
    CGFloat btnWidth = textSize.width + horiMargin * 2;
    CGFloat btnHeight = height;
    btnWidth = btnWidth > contentMaxWidth ? contentMaxWidth : btnWidth;
    
    self.doneBtn.frame = CGRectMake(0, contentHeight + subViweMargin, btnWidth, btnHeight);
    [self.doneBtn setTitle:self.btnTitleStr forState:UIControlStateNormal];
    self.doneBtn.titleLabel.font = font;
    self.doneBtn.backgroundColor = backGColor;
    [self.doneBtn setTitleColor:titleColor forState:UIControlStateNormal];
    self.doneBtn.layer.borderColor = borderColor.CGColor;
    self.doneBtn.layer.borderWidth = borderWidth;
    self.doneBtn.layer.cornerRadius = cornerRadius;
    [self.doneBtn addTarget:self.actionBtnTarget action:self.actionBtnAction forControlEvents:UIControlEventTouchUpInside];
    
    contentWidth = btnWidth > contentWidth ? btnWidth : contentWidth;
    contentHeight = self.doneBtn.frame.size.height + self.doneBtn.frame.origin.y;

}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self loadData];

}

- (void)loadData{
    
    if (self.imageStr.length) {
        [self setupTipsImage];
    }else{
        if (_tipImages) {
            [_tipImages removeFromSuperview];
        }
    }

    if (self.titleStr.length) {
        [self setupTipsLabel];
    }else{
        if (_tipsLabel) {
            [_tipsLabel removeFromSuperview];
        }
    }
    
    if (self.detailStr.length) {
        [self setupDetailsLabel];
    }else{
        if (_detailsLabel) {
            [_detailsLabel removeFromSuperview];
        }
    }
    if (self.btnTitleStr.length) {
        [self setupDoneButton];
    }else{
        if (_doneBtn) {
            [_doneBtn removeFromSuperview];
        }
    }
    _contentView.frame = CGRectMake(0, 0, contentWidth, contentHeight);
    self.frame = CGRectMake(0, 0 ,_contentView.frame.size.width,  _contentView.frame.size.height);
    
    CGFloat emptyViewCenterX = self.superview.frame.size.width * 0.5f;
    CGFloat emptyViewCenterY = (self.superview.frame.size.height - 64 - 44)* 0.5f;
    self.center = CGPointMake(emptyViewCenterX, emptyViewCenterY);
    
    //子控件的centerX设置
    CGFloat centerX = self.contentView.frame.size.width * 0.5f;
        self.tipImages.center = CGPointMake(centerX, self.tipImages.center.y);
        self.tipsLabel.center = CGPointMake(centerX, self.tipsLabel.center.y);
        self.detailsLabel.center = CGPointMake(centerX, self.detailsLabel.center.y);
        self.doneBtn.center = CGPointMake(centerX, self.doneBtn.center.y);
//        _titleLabel.ly_centerX       = centerX;
//        _detailLabel.ly_centerX = centerX;
//        _actionButton.ly_centerX    = centerX;

}

- (void)doneClick:(UIButton *)btn{
    self.btnClickBlock();
}

#pragma mark - ------------------ Help Method ------------------
- (CGSize)returnTextWidth:(NSString *)text size:(CGSize)size font:(UIFont *)font{
    CGSize textSize = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : font} context:nil].size;
    return textSize;
}


+ (instancetype)noDataView{
    return [WBBaseEmptyView createEmptyViewWithImageName:@"empty_meituan" titleString:@"没有网络" detailStr:@"哈哈sb了吧" btnTitleStr:nil target:nil action:nil];
}

+ (instancetype)noDataViewWithTarget:(id)target action:(SEL)action{
    
    return [WBBaseEmptyView createEmptyViewWithImageName:@"empty_yy" titleString:@"没有网络" detailStr:@"请打开设置检查网络设置" btnTitleStr:@"点击刷新" target:target action:action];
}


@end
