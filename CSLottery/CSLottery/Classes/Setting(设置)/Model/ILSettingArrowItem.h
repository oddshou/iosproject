//
//  ILSettingArrowItem.h
//  CSLottery
//
//  Created by niuwan on 15/5/5.
//  Copyright (c) 2015年 niuwan. All rights reserved.
//

#import "ILSettingItem.h"

@interface ILSettingArrowItem : ILSettingItem

//调用控制器的类名
@property (nonatomic, assign) Class destVcClass;

//@property (nonatomic, copy) NSString *destVcName;

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title destVcClass:(Class)destVcClass;

@end
