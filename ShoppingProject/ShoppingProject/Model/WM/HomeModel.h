//
//  HomeModel.h
//  ShoppingProject
//
//  Created by Mac on 16/7/4.
//  Copyright © 2016年 lyq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeModel : NSObject

@property (nonatomic , copy) NSString*end_time;
@property (nonatomic , copy) NSString*start_time;
@property (nonatomic , copy) NSString*activity_time;
@property (nonatomic , copy) NSString*img_index;

-(instancetype)initWithDic:(NSDictionary*)dic;
+(instancetype)modelWithDic:(NSDictionary*)dic;

@end
