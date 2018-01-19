//
//  ZWBgaosi.h
//  LifeCool
//
//  Created by 张文博 on 16/9/20.
//  Copyright © 2016年 WB. All rights reserved.
//
//self.imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 300, SCREENWIDTH, 100)];

//self.imageView.contentMode=UIViewContentModeScaleAspectFill;
//self.imageView.image=[UIImage boxblurImage:self.image withBlurNumber:0.5];
//self.imageView.clipsToBounds=YES;
//[self.view addSubview:self.imageView];





#import <UIKit/UIKit.h>

@interface ZWBgaosi : UIImage
+(UIImage *)boxblurImage:(UIImage *)image withBlurNumber:(CGFloat)blur ;
@end
