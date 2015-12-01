//
//  JTabbar.h
//  自定义的TabbarController
//
//  Created by bcc_cae on 15-11-30.
//  Copyright (c) 2015年 bcc_cae. All rights reserved.
// 自定义的Tabbar

#import <UIKit/UIKit.h>

@class JTabbar;

@protocol JTabBarDelegate <NSObject>
//可选的代理方法
@optional
//监听按钮的点击
-(void)tabBar:(JTabbar *)tabBar didSelectedButtonFrom:(int)from to:(int)to;
-(void)tabBarDidClickPlusButton:(JTabbar *)tabBar;
@end

@interface JTabbar : UIView
-(void)addTabBarButtonWithItem:(UITabBarItem *)item;
@property (nonatomic,weak) id<JTabBarDelegate> delegate;

@end
