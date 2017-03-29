//
//  OrderHeaderView.m
//  SuperGuy
//
//  Created by xh on 17/2/9.
//  Copyright © 2017年 admin. All rights reserved.
//


#import "Masonry.h"
#import "OrderHeaderView.h"

@interface OrderHeaderView()

@property(strong,nonatomic)UIImageView *marketImageView;

@property(strong,nonatomic)UILabel *marketNameLable;

@end


static NSString *headIdentifier = @"OrderHeaderView";


@implementation OrderHeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


+ (instancetype)orderHeaderViewTableView:(UITableView *)tableView{
    
 
    OrderHeaderView *headView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headIdentifier];
    
    if (!headView) {
        
        headView =[[OrderHeaderView alloc]initWithReuseIdentifier:headIdentifier];
    
        [headView.contentView setBackgroundColor:[UIColor whiteColor]];
        
        UIView *whiteView=[[UIView alloc]init];
        [whiteView  setBackgroundColor:[UIColor whiteColor]];
        [headView setBackgroundView:whiteView];
        
        UIView *line=[[UIView alloc]initWithFrame:CGRectMake(30+10, KHeaderViewHight-0.5, [[UIScreen mainScreen] bounds].size.width-30-10-35,0.5)];
        line.backgroundColor=[UIColor lightGrayColor];
        [headView.contentView addSubview:line];
        
        [headView addSubviews];
    }
    
    return headView;
}


-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    
    if (self) {
        UITapGestureRecognizer *tapGR=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(didSeletedTapGRheadView:)];
        [self addGestureRecognizer:tapGR];
        
        self.userInteractionEnabled=YES;
    }
    return self;
}

-(void)didSeletedTapGRheadView:(UITapGestureRecognizer *)tapGR{
    
    if (self.selectedHeadView) {
        self.selectedHeadView(self);
    }
}



-(void)addSubviews{
    
    UIImageView *marketImageView=[[UIImageView alloc]init];
    [marketImageView setBackgroundColor:[UIColor whiteColor]];
    [self.contentView addSubview:marketImageView];
    self.marketImageView=marketImageView;
    [marketImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@23);
        make.height.equalTo(@26);
        make.top.equalTo(self.contentView.mas_top).offset(5);
        make.left.equalTo(self.contentView).offset(30);
    }];
    
    
    UILabel *marketName=[[UILabel alloc]init];
    [marketName setFont:[UIFont systemFontOfSize:13]];
    [marketName setTextColor:[UIColor blackColor]];
    [self.contentView addSubview:marketName];
    self.marketNameLable=marketName;
    [marketName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@15);
        make.bottom.equalTo(marketImageView.mas_bottom).offset(2);
        make.left.equalTo(marketImageView.mas_right).offset(2);
    }];
    
    
    UIButton *btnArrow=[[UIButton alloc]init];
    [btnArrow setImage:[UIImage imageNamed:@"ic_turnright"] forState:UIControlStateNormal];
    [self.contentView addSubview:btnArrow];
    [btnArrow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@12);
        make.width.equalTo(@8);
        make.left.equalTo(marketName.mas_right).offset(5);
        make.centerY.equalTo(marketName.mas_centerY);
    }];
    
}


-(void)setOrderModel:(OderModel *)orderModel{
    
    if (orderModel) {
          _orderModel=orderModel;
   
        [self.marketImageView setImage:[UIImage imageNamed:orderModel.marketImage]];
        [self.marketNameLable setText:orderModel.marketName];
    }
  
    
}


@end
