//
//  ILSettingCell.h
//  CSLottery
//
//  Created by niuwan on 15/5/5.
//  Copyright (c) 2015年 niuwan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ILSettingItem;

@interface ILSettingCell : UITableViewCell

@property (nonatomic, strong) ILSettingItem *item;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
