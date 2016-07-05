//
//  HTTPManager.m
//  ShoppingProject
//
//  Created by Mac on 16/7/4.
//  Copyright © 2016年 lyq. All rights reserved.
//

#import "HTTPManager.h"



@implementation HTTPManager

+(void)getMXYCCellInfoForTopScrollWithBlock:(singleDataBlock)completeBlock{
    AFHTTPSessionManager*manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", nil];
    [manager GET:@"http://api-v2.mall.hichao.com/mall/banner?gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=5E24C270-34A0-4988-881E-8026BFB44BAD&gs=640x1136&gos=9.3.2&access_token=" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

        if (responseObject) {
            NSDictionary*dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            
            if (dic) {
                
                NSArray *itemArray=dic[@"data"][@"items"];
                
                NSMutableArray* resultArray = @[].mutableCopy;
                for (NSDictionary * tempDic in itemArray) {
                    
                    [resultArray addObject: tempDic[@"component"][@"picUrl"]];
                    
                }
                if (completeBlock) {
                    completeBlock(resultArray);
                }
            }
        }
       
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"~~~~~~>>%@",error.localizedDescription);
        if (completeBlock) {
            completeBlock(nil);
        }
    }];
}

+(void)getMXYCCellInfoForLimitBuyWithBlock:(singleDataBlock)completeBlock{
    AFHTTPSessionManager*manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html", nil];
    [manager GET:@"http://api-v2.mall.hichao.com/active/flash/list?gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=5E24C270-34A0-4988-881E-8026BFB44BAD&gs=640x1136&gos=9.3.2&access_token=" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (responseObject) {
            NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            if (dic) {
//                NSLog(@"%@",dic);
                NSArray*itemsArray = dic[@"response"][@"data"][@"items"];
                NSLog(@"%@",itemsArray);
                NSMutableArray*resultArray = @[].mutableCopy;
                for (NSDictionary*tempDic in itemsArray) {
                    NSDictionary*componentDic = tempDic[@"component"];
                    HomeModel*model = [HomeModel modelWithDic:componentDic];
                    NSLog(@"%@",model);
                    [resultArray addObject:model];
                }
                if (completeBlock) {
                    completeBlock(resultArray);
                }
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"~~%@",error.localizedDescription);
        if (completeBlock) {
            completeBlock(nil);
        }
    }];
}

@end
