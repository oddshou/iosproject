//
//  ILTabBar.h
//  CSLottery
//
//  Created by niuwan on 15/5/4.
//  Copyright (c) 2015年 niuwan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ILTabBar;
@protocol ILTabBarDelegate <NSObject>
@required
- (void)tabBar:(ILTabBar *)tabBar didSelectedIndex:(int)index;

@end

@interface ILTabBar : UIView

@property (nonatomic, weak) id<ILTabBarDelegate> delegate;

- (void)addTabBarButtonWithName:(NSString *)name selName:(NSString *)selName;

@end
