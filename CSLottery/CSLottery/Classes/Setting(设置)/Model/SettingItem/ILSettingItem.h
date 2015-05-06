//
//  ILSettingItem.h
//  CSLottery
//
//  Created by niuwan on 15/5/5.
//  Copyright (c) 2015年 niuwan. All rights reserved.
//

#import <Foundation/Foundation.h>

//定义一个block类型，用于点击item是调用
typedef void(^ILSettingItemOption)();

@interface ILSettingItem : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *icon;

@property (nonatomic, copy) ILSettingItemOption option;


+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title;

@end
