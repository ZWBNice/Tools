//
//  WBTabBar.m
//  ProjectFramework
//
//  Created by RC025 on 17/3/22.
//  Copyright © 2017年 WB. All rights reserved.
//

#import "WBTabBar.h"

@implementation WBTabBar

- (instancetype)init{
    if (self = [super init]) {
     
        [self setUpCenterButton];
    }
    return self;
}


- (void)setUpCenterButton{
    
    self.centerBtn = ({
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:@"post_normal"] forState:UIControlStateNormal];
        btn.bounds = CGRectMake(0, 0, 64, 64);
        [self addSubview:btn];
        btn;
    });
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.centerBtn.center =  CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.3);
    int index = 0;
    CGFloat width = self.bounds.size.width / tabBarCount;
    
    // 便利tabbar的子视图，重新布局tabbar上的额按钮
    for (UIView *subView in self.subviews) {
        
        if ([subView isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            subView.frame = CGRectMake(index * width, self.bounds.origin.y, width, self.bounds.size.height - 2);
            index++;
            if (index == 2) {
                index++;
            }
        }
    }
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
    if (self.isHidden == NO) {
        //由于凸起的按钮上部分超出父视图，不会响应本身事件。所有在hitTest方法，使凸起按钮响应把自身事件。
        CGPoint newPoint = [self convertPoint:point toView:self.centerBtn];
        
        if ( [self.centerBtn pointInside:newPoint withEvent:event]) {
            return self.centerBtn;
        }else{
            
            return [super hitTest:point withEvent:event];
        }
    }
    
    else {
        return [super hitTest:point withEvent:event];
    }
}


@end
