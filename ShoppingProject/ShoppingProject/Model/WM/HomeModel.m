//
//  HomeModel.m
//  ShoppingProject
//
//  Created by Mac on 16/7/4.
//  Copyright © 2016年 lyq. All rights reserved.
//

#import "HomeModel.h"

@implementation HomeModel

-(instancetype)initWithDic:(NSDictionary*)dic{
    if (self=[super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
+(instancetype)modelWithDic:(NSDictionary*)dic{
    return [[self alloc]initWithDic:dic];
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

-(NSString*)description{
    return [NSString stringWithFormat:@"%@~~%@~~~%@~~~%@",_img_index,_start_time,_end_time,_activity_time];
}
@end
