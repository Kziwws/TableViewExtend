//
//  OrderDetailTableViewCell.h
//  SuperGuy
//
//  Created by xh on 17/2/9.
//  Copyright © 2017年 admin. All rights reserved.
//

@class CellHightModel;
#import "OderModel.h"
#import <UIKit/UIKit.h>


@interface OrderDetailTableViewCell : UITableViewCell

+ (OrderDetailTableViewCell *)OrderDetailTableViewCellWithTableView:(UITableView *)tableView reusableIdentifier:(NSString *)reusableIdentifier;


@property(strong,nonatomic)OderDetailModel *oderDetailModel;//订单详细模型


//展开和点击按钮的操作 isExpand为YES 的时候是扩展按钮
@property(copy,nonatomic)void(^onClikButtonIsExpandActionActionBlock)(BOOL isExpand,UIButton *sender,OrderDetailTableViewCell *cell);


@property(assign,nonatomic)BOOL isExpand;//展开状态


@property(strong,nonatomic)CellHightModel *cellHight;//自身的高度

@end



@interface CellHightModel : NSObject

@property(nonatomic,assign)CGFloat normalHight;//开始进去的高度

@property(nonatomic,assign)CGFloat selectedHight;//扩展开的高度
@end