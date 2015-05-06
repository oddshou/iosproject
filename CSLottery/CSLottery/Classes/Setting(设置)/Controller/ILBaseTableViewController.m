//
//  ILBaseTableViewController.m
//  CSLottery
//
//  Created by niuwan on 15/5/6.
//  Copyright (c) 2015年 niuwan. All rights reserved.
//

#import "ILBaseTableViewController.h"
#import "ILSettingGroup.h"
#import "ILSettingCell.h"
#import "ILSettingArrowItem.h"

@interface ILBaseTableViewController ()


@end

@implementation ILBaseTableViewController


- (NSMutableArray *)dataList
{
    if (_dataList == nil) {
        _dataList = [NSMutableArray array];
    }
    return  _dataList;
}

- (instancetype)init
{   //重写init方法，使默认生成 group tableview
    return [super initWithStyle:UITableViewStyleGrouped];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return self.dataList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    ILSettingGroup *group = self.dataList[section];
    
    return group.items.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    
    ILSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(cell == nil){
        cell = [[ILSettingCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    ILSettingGroup *group = _dataList[indexPath.section];
    ILSettingItem *item = group.items[indexPath.row];
    
    cell.item = item;
    
    return cell;
}
#pragma  mark tableview 分组头标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    ILSettingGroup *group = _dataList[section];
    return group.header;
}

#pragma mark tableView 分组尾标题
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    ILSettingGroup *group = _dataList[section];
    return group.footer;
}

#pragma mark tableView 处理tableView行点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //取消选中
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //取出模型
    ILSettingGroup *group = self.dataList[indexPath.section];
    ILSettingItem *item = group.items[indexPath.row];
    //执行点击的block操作
    if (item.option) {
        item.option();
        return;
    }
    
    //执行点击跳转控制器操作
    if ([item isKindOfClass:[ILSettingArrowItem class]]) {
        ILSettingArrowItem *arrowItem = (ILSettingArrowItem *)item;
        
        if (arrowItem.destVcClass) {
            UIViewController *vc = [[arrowItem.destVcClass alloc] init];
            vc.title = item.title;
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
    
}


@end
