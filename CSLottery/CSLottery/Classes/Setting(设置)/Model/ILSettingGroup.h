//
//  ILSettingGroup.h
//  CSLottery
//
//  Created by niuwan on 15/5/5.
//  Copyright (c) 2015年 niuwan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ILSettingGroup : NSObject

@property (nonatomic, copy) NSString *header;
@property (nonatomic, strong) NSArray *items;
@property (nonatomic, copy) NSString *footer;

@end
