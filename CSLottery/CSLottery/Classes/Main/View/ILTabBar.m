//
//  ILTabBar.m
//  CSLottery
//
//  Created by niuwan on 15/5/4.
//  Copyright (c) 2015年 niuwan. All rights reserved.
//

#import "ILTabBar.h"
#import "ILTabBarButton.h"


@interface ILTabBar ()

@property (nonatomic, weak) UIButton *selectedBtn;

@end

@implementation ILTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}


- (void)addTabBarButtonWithName:(NSString *)name selName:(NSString *)selName
{
    //创建按钮
    ILTabBarButton *btn = [ILTabBarButton buttonWithType:UIButtonTypeCustom];
    
    //设置button 图片
    [btn setBackgroundImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:selName] forState:UIControlStateSelected];
    
    //监听按钮点击
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    
    [self addSubview:btn];
}

- (void)btnClick:(UIButton *)button
{
    NSLog(@"click button %ld", (long)button.tag);
    _selectedBtn.selected = NO;
    button.selected = YES;
    _selectedBtn = button;
    
    [_delegate tabBar:self didSelectedIndex:button.tag];

}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat btnW = self.bounds.size.width / self.subviews.count;
    CGFloat btnH = self.bounds.size.height;
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    
    //设置按钮尺寸
    for (int i = 0; i < self.subviews.count; i++) {
        UIButton *btn = self.subviews[i];
        btn.tag = i;
        btnX = i *btnW;
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        
        if (i == 0) {
            [self btnClick:btn];
        }
        
    }
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
