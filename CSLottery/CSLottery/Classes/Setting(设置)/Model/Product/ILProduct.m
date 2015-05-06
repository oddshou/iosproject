//
//  ILProduct.m
//  CSLottery
//
//  Created by niuwan on 15/5/6.
//  Copyright (c) 2015年 niuwan. All rights reserved.
//

#import "ILProduct.h"

@implementation ILProduct

+ (instancetype)productWithDict:(NSDictionary *)dict
{
    ILProduct *product = [[ILProduct alloc] init];
    product.title = dict[@"title"];
    product.icon = dict[@"icon"];
    product.url = dict[@"url"];
    product.customUrl = dict[@"customUrl"];
    product.ID = dict[@"id"];
    
    return product;
}

//为了截掉json解析出的icon名称后缀
//- (void)setIcon:(NSString *)icon
//{
//    _icon = [icon stringByReplacingOccurrencesOfString:@"@2x.png" withString:@""];
//}

@end
