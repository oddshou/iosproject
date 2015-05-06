//
//  ILSettingTableViewController.m
//  CSLottery
//
//  Created by niuwan on 15/5/4.
//  Copyright (c) 2015年 niuwan. All rights reserved.
//

#import "ILSettingTableViewController.h"

#import "ILSettingArrowItem.h"
#import "ILSettingGroup.h"
#import "ILSettingSwitchItem.h"
#import "ILTestViewController.h"
//#import "ILSettingCell.h"
#import "MBProgressHUD+MJ.h"
#import "ILProductViewController.h"
#import "ILPushNoticeController.h"


@interface ILSettingTableViewController ()

@end

@implementation ILSettingTableViewController

#pragma mark 初始化要显示的数据
- (void)viewDidLoad {
    [super viewDidLoad];
    [self addGroup];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)addGroup
{
    //0组 arrow item
    ILSettingArrowItem * pushNotice = [ILSettingArrowItem itemWithIcon:@"MorePush" title:@"推送和提醒"];
    pushNotice.destVcClass = [ILPushNoticeController class];
    
    ILSettingItem *yaoyiyao = [ILSettingSwitchItem itemWithIcon:@"handShake" title:@"摇一摇机选"];
    ILSettingItem *sound = [ILSettingSwitchItem itemWithIcon:@"sound_Effect" title:@"声音效果"];
    
    ILSettingGroup *group0 = [[ILSettingGroup alloc] init];
    group0.items = @[pushNotice, yaoyiyao, sound];
    group0.header = @"header group0";
    group0.footer = @"footer group0";
    
    //1组 settingitem
    ILSettingItem *newVersion = [ILSettingArrowItem itemWithIcon:@"MoreUpdate" title:@"检查新版本"];
    //为 newVersion 设置点击 block
    newVersion.option = ^{
        //1.显示蒙版
        [MBProgressHUD showMessage:@"正在检查。。。。"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.5 * NSEC_PER_MSEC), dispatch_get_main_queue(), ^{
            //隐藏蒙版
            [MBProgressHUD hideHUD];
            //提示用户
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"有更新版本" message:@"message" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"立即更新", nil];
            [alert show];
        });
        
    };
    
    
    ILSettingItem *help = [ILSettingArrowItem itemWithIcon:@"MoreHelp" title:@"帮助" destVcClass:[ILTestViewController class]];
    
    ILSettingItem *MoreShare = [ILSettingArrowItem itemWithIcon:@"MoreShare" title:@"分享" destVcClass:[ILTestViewController class]];
    ILSettingItem *MoreMessage = [ILSettingArrowItem itemWithIcon:@"MoreMessage" title:@"查看消息" destVcClass:[ILTestViewController class]];
    ILSettingItem *MoreNetease = [ILSettingArrowItem itemWithIcon:@"MoreNetease" title:@"产品推荐" destVcClass:[ILProductViewController class]];
    ILSettingItem *MoreAbout = [ILSettingArrowItem itemWithIcon:@"MoreAbout" title:@"关于" destVcClass:[ILTestViewController class]];
    
    ILSettingGroup *group1 = [[ILSettingGroup alloc] init];
    group1.header = @"帮助";
    group1.items = @[newVersion,help,MoreShare,MoreMessage,MoreNetease,MoreAbout];
    
    [self.dataList addObject:group0];
    [self.dataList addObject:group1];
    
}

@end
