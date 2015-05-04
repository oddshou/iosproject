//
//  ILTabBarViewController.m
//  CSLottery
//
//  Created by niuwan on 15/5/4.
//  Copyright (c) 2015 niuwan. All rights reserved.
//

#import "ILTabBarViewController.h"
#import "ILTabBar.h"

@interface ILTabBarViewController () <ILTabBarDelegate>

@end

@implementation ILTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    ILTabBar *tabBar = [[ILTabBar alloc] init];
    tabBar.delegate = self;
    
    tabBar.frame = self.tabBar.bounds;
    [self.tabBar addSubview:tabBar];
    
    
    //添加button
    
    NSString *imgName = nil;
    NSString *selImageName = nil;
    
    for (int i = 0; i < self.childViewControllers.count; i++) {
        imgName = [NSString stringWithFormat:@"TabBar%d", i + 1];
        selImageName = [NSString stringWithFormat:@"TabBar%dSel", i + 1];
        [tabBar addTabBarButtonWithName:imgName selName:selImageName];
        NSLog(@"imgName %@ , selImageName %@", imgName, selImageName);
    }

}

- (void)tabBar:(ILTabBar *)tabBar didSelectedIndex:(int)index
{
    self.selectedIndex = index;
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
