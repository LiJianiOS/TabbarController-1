//
//  JTabBarViewController.m
//  自定义的TabbarController
//
//  Created by bcc_cae on 15-11-30.
//  Copyright (c) 2015年 bcc_cae. All rights reserved.
//

#import "JTabBarViewController.h"
#import "JTabbar.h"
#import "UIImage+Jimg.h"
#import "JhomepageTableViewController.h"
#import "JmessageTableViewController.h"
#import "JsquareTableViewController.h"
#import "JuserTableViewController.h"
#import "WBNavigationViewController.h"
#import "JComposeViewController.h"

@interface JTabBarViewController () <JTabBarDelegate>
//自定义的tabbar
@property (nonatomic,weak) JTabbar *jtabbar;

@end

@implementation JTabBarViewController

#pragma mark  --系统方法
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //初始化tabbar
    [self setupTabbar];
    
    //初始化所有子控件
    [self setUpAllChildViewController];
}

//删除初始化的控件
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
}

#pragma mark --自定义方法
//初始化tabbar
-(void)setupTabbar
{
    JTabbar *jtabbar = [[JTabbar alloc] init];
    jtabbar.frame = self.tabBar.bounds;
    
    jtabbar.delegate = self;
    [self.tabBar addSubview:jtabbar];
    self.jtabbar = jtabbar;
}

//初始化所有子控制器

-(void)setUpAllChildViewController
{
    //首页
    JhomepageTableViewController *home = [[JhomepageTableViewController alloc] init];
    //home.tabBarItem.badgeValue = @"10";
    [self setUpChildViewControlller:home title:@"首页" imageName:@"tabbar_home" selectedImageName:@"tabbar_home_selected"];
    
    
    JmessageTableViewController *message = [[JmessageTableViewController alloc] init];
    //message.tabBarItem.badgeValue = @"890";
    [self setUpChildViewControlller:message title:@"消息" imageName:@"tabbar_message_center" selectedImageName:@"tabbar_message_center_selected"];
    
    JsquareTableViewController *square = [[JsquareTableViewController alloc] init];
    //square.tabBarItem.badgeValue = @"8";
    [self setUpChildViewControlller:square title:@"广场" imageName:@"tabbar_discover" selectedImageName:@"tabbar_discover_selected"];
    
    
    JuserTableViewController *user = [[JuserTableViewController alloc] init];
    //user.tabBarItem.badgeValue = @"6";
    [self setUpChildViewControlller:user title:@"我" imageName:@"tabbar_profile" selectedImageName:@"tabbar_profile_selected"];
    
}

/**
 * 初始化子控制器
 */
-(void)setUpChildViewControlller:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    childVc.title = title;
    childVc.tabBarItem.image = [UIImage imageWithName:imageName];
    //选中图片的渲染方法
    if (IOS7) {
        
        childVc.tabBarItem.selectedImage = [[UIImage imageWithName:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }else{
        childVc.tabBarItem.selectedImage = [UIImage imageWithName:selectedImageName] ;
    }
    
    WBNavigationViewController *nav = [[WBNavigationViewController alloc] initWithRootViewController:childVc];
    [self addChildViewController:nav];
    
    //添加tabbar内部的按钮
    [self.jtabbar addTabBarButtonWithItem:childVc.tabBarItem];
    
}


#pragma mark --代理方法
/***
 监听Tabbar按钮的改变
 
 */
-(void)tabBar:(JTabbar *)tabBar didSelectedButtonFrom:(int)from to:(int)to
{
    //    NSLog(@"---%d---%d",from,to);
    self.selectedIndex = to;
}

-(void)tabBarDidClickPlusButton:(JTabbar *)tabBar
{
    JComposeViewController *compose = [[JComposeViewController alloc] init];
    
    WBNavigationViewController *nav = [[WBNavigationViewController alloc] initWithRootViewController:compose];
    [self presentViewController:nav animated:YES completion:nil];
}



@end
