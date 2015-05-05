//
//  ILSettingCell.m
//  CSLottery
//
//  Created by niuwan on 15/5/5.
//  Copyright (c) 2015年 niuwan. All rights reserved.
//

#import "ILSettingCell.h"
#import "ILSettingItem.h"
#import "ILSettingArrowItem.h"
#import "ILSettingSwitchItem.h"


@interface ILSettingCell ()

@property (nonatomic, strong) UIImageView *imgView;
@property (nonatomic, strong) UISwitch *switchView;

@end

@implementation ILSettingCell

- (UIImageView *)imgView
{
    if (_imgView == nil) {
        _imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CellArrow"]];
    }
    return _imgView;
}

- (UISwitch *)switchView
{
    if (_switchView == nil) {
        
        _switchView = [[UISwitch alloc] init];
    }
    return _switchView;
}

- (void)setItem:(ILSettingItem *)item
{
    _item = item;
    //设置cell的子控件基本数据
    self.imageView.image = [UIImage imageNamed:_item.icon];
    self.textLabel.text = _item.title;

    
    
}
#pragma mark 设置右侧图标为进入或者switch
- (void)setUpAccessoryView
{
    if([_item isKindOfClass:[ILSettingArrowItem class]]){   //箭头
        self.accessoryView = self.imageView;
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
    }else if ([_item isKindOfClass:[ILSettingSwitchItem class]]){ //switch
        self.accessoryView = self.switchView;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }else{
        self.accessoryView = nil;
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
    }
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
