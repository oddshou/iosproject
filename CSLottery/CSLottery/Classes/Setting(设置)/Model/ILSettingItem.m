//
//  ILSettingItem.m
//  CSLottery
//
//  Created by niuwan on 15/5/5.
//  Copyright (c) 2015年 niuwan. All rights reserved.
//

#import "ILSettingItem.h"

@implementation ILSettingItem

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title
{
    ILSettingItem *item = [[self alloc] init];
    item.icon = icon;
    item.title = title;
    
    return item;
}

@end
