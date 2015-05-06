//
//  ILPushNoticeController.m
//  CSLottery
//
//  Created by niuwan on 15/5/6.
//  Copyright (c) 2015年 niuwan. All rights reserved.
//

#import "ILPushNoticeController.h"
#import "ILSettingArrowItem.h"
#import "ILSettingGroup.h"
#import "ILScoreNoticeViewController.h"


@interface ILPushNoticeController ()

@end

@implementation ILPushNoticeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //添加group
    [self addGroup];
}

- (void) addGroup
{
    
    // 0组
    ILSettingArrowItem *push = [ILSettingArrowItem itemWithIcon:nil title:@"开奖号码推送" destVcClass:nil];
    
    
    ILSettingItem *anim = [ILSettingArrowItem itemWithIcon:nil title:@"中奖动画"];
    
    ILSettingItem *score = [ILSettingArrowItem itemWithIcon:nil title:@"比分直播" destVcClass:[ILScoreNoticeViewController class]];
    ILSettingItem *timer = [ILSettingArrowItem itemWithIcon:nil title:@"购彩定时提醒"];
    
    ILSettingGroup *group0 = [[ILSettingGroup alloc] init];
    group0.items = @[push,anim,score,timer];
    
    [self.dataList addObject:group0];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
