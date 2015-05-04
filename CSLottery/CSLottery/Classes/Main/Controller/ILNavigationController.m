//
//  ILNavigationController.m
//  CSLottery
//
//  Created by niuwan on 15/5/4.
//  Copyright (c) 2015年 niuwan. All rights reserved.
//

#import "ILNavigationController.h"

@interface ILNavigationController ()

@end

@implementation ILNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

+ (void)initialize
{
    if (self == [ILNavigationController class]) {
        UINavigationBar *bar = [UINavigationBar appearance];
        UIImage *navImage = nil;
        //统一设置导航栏背景 此处应当做版本适配
        navImage = [UIImage imageNamed:@"NavBar64"];
        [bar setBackgroundImage:navImage forBarMetrics:UIBarMetricsDefault];
        
        //设置导航栏title 颜色背景
        NSDictionary *dict = @{
                               NSForegroundColorAttributeName : [UIColor whiteColor],
                               NSFontAttributeName  : [UIFont systemFontOfSize:15]
                               };
        [bar setTitleTextAttributes:dict];
        
        //设置导航条的主题颜色 更改导航条上 空间的颜色，对于 ios6又有不同，需单独适配
        [bar setTintColor:[UIColor whiteColor]];
//        [self setupBarButton];
    }
}

+ (void)setupBarButton
{
    //获取UIBarButton 外观
    UIBarButtonItem *buttonItem = [UIBarButtonItem appearance];
    //设置uibarButton的背景图片
    // 设置UIBarButton的背景图片
    [buttonItem setBackgroundImage:[UIImage imageNamed:@"NavButton"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [buttonItem setBackgroundImage:[UIImage imageNamed:@"NavButtonPressed"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
    
    // 设置返回按钮的背景图片
    [buttonItem setBackButtonBackgroundImage:[UIImage imageNamed:@"NavBackButton"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [buttonItem setBackButtonBackgroundImage:[UIImage imageNamed:@"NavBackButtonPressed"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
}

#pragma mark 控制跳转
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    viewController.hidesBottomBarWhenPushed = YES;
    return [super pushViewController:viewController animated:animated];
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
