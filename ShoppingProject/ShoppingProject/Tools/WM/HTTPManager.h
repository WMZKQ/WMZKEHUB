//
//  HTTPManager.h
//  ShoppingProject
//
//  Created by Mac on 16/7/4.
//  Copyright © 2016年 lyq. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^singleDataBlock)(NSArray*dataArray);

@interface HTTPManager : NSObject
/**
 *  明星衣橱界面，topScrollView ImageData
 */
+(void)getMXYCCellInfoForTopScrollWithBlock:(singleDataBlock)completeBlock;
/**
 *  明星衣橱界面，限时限价购数据请求
 */
+(void)getMXYCCellInfoForLimitBuyWithBlock:(singleDataBlock)completeBlock;


@end
