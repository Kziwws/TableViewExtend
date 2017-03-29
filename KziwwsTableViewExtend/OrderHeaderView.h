//
//  OrderHeaderView.h
//  SuperGuy
//
//  Created by xh on 17/2/9.
//  Copyright © 2017年 admin. All rights reserved.
//

#define KHeaderViewHight 38

#import "OderModel.h"
#import <UIKit/UIKit.h>


@interface OrderHeaderView : UITableViewHeaderFooterView

+ (instancetype)orderHeaderViewTableView:(UITableView *)tableView;

@property(strong,nonatomic)OderModel *orderModel;//订单数据模型

@property(copy,nonatomic)void(^selectedHeadView)(OrderHeaderView *headerView);//HeadView

@end

