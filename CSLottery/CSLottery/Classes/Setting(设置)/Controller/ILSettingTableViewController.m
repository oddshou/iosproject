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
#import "ILSettingCell.h"



@interface ILSettingTableViewController ()

@property (nonatomic, strong) NSMutableArray *dataList;

@end

@implementation ILSettingTableViewController

#pragma mark 初始化要显示的数据
- (NSMutableArray *)dataList
{
    if(_dataList == nil){
        _dataList = [NSMutableArray array];
        
        //0组 arrow item
        ILSettingArrowItem * pushNotice = [ILSettingArrowItem itemWithIcon:@"MorePush" title:@"推送和提醒"];
        pushNotice.destVcClass = [ILTestViewController class];

        ILSettingItem *yaoyiyao = [ILSettingSwitchItem itemWithIcon:@"handShake" title:@"摇一摇机选"];
        
        ILSettingGroup *group0 = [[ILSettingGroup alloc] init];
        group0.items = @[pushNotice, yaoyiyao];
        group0.header = @"header group0";
        group0.footer = @"footer group0";
        
        //1组 settingitem
        ILSettingItem *newVersion = [ILSettingArrowItem itemWithIcon:@"MoreUpdate" title:@"检查新版本"];
        
        ILSettingItem *help = [ILSettingArrowItem itemWithIcon:@"MoreHelp" title:@"帮助" destVcClass:[ILTestViewController class]];
        
        ILSettingItem *MoreShare = [ILSettingArrowItem itemWithIcon:@"MoreShare" title:@"分享" destVcClass:[ILTestViewController class]];
        ILSettingItem *MoreMessage = [ILSettingArrowItem itemWithIcon:@"MoreMessage" title:@"查看消息" destVcClass:[ILTestViewController class]];
        ILSettingItem *MoreNetease = [ILSettingArrowItem itemWithIcon:@"MoreNetease" title:@"产品推荐" destVcClass:[ILTestViewController class]];
        ILSettingItem *MoreAbout = [ILSettingArrowItem itemWithIcon:@"MoreAbout" title:@"关于" destVcClass:[ILTestViewController class]];
        
        ILSettingGroup *group1 = [[ILSettingGroup alloc] init];
        group1.header = @"帮助";
        group1.items = @[newVersion,help,MoreShare,MoreMessage,MoreNetease,MoreAbout];
        
        [_dataList addObject:group0];
        [_dataList addObject:group1];
        
        
    }
    
    return _dataList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (instancetype)init
{   //重写init方法，使默认生成 group tableview
    return [super initWithStyle:UITableViewStyleGrouped];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    
//    cell.imageView.image = [UIImage imageNamed:item.icon];
//    cell.textLabel.text = item.title;
    
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
    
    
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
