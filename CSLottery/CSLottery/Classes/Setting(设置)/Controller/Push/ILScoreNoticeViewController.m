//
//  ILScoreNoticeViewController.m
//  CSLottery
//
//  Created by niuwan on 15/5/6.
//  Copyright (c) 2015年 niuwan. All rights reserved.
//

#import "ILScoreNoticeViewController.h"
#import "ILSettingSwitchItem.h"
#import "ILSettingGroup.h"
#import "ILSettingLabelItem.h"
#import "ILSaveTool.h"

@interface ILScoreNoticeViewController ()

@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) ILSettingLabelItem *start;

@end

@implementation ILScoreNoticeViewController

- (UITextField *)textField
{
    if(_textField == nil){
        _textField = [[UITextField alloc] init];
        [self.view addSubview:_textField];
    }
    return _textField;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addGroup];
    
    //注册手势，为了退出键盘
    UITapGestureRecognizer *oneTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    oneTap.cancelsTouchesInView = NO;
    [self.tableView addGestureRecognizer:oneTap];
}
//退出键盘
- (void)dismissKeyboard
{
    [self.textField resignFirstResponder];
}

- (void)addGroup
{
    //group0
    ILSettingSwitchItem *notice = [ILSettingSwitchItem itemWithIcon:nil title:@"提醒我关注比赛"];
    
    ILSettingGroup *group = [[ILSettingGroup alloc] init];
    group.items = @[notice];
    group.footer = @"asdsad";
    [self.dataList addObject:group];
    
    //group1
    ILSettingLabelItem *start = [ILSettingLabelItem itemWithIcon:nil title:@"开始时间"];
    _start = start;
    if (!(start.text = [ILSaveTool objectForKey:_start.title])) {
        start.text = @"00:00";
    }
//    start.text = @"11:11";
    ILSettingGroup *group1 = [[ILSettingGroup alloc] init];
    group1.items = @[start];
    group1.header = @"group1 header";
    [self.dataList addObject:group1];
    //设置点击进入时间选择器
    start.option = ^{
        //1.初始化 datePicker
        UIDatePicker *datePicker = [[UIDatePicker alloc] init];
        //设置模式
        datePicker.datePickerMode = UIDatePickerModeTime;
        //设置地区
        datePicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
        //创建日期格式对象
        NSDateFormatter *dateF = [[NSDateFormatter alloc] init];
        dateF.dateFormat = @"HH:mm";
        //设置日期
        datePicker.date = [dateF dateFromString:_start.text];
        //监听UIDatePicker
        [datePicker addTarget:self action:@selector(valueChange:) forControlEvents:UIControlEventValueChanged];
        //2.利用textFiled 相应键盘
//        UITextField *textField = [[UITextField alloc] init];
        self.textField.inputView = datePicker;
        [self.textField becomeFirstResponder];
//        [self.view addSubview:textField];
        
    };
    
    //group2
    ILSettingLabelItem *stop = [ILSettingLabelItem itemWithIcon:nil title:@"结束时间"];
    stop.text = @"00:00";
    ILSettingGroup *group2 = [[ILSettingGroup alloc] init];
    group2.items = @[stop];
    
    [self.dataList addObject:group2];
    
}


- (void)valueChange:(UIDatePicker *)datePicker
{
    //根据datepicker值变化跟新 ui
    NSDateFormatter *dateF = [[NSDateFormatter alloc] init];
    dateF.dateFormat = @"HH:mm";
    _start.text = [dateF stringFromDate:datePicker.date];
    [self.tableView reloadData];
    //保存数据
    [ILSaveTool setObject:_start.text forKey:_start.title];
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
