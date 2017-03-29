//
//  KziwwsTextIndicatorView.m
//  彩宝宝
//
//  Created by xh on 16/1/12.
//  Copyright © 2016年 xh. All rights reserved.
//

#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define KPadding 20

#import "KziwwsTextIndicatorView.h"

@interface KziwwsTextIndicatorView ()

@property(strong,nonatomic) UIView *bgView;
@property(assign,nonatomic) BOOL isMaskGray;

@end

@implementation KziwwsTextIndicatorView

- (instancetype)initWithShowMessage:(NSString *)message isMaskGray:(BOOL)isMaskGray{
    
    CGSize textSize=[self  getNSStingFormCGSize:message textFont:14];

    self.isMaskGray=isMaskGray;
    
    CGFloat lableWidth=textSize.width+40;
    
    self = [super initWithFrame:CGRectMake((kScreenWidth-lableWidth)/2, kScreenHeight*0.45, lableWidth, textSize.height+20)];
    if(self){
       
        self.layer.masksToBounds=YES;
        self.layer.cornerRadius=6;
        
        UIButton *titleButton=[[UIButton alloc]init];
        [titleButton setTitle:message forState:UIControlStateNormal];
       
        [titleButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [titleButton.titleLabel setTextAlignment:NSTextAlignmentCenter];
        [titleButton setContentMode:UIViewContentModeCenter];
        [titleButton.titleLabel setFont:[UIFont boldSystemFontOfSize:14]];
        titleButton.titleLabel.numberOfLines=5;
        [titleButton setFrame:CGRectMake(10, 5, CGRectGetWidth(self.bounds)-20, CGRectGetHeight(self.bounds)-10)];
        [self addSubview:titleButton];
        
        if (_isMaskGray) {
            [self setBackgroundColor:[UIColor whiteColor]];
             [titleButton setBackgroundColor:[UIColor whiteColor]];
            [titleButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        }else{
            [self setBackgroundColor:[UIColor blackColor]];
             [titleButton setBackgroundColor:[UIColor blackColor]];
            [titleButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
        
    }
    return self;
}



-(void)showViewAfterDelay:(NSTimeInterval)delay{

   
    if (_isMaskGray) {
        
        UIView *bgView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
        bgView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
        [bgView addSubview:self];
        self.center=bgView.center;
        self.bgView=bgView;
        UIWindow *keywindow = [[UIApplication sharedApplication] keyWindow];
        [keywindow addSubview:bgView];
        
    }else{
        UIWindow *keywindow = [[UIApplication sharedApplication] keyWindow];
        [keywindow addSubview:self];
    }

    //3秒后执行删除视图
    [self performSelector:@selector(hide) withObject:self afterDelay:delay];

    
}

+(void)showTextIndicatorViewMessage:(NSString *)message afterDelay:(NSTimeInterval)delay isMaskGray:(BOOL)isMaskGray{
    
    KziwwsTextIndicatorView *textIndicatorView=[[KziwwsTextIndicatorView alloc]initWithShowMessage:message isMaskGray:isMaskGray];

    [textIndicatorView showViewAfterDelay:delay];

}


- (void)hide{
    [UIView animateWithDuration:1.0 animations:^{
        
    } completion:^(BOOL finished) {
        
        [self removeFromSuperview];
        if (_isMaskGray) {
            [self.bgView removeFromSuperview];
        }
        
    }];
}



-(CGSize)getNSStingFormCGSize:(NSString *)titleStr textFont:(NSInteger)fontSize{
    UIFont *fontOne = [UIFont systemFontOfSize:fontSize];//设置字体大小
    CGSize maximumLabelSizeOne = CGSizeMake([UIScreen mainScreen].bounds.size.width*0.4,MAXFLOAT);
    CGSize textSize=[titleStr boundingRectWithSize:maximumLabelSizeOne options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:fontOne} context:nil].size;
    return textSize;
}


@end
