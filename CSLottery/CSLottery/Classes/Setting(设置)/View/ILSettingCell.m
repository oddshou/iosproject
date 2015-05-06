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
#import "ILSettingLabelItem.h"


@interface ILSettingCell ()

@property (nonatomic, strong) UIImageView *imgView;
@property (nonatomic, strong) UISwitch *switchView;
@property (nonatomic, strong) UILabel *labelView;

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

- (UILabel *)labelView
{
    if(_labelView == nil){
        _labelView = [[UILabel alloc] init];
        _labelView.bounds = CGRectMake(0, 0, 100, 44);
        _labelView.textColor = [UIColor redColor];
        _labelView.textAlignment = NSTextAlignmentRight;
    }
    return _labelView;
}

- (void)setItem:(ILSettingItem *)item
{
    _item = item;
    //设置cell的子控件基本数据
    self.imageView.image = [UIImage imageNamed:_item.icon];
    self.textLabel.text = _item.title;

    [self setUpAccessoryView];
    
}
#pragma mark 设置右侧图标为进入或者switch
- (void)setUpAccessoryView
{
    if([_item isKindOfClass:[ILSettingArrowItem class]]){   //箭头
        self.accessoryView = self.imgView;
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
    }else if ([_item isKindOfClass:[ILSettingSwitchItem class]]){ //switch
        self.accessoryView = self.switchView;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }else if([_item isKindOfClass:[ILSettingLabelItem class]]){ //label
        self.accessoryView = self.labelView;
        ILSettingLabelItem *labelItem = (ILSettingLabelItem *)_item;
        self.labelView.text = labelItem.text;
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
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
