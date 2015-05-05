//
//  ILLoginViewController.m
//  CSLottery
//
//  Created by niuwan on 15/5/4.
//  Copyright (c) 2015年 niuwan. All rights reserved.
//

#import "ILLoginViewController.h"
#import "ILSettingTableViewController.h"
#import "UIImage+Tool.h"

@interface ILLoginViewController ()
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation ILLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //设置登录按钮拉伸好的图片
    [_loginBtn setBackgroundImage:[UIImage imageWithResizableImageName:@"RedButton"] forState:UIControlStateNormal];
    [_loginBtn setBackgroundImage:[UIImage imageWithResizableImageName:@"RedButtonPressed"] forState:UIControlStateHighlighted];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)setting:(id)sender {
    ILSettingTableViewController *settingVc = [[ILSettingTableViewController alloc] init];
    [self.navigationController pushViewController:settingVc animated:YES];
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
