//
//  OderModel.h
//  SuperGuy
//
//  Created by xh on 17/2/9.
//  Copyright © 2017年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OderModel : NSObject

@property (nonatomic, copy) NSString *marketImage;//超市图片

@property (nonatomic, copy) NSString *marketName;//超市名字

@end


@interface OderDetailModel : NSObject

@property (nonatomic, copy) NSString *orderID;//订单编号

@property (nonatomic, copy) NSString *orderState;//订单状态

@property (nonatomic, strong) NSArray *orderSubNames;//订单购买的详细的商品

@end
