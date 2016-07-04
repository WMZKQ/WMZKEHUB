//
//  MingXingYiChuVC.m
//  ShoppingProject
//
//  Created by Mac on 16/7/3.
//  Copyright © 2016年 lyq. All rights reserved.
//

#import "MingXingYiChuVC.h"

@interface MingXingYiChuVC ()

@end

@implementation MingXingYiChuVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //修饰导航条
    [self createTitleText];
}

-(void)createTitleText{
    
    UITextField * searchText = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, 200, 30)];
    searchText.placeholder = @"🔍单品/品牌/红人";
    searchText.borderStyle = UITextBorderStyleRoundedRect;
    self.navigationItem.titleView = searchText;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(leftClick:)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(rightClick:)];
}

-(void)leftClick:(UIButton*)sender{
    
}

-(void)rightClick:(UIButton*)sender{
    
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
