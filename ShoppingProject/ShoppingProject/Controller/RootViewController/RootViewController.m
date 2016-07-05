//
//  RootViewController.m
//  ShoppingProject
//
//  Created by Mac on 16/7/3.
//  Copyright © 2016年 lyq. All rights reserved.
//

#import "RootViewController.h"
@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:0.9];
    UIImageView*launchImageView = [[UIImageView alloc]initWithFrame:kScreenBounds];
    launchImageView.image=[UIImage imageNamed:@"LaunchImage-700-568h.png"];
    [self.view addSubview:launchImageView];
    //一秒之后自动切换图片
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        launchImageView.image = [UIImage imageNamed:@"960-640-1.png"];
        //2.5秒之后直接跳转根视图到mainTabBar
        [self performSelector:@selector(changeRootViewController) withObject:nil afterDelay:1.5];
 
    });
    
}

//跳转根视图
-(void)changeRootViewController {
    self.view.window.rootViewController = [self createTabBarController];
}

//创建主线tabBarController
-(UITabBarController*)createTabBarController{
    UITabBarController * mainTabBar = [[UITabBarController alloc]init];
    
    NSArray * tabBarInfo = @[@"MingXingYiChuVC",@"CollocationVC",@"ComminityVC",@"NanYiBangVC",@"PaymentVC",@"首页",@"搭配",@"社交",@"男衣帮",@"购物车",@"bottom_home_icon_on.png",@"bottom_dapei_icon.png",@"bottom_comment_button.png",@"bottom_head_sort@2x.png",@"bottom_shopping_icon@2x.png"];
    
    NSMutableArray * navigationArray = @[].mutableCopy;
    
    for (NSInteger i=0; i<5; i++) {
 UINavigationController * memberNav = [self createRootNavigationControllerWith:tabBarInfo[i] Title:tabBarInfo[i+5] andImage:tabBarInfo[i+10]];
        [navigationArray addObject:memberNav];
    }
    
    mainTabBar.viewControllers=navigationArray;

    return mainTabBar;
}

//创建Navigation
-(UINavigationController*)createRootNavigationControllerWith:(NSString*)classStr Title:(NSString*)titleStr andImage:(NSString*)imageStr{
    
    UINavigationController * tempNav = [[UINavigationController alloc]initWithRootViewController:[NSClassFromString(classStr) new]];
    tempNav.tabBarItem.title = titleStr;
    tempNav.tabBarItem.image = [UIImage imageNamed:imageStr];
    
    return tempNav;
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
