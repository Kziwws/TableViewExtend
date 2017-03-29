//
//  OrderDetailTableViewCell.m
//  SuperGuy
//
//  Created by xh on 17/2/9.
//  Copyright © 2017年 admin. All rights reserved.
//

#define RGB(r, g, b)                    [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1]

#import "Masonry.h"
#import "OrderDetailTableViewCell.h"

@interface OrderDetailTableViewCell()

@property (strong,nonatomic)UILabel *orderLable;

@property (strong,nonatomic)UIButton *buttonAorrw;

@property (strong,nonatomic)UILabel *orderPayLable;


@property(strong,nonatomic)NSMutableArray *listLableArray;
@end

@implementation OrderDetailTableViewCell

-(NSMutableArray *)listLableArray{
    if (!_listLableArray) {
        _listLableArray=[NSMutableArray array];
    }
    return _listLableArray;
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


+ (OrderDetailTableViewCell *)OrderDetailTableViewCellWithTableView:(UITableView *)tableView reusableIdentifier:(NSString *)reusableIdentifier{
    OrderDetailTableViewCell *cell= [tableView dequeueReusableCellWithIdentifier:reusableIdentifier];
    if (!cell) {
        cell=[[OrderDetailTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reusableIdentifier];
        cell.layer.masksToBounds=YES;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}




- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self loadSubViews];
    }
    return self;
}

-(void)loadSubViews{
    
    //订单编号
    UILabel *orderLable=[[UILabel alloc]init];
    [orderLable setTextColor:[UIColor blackColor]];
    [orderLable setFont:[UIFont systemFontOfSize:12]];
    self.orderLable=orderLable;
    [self.contentView addSubview:orderLable];
    [orderLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@15);
        make.top.equalTo(self.contentView.mas_top).offset(3);
        make.left.equalTo(self.contentView).offset(50);
    }];
    
    
    UIButton *buttonAorrw=[[UIButton alloc]init];
    [buttonAorrw setTitle:@"已接单" forState:UIControlStateNormal];
    [buttonAorrw setTitleColor:RGB(239,159,188) forState:UIControlStateNormal];
    [buttonAorrw.titleLabel setFont:[UIFont systemFontOfSize:12]];
    [self.contentView addSubview:buttonAorrw];
    [buttonAorrw setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
    self.buttonAorrw=buttonAorrw;
    
    [buttonAorrw mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@15);
        make.top.equalTo(self.contentView.mas_top).offset(3);
        make.width.equalTo(@60);
        make.right.equalTo(self.contentView).offset(-36);
    }];
    
    
    UIButton *mjButton=[[UIButton alloc]init];
    [mjButton setTitle:@"再来一单" forState:UIControlStateNormal];
    [mjButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [mjButton.titleLabel setFont:[UIFont systemFontOfSize:8]];
    mjButton.layer.cornerRadius=3;
    mjButton.layer.borderColor=RGB(20,160,117).CGColor;
     mjButton.layer.borderWidth=0.5;
    [self.contentView addSubview:mjButton];
    [mjButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@15);
        make.bottom.equalTo(self.contentView).offset(-2);
        make.width.equalTo(@45);
        make.right.equalTo(self.buttonAorrw);
    }];

    UIButton *lxButton=[[UIButton alloc]init];
    [lxButton setTitle:@"联系卖家" forState:UIControlStateNormal];
    [lxButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [lxButton.titleLabel setFont:[UIFont systemFontOfSize:8]];
    lxButton.layer.cornerRadius=3;
    lxButton.layer.borderColor=RGB(20,160,117).CGColor;
    lxButton.layer.borderWidth=0.51;
    
    
    [self.contentView addSubview:lxButton];
    [lxButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@15);
        make.width.equalTo(@45);
        make.centerY.equalTo(mjButton.mas_centerY);
        make.right.equalTo(mjButton.mas_left).offset(-10);
    }];
    
    
    UILabel *orderPayLable=[[UILabel alloc]init];
    [orderPayLable setTextColor:[UIColor lightGrayColor]];
    [orderPayLable setFont:[UIFont systemFontOfSize:12]];
    [orderPayLable setText:@"共计商品6件,实付￥50"];
    [self.contentView addSubview:orderPayLable];
    self.orderPayLable=orderPayLable;
    [orderPayLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@20);
        make.bottom.equalTo(mjButton.mas_top).offset(-10);
        make.right.equalTo(self.buttonAorrw);
    }];
    
    
    self.isExpand=NO;
    UIButton *expandButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [expandButton setTitle:@"详情" forState:UIControlStateNormal];
    [expandButton setTitle:@"详情" forState:UIControlStateSelected];
    
    [expandButton setImage:[UIImage imageNamed:@"iocn_shape_dwon"] forState:UIControlStateNormal];
    [expandButton setImage:[UIImage imageNamed:@"iocn_shape_up"] forState:UIControlStateSelected];
    expandButton.selected=_isExpand;
    [expandButton setTitleColor:RGB(35, 91, 111) forState:UIControlStateNormal];
    [expandButton.titleLabel setFont:[UIFont systemFontOfSize:12]];
    [expandButton setImageEdgeInsets:UIEdgeInsetsMake(5, 10, -10, 0)];
    [expandButton setTitleEdgeInsets:UIEdgeInsetsMake(-5, -10, 10, 0)];
    [expandButton addTarget:self action:@selector(onClikDetailExpandButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:expandButton];
    [expandButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@40);
        make.height.equalTo(@30);
        make.left.equalTo(self.contentView).offset(50);
        make.centerY.equalTo(orderPayLable.mas_centerY);
    }];
    self.cellHight=[[CellHightModel alloc]init];
    self.cellHight.normalHight=110;
    
}


-(void)onClikDetailExpandButtonAction:(UIButton *)sender{
    
    self.isExpand=!self.isExpand;
    
    sender.selected=_isExpand;
    
    if (_isExpand) {

        self.cellHight.selectedHight=15+3+3+_oderDetailModel.orderSubNames.count*(15+3+3)+50;
        [self.listLableArray makeObjectsPerformSelector:@selector(removeFromSuperview)];
        [self setOderDetailModel:_oderDetailModel];
        
    }else{
        
        self.cellHight.normalHight=110;
        [self.listLableArray makeObjectsPerformSelector:@selector(removeFromSuperview)];
         [self setOderDetailModel:_oderDetailModel];
    }
    
    if (self.onClikButtonIsExpandActionActionBlock) {
        self.onClikButtonIsExpandActionActionBlock(_isExpand,sender,self);
    }
}


-(void)setOderDetailModel:(OderDetailModel *)oderDetailModel{
    
    if (oderDetailModel) {
        _oderDetailModel=oderDetailModel;
        
        [self.orderLable setText:oderDetailModel.orderID];
    
        __block UILabel *tempGoodLable=self.orderLable;
        
        NSArray *modelList=[[NSArray alloc]init];
        
        if (self.isExpand) {
            modelList=oderDetailModel.orderSubNames;
            self.cellHight.selectedHight=15+3+3+_oderDetailModel.orderSubNames.count*(15+3+3)+50;
        }else{
            if (oderDetailModel.orderSubNames.count>=2) {
                modelList=[oderDetailModel.orderSubNames subarrayWithRange:NSMakeRange(0, 2)];
            }else{
                modelList=[oderDetailModel.orderSubNames subarrayWithRange:NSMakeRange(0, oderDetailModel.orderSubNames.count)];
            }
            
            self.cellHight.normalHight=110;
        }
        
        if (oderDetailModel.orderSubNames.count!=0) {
            
            //动态添加购买商品
            [modelList enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {

                UILabel *goodLable=[[UILabel alloc]init];
                [goodLable setTextColor:RGB(20, 160, 117)];
           
                [goodLable setFont:[UIFont systemFontOfSize:12]];
                [self.contentView addSubview:goodLable];
                [goodLable setText:obj];
                
                [goodLable mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.height.equalTo(@15);
                    make.top.equalTo(tempGoodLable.mas_bottom).offset(3);
                    make.left.equalTo(self.contentView).offset(50);
                }];
                tempGoodLable=goodLable;
                
                
                
                UILabel *goodLableName=[[UILabel alloc]init];
                [goodLableName setTextColor:[UIColor lightGrayColor]];
                [goodLableName setFont:[UIFont systemFontOfSize:12]];
                [self.contentView addSubview:goodLableName];
                [goodLableName setText:@"x3"];
                [goodLableName mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.height.equalTo(@15);
                    make.centerY.equalTo(tempGoodLable.mas_centerY);
                    make.right.equalTo( self.buttonAorrw.mas_right);
                }];
                
                [self.listLableArray addObject:goodLable];
                [self.listLableArray addObject:goodLableName];
                
            
            }];
        }
    }
}



@end


@implementation CellHightModel



@end
