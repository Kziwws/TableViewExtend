//
//  AllOrdersViewController.m

//  Kziwws QQ:1197696574 有问题的可以联系我

//  Created by xh on 17/2/9.
//  Copyright © 2017年 admin. All rights reserved.
//
#define RGBA(r, g, b, a)                    [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define kScreenW  [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height
#define KWeakSelf(type)  __weak typeof(type) weak##type = type;
#define KStrongSelf(type)  __strong typeof(type) type = weak##type;



#import "OrderHeaderView.h"
#import "KziwwsTextIndicatorView.h"
#import "OrderDetailTableViewCell.h"
#import "AllOrderViewController.h"

@interface AllOrderViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *myTableView;

@property (nonatomic, strong) NSMutableDictionary *cellsDic;

@property(strong,nonatomic)NSMutableArray <OderModel *>*headDataArray;

@property(strong,nonatomic)NSMutableArray <OderDetailModel *>*cellDataArray;


@end

@implementation AllOrderViewController

-(NSMutableDictionary *)cellsDic{
    if (!_cellsDic) {
        _cellsDic = [NSMutableDictionary dictionary];
    }
    return _cellsDic;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //  这个里面 感觉没有多少技术上的东西  所有基本没有写代码注释 大神的话绕道Kziwws QQ:1197696574 有问题的可以联系我
    
    
    self.title =@"全部订单";
    self.edgesForExtendedLayout=UIRectEdgeNone;
    self.view.backgroundColor = RGBA(235,235,235,1);

    NSDictionary *att=@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:20]};
    
    [self.navigationController.navigationBar setTitleTextAttributes:att];
    self.navigationController.navigationBar.barTintColor = RGBA(20,160,117,1);
    
    UIBarButtonItem *rightHub=[[UIBarButtonItem alloc]initWithTitle:@"灰度HUD" style:UIBarButtonItemStylePlain target:self action:@selector(kziwwsHudShow)];
    [rightHub setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:15]} forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem=rightHub;
    
    
    UIBarButtonItem *leftHub=[[UIBarButtonItem alloc]initWithTitle:@"常态HUD" style:UIBarButtonItemStylePlain target:self action:@selector(kziwwsHudShowNormal)];
    [leftHub setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:15]} forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem=leftHub;
    
    
    self.headDataArray=[NSMutableArray array];
    OderModel *oderModel1=[[OderModel alloc]init];
    oderModel1.marketImage=[self getImageNameRandomNumber];
    oderModel1.marketName=@"不一样超市1";
    [self.headDataArray addObject:oderModel1];
    
    OderModel *oderModel2=[[OderModel alloc]init];
    oderModel2.marketImage=[self getImageNameRandomNumber];
    oderModel2.marketName=@"不一样超市2";
    [self.headDataArray addObject:oderModel2];

    OderModel *oderModel3=[[OderModel alloc]init];
    oderModel3.marketImage=[self getImageNameRandomNumber];
    oderModel3.marketName=@"不一样超市3";
    [self.headDataArray addObject:oderModel3];
    
    self.cellDataArray=[NSMutableArray array];
    OderDetailModel *oderDetailModel1=[[OderDetailModel alloc]init];
    oderDetailModel1.orderID=@"单号10057790 (2016-10-12) 21:13";
    oderDetailModel1.orderState=@"已接单";
    oderDetailModel1.orderSubNames=@[@"康师傅桶面",@"泉阳矿泉水",@"泉阳矿泉水1",@"泉阳矿泉水2",@"泉阳矿泉水3"];
    [self.cellDataArray addObject:oderDetailModel1];
    
    OderDetailModel *oderDetailModel2=[[OderDetailModel alloc]init];
    oderDetailModel2.orderID=@"单号10057790 (2016-10-12) 20:13";
    oderDetailModel2.orderState=@"已接单";
    oderDetailModel2.orderSubNames=@[@"康师傅桶面"];
    [self.cellDataArray addObject:oderDetailModel2];
    
    OderDetailModel *oderDetailModel3=[[OderDetailModel alloc]init];
    oderDetailModel3.orderID=@"单号10057790 (2016-10-12) 23:13";
    oderDetailModel3.orderState=@"已接单";
    oderDetailModel3.orderSubNames=@[@"康师傅桶面",@"泉阳矿泉水",@"康师傅桶面",@"泉阳矿泉水",@"康师傅桶面",@"泉阳矿泉水",@"康师傅桶面",@"泉阳矿泉水"];
    [self.cellDataArray addObject:oderDetailModel3];
    
    
    UITableView *myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH-64)];
    myTableView.sectionHeaderHeight=KHeaderViewHight;
    myTableView.delegate = self;
    myTableView.dataSource = self;
    myTableView.separatorStyle = UITableViewCellSelectionStyleNone;
    self.myTableView  = myTableView;
    myTableView.backgroundColor =[UIColor whiteColor];
    [self.view addSubview:myTableView];
    
    
    // Do any additional setup after loading the view.
}




#pragma mark - UITableviewDelagete,UITableViewDateSouce

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return  self.headDataArray.count;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.cellDataArray.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    OrderDetailTableViewCell  *cell = [self cellAtCellDicWithIndexPath:indexPath];
    
    float cellHight=cell?(cell.isExpand?cell.cellHight.selectedHight:cell.cellHight.normalHight):cell.cellHight.normalHight;
    
    return cellHight;
  
    /*if (!cell) {
        return cell.cellHight.normalHight;//110
    }else{
        return cell.isExpand?cell.cellHight.selectedHight:cell.cellHight.normalHight;
    }*/
  
}



- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    OrderHeaderView *headView = [OrderHeaderView orderHeaderViewTableView:tableView];
    headView.selectedHeadView=^(OrderHeaderView *selfheadView){

        NSLog(@"点击了头部的视图的:%@",selfheadView.orderModel.marketName);
    };
    headView.orderModel = _headDataArray[section];
    return headView;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellID = [NSString stringWithFormat:@"section:%zi row:%zi",indexPath.section,indexPath.row];
    
    OrderDetailTableViewCell  *cell = [self cellAtCellDicWithIndexPath:indexPath];
    
    if (!cell) {
        cell = [OrderDetailTableViewCell OrderDetailTableViewCellWithTableView:tableView reusableIdentifier:cellID];
        if (self.cellDataArray) {
            cell.oderDetailModel=self.cellDataArray[indexPath.row];
            
            [self.cellsDic setObject:cell forKey:cellID];
        }
        
        KWeakSelf(self);
        cell.onClikButtonIsExpandActionActionBlock=^(BOOL isExpand,UIButton *sender,OrderDetailTableViewCell *blockCell){
           /*----------------------------------*/ //有缓慢下拉的效果
            NSIndexSet *indexSet=[NSIndexSet indexSetWithIndex:indexPath.section];
            [weakself.myTableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationNone];
            
            [weakself.myTableView  beginUpdates];
            [blockCell setNeedsUpdateConstraints];
            [weakself.myTableView  endUpdates];
            
           /*----------------------------------*/ //直接刷新
            //[weakself.myTableView reloadData];

        };
       
    }
  //https://github.com/Kziwws/TableViewExtend.git
    
    return cell;

}



//设置headerInsectionView不悬浮UITableView的Style为Plain时，当tableView上移顶端的tableHeaderView会跟着滑出窗口，而headerInsectionView则会悬浮固定在窗口顶端不随着滑动继续上移。UITableView的Style为Grouped时，当tableView上移顶端的tableHeaderView会跟着滑出窗口，而headerInsectionView则会随着滑动继续上移。

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat sectionHeaderHeight = 50;
    if(scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0,0);
    } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
    }
}


- (OrderDetailTableViewCell * )cellAtCellDicWithIndexPath:(NSIndexPath *)indexPath{
    
    NSString * cellID = [NSString stringWithFormat:@"section:%zi row:%zi",indexPath.section,indexPath.row];
    
    return [self.cellsDic objectForKey:cellID];
}


-(void)kziwwsHudShow{
    
    [KziwwsTextIndicatorView showTextIndicatorViewMessage:@"这是Kziwws HUD,一个善良有梦想安静的程序员" afterDelay:0.5 isMaskGray:YES];
}
-(void)kziwwsHudShowNormal{
    
    [KziwwsTextIndicatorView showTextIndicatorViewMessage:@"这是Kziwws HUD,一个善良有梦想安静的程序员" afterDelay:0.5 isMaskGray:NO];
}


-(NSString *)getImageNameRandomNumber{

    int y =549100 +  arc4random() % 10;
    
    return  [NSString stringWithFormat:@"%d",y];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
