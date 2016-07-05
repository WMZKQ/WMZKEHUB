//
//  MingXingYiChuVC.m
//  ShoppingProject
//
//  Created by Mac on 16/7/3.
//  Copyright © 2016年 lyq. All rights reserved.
//

#import "MingXingYiChuVC.h"
#import "MXYCSearchVC.h"
#import "ZZCarouselControl.h"

typedef enum : NSUInteger {
    limitBuyTAGLeft = 1000,
    limitBuyTAGRight,
} limitBuyTAG;

@interface MingXingYiChuVC ()<ZZCarouselDataSource,ZZCarouselDelegate>{
    UIScrollView*_bgScroll;
    ZZCarouselControl*_topScroll;
}

@property (nonatomic , strong) NSMutableArray*topScrollArray;


@end

@implementation MingXingYiChuVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //修饰导航条
    [self createNavigationTitle];
    
    NSLog(@"%@",NSHomeDirectory());
    //创建tableVIew
    [self createViews];
}

-(void)createNavigationTitle{
    
    UITextField * searchText = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, 200, 30)];
    searchText.placeholder = @"🔍单品/品牌/红人";
    searchText.borderStyle = UITextBorderStyleRoundedRect;
    self.navigationItem.titleView = searchText;
    [searchText addTarget:self action:@selector(goToSearchVC:) forControlEvents:UIControlEventEditingDidBegin];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(leftClick:)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(rightClick:)];
    
}
//导航text点击事件
-(void)goToSearchVC:(UITextField*)sender{
    [self.navigationController pushViewController:[MXYCSearchVC new] animated:YES];
}

//导航left，rightButton点击事件
-(void)leftClick:(UIButton*)sender{
    
}

-(void)rightClick:(UIButton*)sender{
    
}

//勾勒视图框架
-(void)createViews{
    //创建BGScrollView
    [self createBGScrollView];
   //创建页面TopScrollVIew
    [self createTopScrollView];
    //限价限时购
    [self createLimitBuyView];
   
}

-(void)createBGScrollView{
    UIScrollView*scroll = [[UIScrollView alloc]initWithFrame:kScreenBounds];
    scroll.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:scroll];
    _bgScroll = scroll;
    _bgScroll.contentSize = CGSizeMake(0, 3000);
}

-(void)createTopScrollView{
    self.topScrollArray = @[].mutableCopy;
    [HTTPManager getMXYCCellInfoForTopScrollWithBlock:^(NSArray *dataArray) {
        [_topScrollArray addObjectsFromArray:dataArray];
        ZZCarouselControl*topScroll = [[ZZCarouselControl alloc]initWithFrame:CGRectMake(0, 0, kWIDTH, kHEIGHT/3+50)];
        [_bgScroll addSubview:topScroll];
        topScroll.sd_layout.topEqualToView(_bgScroll).leftEqualToView(_bgScroll).rightEqualToView(_bgScroll).heightIs(350);
        topScroll.carouseScrollTimeInterval = 3.0f;
        topScroll.dataSource = self;
        topScroll.delegate = self;
        [topScroll reloadData];
        _topScroll = topScroll;
    }];
}
#pragma mark---无限轮播dataSource---
-(NSArray*)zzcarousel:(ZZCarouselControl *)carouselView{
    return _topScrollArray;
}

-(UIView*)zzcarousel:(ZZCarouselControl *)carouselView carouselFrame:(CGRect)frame data:(NSArray *)data viewForItemAtIndex:(NSInteger)index{
    UIView*view = [[UIView alloc]initWithFrame:frame];
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    [imageView sd_setImageWithURL:[NSURL URLWithString:[data objectAtIndex:index]]];
    [view addSubview:imageView];
    return view;
}

#pragma mark---无限轮播delegate---
-(void)zzcarouselView:(ZZCarouselControl *)zzcarouselView didSelectItemAtIndex:(NSInteger)index{
    NSLog(@"点击了%ld",index);
}

#pragma mark---create限价限时购View---
-(void)createLimitBuyView{
    [HTTPManager getMXYCCellInfoForLimitBuyWithBlock:^(NSArray *dataArray) {
        CGFloat itemWidth = (kWIDTH-10*3)/2;
        for (NSInteger i =0 ; i<2; i++) {
            UIButton*button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(10+i*(10+itemWidth), kHEIGHT/3+50+10, itemWidth, kHEIGHT/5*2);
            button.layer.cornerRadius=10;
            button.layer.masksToBounds = YES;
            [button sd_setBackgroundImageWithURL:[NSURL URLWithString:[dataArray[i] img_index]] forState:UIControlStateNormal];
            [_bgScroll addSubview:button];
            [button addTarget:self action:@selector(limitBuyLink:) forControlEvents:UIControlEventTouchUpInside];
            button.tag=limitBuyTAGLeft+i;
        }
        [self createCountryTableView];
    }];
}

-(void)limitBuyLink:(UIButton*)sender{
    
}

-(void)createCountryTableView{
    
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
